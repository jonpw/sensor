/**
 * Copyright (c) 2013 - 2017, Nordic Semiconductor ASA
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 * 
 * 2. Redistributions in binary form, except as embedded into a Nordic
 *    Semiconductor ASA integrated circuit in a product or a software update for
 *    such product, must reproduce the above copyright notice, this list of
 *    conditions and the following disclaimer in the documentation and/or other
 *    materials provided with the distribution.
 * 
 * 3. Neither the name of Nordic Semiconductor ASA nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 * 
 * 4. This software, with or without modification, must only be used with a
 *    Nordic Semiconductor ASA integrated circuit.
 * 
 * 5. Any software provided in binary form under this license must not be reverse
 *    engineered, decompiled, modified and/or disassembled.
 * 
 * THIS SOFTWARE IS PROVIDED BY NORDIC SEMICONDUCTOR ASA "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY, NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 */
/** @file
 *
 * @defgroup iot_sdk_app_mqtt_client main.c
 * @{
 * @ingroup iot_sdk_app_lwip
 *
 * @brief This file contains the source code for LwIP based MQTT Client sample application.
 *        This example publishes the topic "led/state" on button press.
 *        Value of 0 or 1 is published as data for the topic based on LED is turned ON or OFF
 *        on button press.
 */

#include <stdbool.h>
#include <stdint.h>
#include "boards.h"
#include "nordic_common.h"
#include "sdk_config.h"
#include "nrf_sdm.h"
#include "app_scheduler.h"
#include "app_timer.h"
#include "app_button.h"
#include "lwip/init.h"
#include "lwip/inet6.h"
#include "lwip/ip6.h"
#include "lwip/ip6_addr.h"
#include "lwip/netif.h"
#include "lwip/dns.h"
#include "mqtt.h"
#include "lwip/timers.h"
#include "nrf_platform_port.h"
#include "app_util_platform.h"
#include "ipv6_medium.h"
#include "iot_timer.h"

#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"

#include "app_error.h"
#include "nfc_t4t_lib.h"
#include "nrf_log_ctrl.h"
#include "ndef_file_m.h"
#include "nfc_ndef_msg.h"

#include "cJSON.h"

#include "nrf_delay.h"
#include "iot_common.h"

// project's includes
#include "main.h"
#include "net.h"
#include "mqttapp.h"
#include "mydns.h"
#include "nrf_temp.h"
#include "app-spi.h"

#include "hvac.h"

//static iot_interface_t      * mp_interface = NULL;                                                  /**< Pointer to IoT interface if any. */
static volatile app_state_t   m_app_state = STATE_APP_IDLE;                                         /**< State of application state machine. */

eui64_t                                     eui64_local_iid;                                        /**< Local EUI64 value that is used as the IID for*/
static display_state_t                      m_display_state = LEDS_INACTIVE;                        /**< Board LED display state. */
static bool                                 m_led_state  = false;                                   /**< LED state. This is the topic being published by the example MQTT client. */
static bool                                 m_do_ind_err = false;
static uint8_t                              m_ind_err_count = 0;
static uint8_t                              m_led_divide = 0;


static const char * m_topic_button_1 = TOPIC_BUTTON_1;
static const char * m_topic_button_2 = TOPIC_BUTTON_2;
#if defined(PCA252432)
static const char * m_topic_button_3 = TOPIC_BUTTON_3;
static const char * m_topic_button_4 = TOPIC_BUTTON_4;
#endif
static const char * m_topic_control = TOPIC_CONTROL;
static const char * m_message_pressed = MSG_BUTTON_PRESSED;

/**@brief Callback function for asserts in the SoftDevice.
 *
 * @details This function will be called in case of an assert in the SoftDevice.
 *
 * @warning This handler is an example only and does not fit a final product. You need to analyze
 *          how your product is supposed to react in case of Assert.
 * @warning On assert from the SoftDevice, the system can only recover on reset.
 *
 * @param[in]   line_num   Line number of the failing ASSERT call.
 * @param[in]   file_name  File name of the failing ASSERT call.
 */
void assert_nrf_callback(uint16_t line_num, const uint8_t * p_file_name)
{
    app_error_handler(DEAD_BEEF, line_num, p_file_name);
}

/**@brief Function for the Event Scheduler initialization.
 */
static void scheduler_init(void)
{
    APP_SCHED_INIT(SCHED_MAX_EVENT_DATA_SIZE, SCHED_QUEUE_SIZE);
}

/**@brief Function for the LEDs initialization.
 *
 * @details Initializes all LEDs used by this application.
 */
static void leds_init(void)
{
    // Configure application LED pins.
    bsp_board_leds_init();

    // Turn off all LED on initialization.
    m_display_state = LEDS_INACTIVE;
    bsp_board_leds_off();
}

/**@brief Timer callback used for controlling board LEDs to represent application state.
 *
 * @param[in]   wall_clock_value   The value of the wall clock that triggered the callback.
 */
static void blink_timeout_handler(iot_timer_time_in_ms_t wall_clock_value)
{
    if (m_led_divide < 8)
    {
        ++m_led_divide;    
    }
    else
    {
        m_led_divide = 0;
    }
    
    UNUSED_PARAMETER(wall_clock_value);
    if (m_do_ind_err == true)
    {
        // Flash LED_THREE for three periods if error occurs.
        if (m_ind_err_count < 3)
        {
            ++m_ind_err_count;
        }
        else
        {
            bsp_board_led_on(0);
            m_do_ind_err = false;
            m_ind_err_count = 0;
        }
    }

    switch (m_display_state)
    {
        case LEDS_INACTIVE:
        {
            bsp_board_led_invert(0);
            bsp_board_led_invert(1);
            bsp_board_led_invert(2);
            break;
        }
        case LEDS_CONNECTABLE:
        {
            bsp_board_led_off(0);
            bsp_board_led_off(1);
            bsp_board_led_invert(2);
            break;
        }
        case LEDS_CONNECTED:
        {
            bsp_board_led_off(0);
            bsp_board_led_off(1);
            bsp_board_led_on(2);
            break;
        }
        case LEDS_MQTT_CONNECTING:
        {
            bsp_board_led_off(0);
            bsp_board_led_invert(1);
            bsp_board_led_off(2);
            break;
        }
        case LEDS_MQTT_FAIL:
        {
            bsp_board_led_on(0);
            bsp_board_led_off(1);
            bsp_board_led_off(2);
            break;
        }
        case LEDS_ACTIVE_IDLE:
        {
            bsp_board_led_off(0);

            if (m_led_divide == 0)
            {
            bsp_board_led_on(1);    
            }
            else
            {
             bsp_board_led_off(1);
            }
            
            bsp_board_led_off(2);
            break;
        }
        case LEDS_DNS_FAIL:
        {
            bsp_board_led_invert(0);
            bsp_board_led_off(1);
            bsp_board_led_off(2);
            break;
        }

        default:
        {
            break;
        }
    }
}

static void button_event_handler(uint8_t pin_no, uint8_t button_action)
{
    uint32_t err_code;

    if (button_action == APP_BUTTON_PUSH)
    {
            /*if (m_app_state == STATE_APP_DNS_LOOKUP)
            {
                mqtt_begin(&ipaddr_last_dns);
                return;
            }*/

        switch (pin_no)
        {
            case BSP_BUTTON_0:
            {
                mqtt_publish_message_t pubmsg;
                pubmsg.topic.qos = MQTT_QoS_2_EACTLY_ONCE;
                pubmsg.topic.topic.p_utf_str = strcpy(pubmsg.topic.topic.p_utf_str, m_topic_button_1);
                pubmsg.topic.topic.utf_strlen = strlen(pubmsg.topic.topic.p_utf_str);
                pubmsg.payload.p_bin_str = strcpy(pubmsg.payload.p_bin_str, m_message_pressed);
                pubmsg.payload.bin_strlen = strlen(pubmsg.payload.p_bin_str);
                app_mqtt_publish(&pubmsg);
                break;

            }
            case BSP_BUTTON_1:
            {
                //mqtt_begin(&ipaddr_last_dns);
                hvac_transmit();
                /*
                mqtt_publish_message_t pubmsg;
                pubmsg.topic.qos = MQTT_QoS_2_EACTLY_ONCE;
                pubmsg.topic.topic.p_utf_str = strcpy(pubmsg.topic.topic.p_utf_str, m_topic_button_2);
                pubmsg.topic.topic.utf_strlen = strlen(pubmsg.topic.topic.p_utf_str);
                pubmsg.payload.p_bin_str = strcpy(pubmsg.payload.p_bin_str, m_message_pressed);
                pubmsg.payload.bin_strlen = strlen(pubmsg.payload.p_bin_str);
                app_mqtt_publish(&pubmsg);*/
                break;
            }
        
            #if defined(PCA252432)
            case BSP_BUTTON_2:
            {
                hvac_transmit();
                /*mqtt_publish_message_t pubmsg;
                pubmsg.topic.qos = MQTT_QoS_2_EACTLY_ONCE;
                pubmsg.topic.topic.p_utf_str = strcpy(pubmsg.topic.topic.p_utf_str, m_topic_button_3);
                pubmsg.topic.topic.utf_strlen = strlen(pubmsg.topic.topic.p_utf_str);
                pubmsg.payload.p_bin_str = strcpy(pubmsg.payload.p_bin_str, m_message_pressed);
                pubmsg.payload.bin_strlen = strlen(pubmsg.payload.p_bin_str);
                app_mqtt_publish(&pubmsg);*/
                break;
            }
            case BSP_BUTTON_3:
            {
                mqtt_publish_message_t pubmsg;
                pubmsg.topic.qos = MQTT_QoS_2_EACTLY_ONCE;
                pubmsg.topic.topic.p_utf_str = strcpy(pubmsg.topic.topic.p_utf_str, m_topic_button_4);
                pubmsg.topic.topic.utf_strlen = strlen(pubmsg.topic.topic.p_utf_str);
                pubmsg.payload.p_bin_str = strcpy(pubmsg.payload.p_bin_str, m_message_pressed);
                pubmsg.payload.bin_strlen = strlen(pubmsg.payload.p_bin_str);
                app_mqtt_publish(&pubmsg);                
                break;
            }            
            #endif
            default:
                break;
        }
    }
}

static void button_init(void)
{
    uint32_t err_code;

    static app_button_cfg_t buttons[] =
    {
        
        {BSP_BUTTON_0, APP_BUTTON_ACTIVE_LOW, NRF_GPIO_PIN_PULLUP, button_event_handler},
        {BSP_BUTTON_1, APP_BUTTON_ACTIVE_LOW, NRF_GPIO_PIN_PULLUP, button_event_handler},
        #if defined(PCA252432)
        {BSP_BUTTON_2, APP_BUTTON_ACTIVE_LOW, NRF_GPIO_PIN_PULLUP, button_event_handler},
        {BSP_BUTTON_3, APP_BUTTON_ACTIVE_LOW, NRF_GPIO_PIN_PULLUP, button_event_handler},
        #endif
    };

    #define BUTTON_DETECTION_DELAY APP_TIMER_TICKS(10)

    err_code = app_button_init(buttons, BUTTONS_NUMBER, BUTTON_DETECTION_DELAY);
    APP_ERROR_CHECK(err_code);

    err_code = app_button_enable();
    APP_ERROR_CHECK(err_code);
    //nrf_gpio_cfg(BSP_BUTTON_3, NRF_GPIO_PIN_DIR_INPUT, NRF_GPIO_PIN_INPUT_CONNECT, NRF_GPIO_PIN_PULLUP, NRF_GPIO_PIN_S0S1, NRF_GPIO_PIN_SENSE_LOW);
}

/**@brief Timer callback used for periodic servicing of LwIP protocol timers.
 *        This trigger is also used in the example to trigger sending TCP Connection.
 *
 * @details Timer callback used for periodic servicing of LwIP protocol timers.
 *
 * @param[in]   wall_clock_value   The value of the wall clock that triggered the callback.
 */
static void system_timer_callback(iot_timer_time_in_ms_t wall_clock_value)
{
    UNUSED_VARIABLE(wall_clock_value);

    sys_check_timeouts();
    UNUSED_VARIABLE(mqtt_live());
}

static void mqtt_timer_callback(void * p_context)
{
    UNUSED_VARIABLE(p_context);
    uint32_t err_code;
    //app_dns_lookup(broker_hostname);
    APPL_LOG("mqtt callback: Connecting to %08X%08X%08X%08X", ipaddr_last_dns.addr[0], ipaddr_last_dns.addr[1], ipaddr_last_dns.addr[2], ipaddr_last_dns.addr[3]);
                err_code       = app_sched_event_put(&ipaddr_last_dns, sizeof(ipaddr_last_dns), mqtt_begin);
    APP_ERROR_CHECK(err_code);

}

/**@brief Function for updating the wall clock of the IoT Timer module.
 *
 * @param[in]   p_context   Pointer used for passing context. No context used in this application.
 */
static void iot_timer_tick_callback(void * p_context)
{
    UNUSED_VARIABLE(p_context);

    uint32_t err_code = iot_timer_update();
    APP_ERROR_CHECK(err_code);
}

#if defined(PCA252432)
void app_sched_pub_temp(void)
{
    char * json_string;
    cJSON *root = cJSON_CreateObject();
    cJSON_AddNumberToObject(root, "x", accdata.x);
    cJSON_AddNumberToObject(root, "y", accdata.y);
    cJSON_AddNumberToObject(root, "z", accdata.z);
    cJSON_AddNumberToObject(root, "t", accdata.t);
    json_string = cJSON_PrintUnformatted(root);
    cJSON_Delete(root);

    mqtt_publish_message_t pubmsg;
    pubmsg.topic.qos = MQTT_QoS_2_EACTLY_ONCE;
    pubmsg.topic.topic.p_utf_str = "archer/data";
    pubmsg.topic.topic.utf_strlen = strlen("archer/data");
    pubmsg.payload.p_bin_str = json_string;
    pubmsg.payload.bin_strlen = strlen(json_string);
    app_mqtt_publish(&pubmsg);
}
#endif

/**@brief Function for the Timer initialization.
 *
 * @details Initializes the timer module. This creates and starts application timers.
 */
static void timers_init(void)
{
    uint32_t err_code;

    // Initialize timer module.
    APP_ERROR_CHECK(app_timer_init());

    // Create a sys timer.
    err_code = app_timer_create(&m_iot_timer_tick_src_id,
                                APP_TIMER_MODE_REPEATED,
                                iot_timer_tick_callback);

    APP_ERROR_CHECK(err_code);

    err_code = app_timer_create(&m_mqtt_connect_timer,
                                APP_TIMER_MODE_SINGLE_SHOT,
                                mqtt_timer_callback);
    APP_ERROR_CHECK(err_code);  
}

/**@brief Function for initializing the IoT Timer. */
static void iot_timer_init(void)
{
    uint32_t err_code;

    static const iot_timer_client_t list_of_clients[] =
    {
        {system_timer_callback,   LWIP_SYS_TICK_MS},
        {blink_timeout_handler,   LED_BLINK_INTERVAL_MS}
    };

    // The list of IoT Timer clients is declared as a constant.
    static const iot_timer_clients_list_t iot_timer_clients =
    {
        (sizeof(list_of_clients) / sizeof(iot_timer_client_t)),
        &(list_of_clients[0]),
    };

    // Passing the list of clients to the IoT Timer module.
    err_code = iot_timer_client_list_set(&iot_timer_clients);
    APP_ERROR_CHECK(err_code);

    // Starting the app timer instance that is the tick source for the IoT Timer.
    err_code = app_timer_start(m_iot_timer_tick_src_id,
                               APP_TIMER_TICKS(IOT_TIMER_RESOLUTION_IN_MS),
                               NULL);
    APP_ERROR_CHECK(err_code);
}

/**@brief Function for initializing the nrf log module.
 */
static void log_init(void)
{
    ret_code_t err_code = NRF_LOG_INIT(NULL);
    APP_ERROR_CHECK(err_code);

    NRF_LOG_DEFAULT_BACKENDS_INIT();
}

// app_state_update called when events occur that should update the main app state
// sub-states should be updated before calling this
void app_state_update(app_state_event_data_t * p_event_data, uint16_t event_size)
{
    ip_addr_t * ipaddr = BROKER_MOSQUITTO;
    ret_code_t err_code;
    if (p_event_data->evt_type == STATE_EVENT_GO)
    {        
        m_app_state = STATE_APP_CONNECTABLE;
        m_display_state = LEDS_CONNECTABLE;
    }
    else if (p_event_data->evt_type == STATE_EVENT_CONNECTED)
    {
        m_display_state = LEDS_CONNECTED;
        m_app_state = STATE_APP_DNS_LOOKUP;
        err_code = app_timer_start(m_mqtt_connect_timer, APP_TIMER_TICKS(3000), NULL);
        APP_ERROR_CHECK(err_code);       
    }
    else if (p_event_data->evt_type == STATE_EVENT_DNS_OK)
    {
        m_display_state = LEDS_MQTT_CONNECTING;
        m_app_state = STATE_APP_MQTT_CONNECTING;
            err_code       = app_sched_event_put(&ipaddr_last_dns, sizeof(&ipaddr_last_dns), mqtt_begin);
    APP_ERROR_CHECK(err_code);
    }
    else if (p_event_data->evt_type == STATE_EVENT_DNS_FAIL)
    {
        m_display_state = LEDS_DNS_FAIL;
        m_app_state = STATE_APP_FAULT;
                err_code = app_timer_start(m_mqtt_connect_timer, APP_TIMER_TICKS(3000), NULL);
        APP_ERROR_CHECK(err_code);   
    }
    else if (p_event_data->evt_type == STATE_EVENT_MQTT_CONNECT_FAILED)
    {
        m_display_state = LEDS_MQTT_FAIL;
        err_code       = app_sched_event_put(&ipaddr_last_dns, sizeof(&ipaddr_last_dns), mqtt_begin);
        APP_ERROR_CHECK(err_code);
        m_app_state = STATE_APP_MQTT_CONNECTING;
    }
    else if (p_event_data->evt_type == STATE_EVENT_MQTT_CONNECT)
    {   
        m_display_state = LEDS_ACTIVE_IDLE;
        m_app_state = STATE_APP_ACTIVE_IDLE;
        app_timer_stop(m_mqtt_connect_timer);
        mqtt_topic_t topic;
        topic.qos = MQTT_QoS_1_ATLEAST_ONCE;
        char subtopic[32];
        //topic.topic.utf_strlen = sprintf(subtopic, "%s%s", topic_base, "#");
        strcpy(subtopic, topic_base);
        strcat(subtopic, "#");
        topic.topic.utf_strlen = strlen(subtopic);
        APPL_LOG("sub to: %s %s %s, %i", topic_base, "#", subtopic, topic.topic.utf_strlen);
        topic.topic.p_utf_str = subtopic;
        app_mqtt_subscribe(&topic);
        // todo: should we handle initial pubs here?
    }
    else if (p_event_data->evt_type == STATE_EVENT_MQTT_DISCONNECT)
    {
        m_display_state = LEDS_MQTT_CONNECTING;
        err_code = app_timer_start(m_mqtt_connect_timer, APP_TIMER_TICKS(3000), NULL);
        APP_ERROR_CHECK(err_code);
        m_app_state = STATE_APP_FAULT;
    }   
    else if (p_event_data->evt_type == STATE_EVENT_CONNECTION_LOST)
    {
        m_display_state = LEDS_CONNECTABLE;
        //todo: reconnect? 
        m_app_state = STATE_APP_FAULT;
    }
    else if (p_event_data->evt_type == STATE_EVENT_NFC_RESUME)
    {
        m_display_state = LEDS_ACTIVE_IDLE;
        //todo: reconnect or wait a bit?
        m_app_state = STATE_APP_FAULT;
    }
    else if (p_event_data->evt_type == STATE_EVENT_NFC_RESET)
    {
        //app_mqtt_stop();
        //net_stop();
        m_display_state = LEDS_CONNECTABLE;
        m_app_state = STATE_APP_IDLE;
    }
    else if (p_event_data->evt_type == STATE_EVENT_NFC) // async NFC event
    {
        m_display_state = LEDS_NFC;
        m_app_state = STATE_APP_NFC;
        // todo: pause everything?
    }
}

/**
 * @brief Function for application main entry.
 */
int main(void)
{
    uint32_t err_code;
    uint32_t x;

    bsp_board_led_on(1);
    nrf_delay_ms(50);
    bsp_board_led_off(1);
    nrf_delay_ms(50);

    // Common initialize.
    log_init();
    scheduler_init();

    leds_init();
    timers_init();
    iot_timer_init();
    button_init();
    //    nrf_temp_init(); // sd memory conflict issue
    #ifdef PCA252432
    //  bma280_spi_init();
    #endif
    bma280_spi_init();
    //memcpy(&m_broker_addr.addr, INITIAL_BROKER_ADDR, sizeof(INITIAL_BROKER_ADDR));
    m_display_state = LEDS_INACTIVE;
    m_app_state = STATE_APP_IDLE;

    nfc_main_init();

    net_init();

    m_app_state = STATE_APP_CONNECTABLE;
    m_display_state = LEDS_CONNECTABLE;

    //app_state_event_data_t state_update;
    //state_update.evt_type   = STATE_EVENT_GO;
    //err_code       = app_sched_event_put(&state_update, sizeof(app_state_event_data_t), app_state_update);
    //APP_ERROR_CHECK(err_code);

    bsp_board_leds_off();

    #ifdef PCA662504
    hvac_init();
    // 
    #endif

        return_values_init err_code32 = bsec_iot_init(BSEC_SAMPLE_RATE_LP, 0, bme680_write, bme680_read, bme680_sleep, bsec_file_load, bsec_config_file_load);
        APPL_LOG("bsec_iot_init returned %i", err_code32.bsec_status);
        bsec_iot_init2(bme680_sleep, get_timestamp_us, bsec_data_callback, bsec_file_update, 100);
        //APPL_LOG("bsec_iot_init2 returned %i", err_code);



    // Enter main loop.
    for (;;)
    {
        app_sched_execute();

        if (NRF_LOG_PROCESS() == false)
        {
            // Sleep waiting for an application event.
            err_code = sd_app_evt_wait();
            APP_ERROR_CHECK(err_code);
        }
    }
}

/**
 * @}
 */
