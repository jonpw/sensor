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
#include "mqtt.h"
#include "lwip/timers.h"
#include "nrf_platform_port.h"
#include "app_util_platform.h"
#include "iot_timer.h"
#include "ipv6_medium.h"
#include "dns6_api.h"

#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"

#include "app_error.h"
#include "nfc_t4t_lib.h"
#include "nrf_log_ctrl.h"
#include "ndef_file_m.h"
#include "nfc_ndef_msg.h"

#include "nrf_delay.h"
#include "iot_common.h"
#include "ipv6_api.h"
#include "dns6_api.h"

// project's includes
#include "main.h"
#include "net.h"
#include "mqttapp.h"

static iot_interface_t      * mp_interface = NULL;                                                  /**< Pointer to IoT interface if any. */
static volatile app_state_t   m_app_state = STATE_APP_IDLE;                                         /**< State of application state machine. */

ipv6_addr_t m_broker_addr =
{
    .u8 =
    {0x20, 0x01, 0x0D, 0xB8,
     0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x00,
     0x00, 0x00, 0x00, 0x01}
};

eui64_t                                     eui64_local_iid;                                        /**< Local EUI64 value that is used as the IID for*/
static display_state_t                      m_display_state = LEDS_INACTIVE;                        /**< Board LED display state. */
static bool                                 m_led_state  = false;                                   /**< LED state. This is the topic being published by the example MQTT client. */
static bool                                 m_do_ind_err = false;
static uint8_t                              m_ind_err_count = 0;

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
    LEDS_CONFIGURE(ALL_APP_LED);

    // Turn off all LED on initialization.
    LEDS_OFF(ALL_APP_LED);
}


/**@brief Timer callback used for controlling board LEDs to represent application state.
 *
 * @param[in]   wall_clock_value   The value of the wall clock that triggered the callback.
 */
static void blink_timeout_handler(iot_timer_time_in_ms_t wall_clock_value)
{
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
            LEDS_OFF(LED_R);
            m_do_ind_err = false;
            m_ind_err_count = 0;
        }
    }

    switch (m_display_state)
    {
        case LEDS_INACTIVE:
        {
            LEDS_OFF(ALL_APP_LED);
            break;
        }
        case LEDS_CONNECTABLE:
        {
            LEDS_INVERT(LED_B);
            LEDS_OFF(LED_R);
            LEDS_OFF(LED_G);
            break;
        }
        case LEDS_IPV6_IF_DOWN:
        {
            LEDS_ON(LED_B);
            LEDS_OFF(LED_R);
            LEDS_OFF(LED_G);
            break;
        }
        case LEDS_IPV6_IF_UP:
        {
            LEDS_INVERT(LED_G);
            LEDS_OFF(LED_R);
            LEDS_OFF(LED_B);
            break;
        }
        case LEDS_CONNECTED_TO_BROKER:
        {
            LEDS_ON(LED_G);
            LEDS_OFF(LED_R);
            LEDS_OFF(LED_B);
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
    if (button_action == APP_BUTTON_PUSH)
    {
        switch (pin_no)
        {
            case BSP_BUTTON_0:
            {
                mqtt_publish_message_t pubmsg;
                pubmsg.topic.qos = MQTT_QoS_2_EACTLY_ONCE;
                pubmsg.topic.topic.p_utf_str = (uint8_t *)TOPIC_BUTTON_1;
                pubmsg.topic.topic.utf_strlen = strlen(TOPIC_BUTTON_1);
                pubmsg.payload.p_bin_str = MSG_BUTTON_PRESSED;
                pubmsg.payload.bin_strlen = strlen(MSG_BUTTON_PRESSED);
                app_mqtt_publish(&pubmsg);
                break;
            }
            case BSP_BUTTON_1:
            {
                mqtt_publish_message_t pubmsg;
                pubmsg.topic.qos = MQTT_QoS_2_EACTLY_ONCE;
                pubmsg.topic.topic.p_utf_str = (uint8_t *)TOPIC_BUTTON_2;
                pubmsg.topic.topic.utf_strlen = strlen(TOPIC_BUTTON_2);
                pubmsg.payload.p_bin_str = MSG_BUTTON_PRESSED;
                pubmsg.payload.bin_strlen = strlen(MSG_BUTTON_PRESSED);
                app_mqtt_publish(&pubmsg);
                break;
            }
            case BSP_BUTTON_2:
            {
                mqtt_publish_message_t pubmsg;
                pubmsg.topic.qos = MQTT_QoS_2_EACTLY_ONCE;
                pubmsg.topic.topic.p_utf_str = (uint8_t *)TOPIC_BUTTON_3;
                pubmsg.topic.topic.utf_strlen = strlen(TOPIC_BUTTON_3);
                pubmsg.payload.p_bin_str = MSG_BUTTON_PRESSED;
                pubmsg.payload.bin_strlen = strlen(MSG_BUTTON_PRESSED);
                app_mqtt_publish(&pubmsg);
                break;
            }
            case BSP_BUTTON_3:
            {
                mqtt_publish_message_t pubmsg;
                pubmsg.topic.qos = MQTT_QoS_2_EACTLY_ONCE;
                pubmsg.topic.topic.p_utf_str = (uint8_t *)TOPIC_BUTTON_4;
                pubmsg.topic.topic.utf_strlen = strlen(TOPIC_BUTTON_4);
                pubmsg.payload.p_bin_str = MSG_BUTTON_PRESSED;
                pubmsg.payload.bin_strlen = strlen(MSG_BUTTON_PRESSED);
                app_mqtt_publish(&pubmsg);
                break;
            }            
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
        {BSP_BUTTON_0,        false, BUTTON_PULL, button_event_handler},
        {BSP_BUTTON_1,        false, BUTTON_PULL, button_event_handler},
        {BSP_BUTTON_2,        false, BUTTON_PULL, button_event_handler},
        {BSP_BUTTON_3,        false, BUTTON_PULL, button_event_handler},
    };

    #define BUTTON_DETECTION_DELAY APP_TIMER_TICKS(50)

    err_code = app_button_init(buttons, sizeof(buttons) / sizeof(buttons[0]), BUTTON_DETECTION_DELAY);
    APP_ERROR_CHECK(err_code);

    err_code = app_button_enable();
    APP_ERROR_CHECK(err_code);
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
}


/**@brief Function for initializing the IoT Timer. */
static void iot_timer_init(void)
{
    uint32_t err_code;

    static const iot_timer_client_t list_of_clients[] =
    {
        {system_timer_callback,   LWIP_SYS_TICK_MS},
        {blink_timeout_handler,   LED_BLINK_INTERVAL_MS},
        {dns6_timeout_process,    SEC_TO_MILLISEC(DNS6_RETRANSMISSION_INTERVAL)},
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

    if (m_app_state == STATE_APP_IDLE)
    {
        if (p_event_data->evt_type == STATE_EVENT_GO)
        {
            net_init(); // -> mqtt + dns init
            nfc_init();
            m_app_state = STATE_APP_STARTING;
        }
    } else if (m_app_state == STATE_APP_CONNECTABLE)
    {
        if (p_event_data->evt_type == STATE_EVENT_CONNECTED)
        {
            dns_lookup(BROKER_HOSTNAME);
            m_app_state = STATE_APP_DNS_LOOKUP;
        }
    } else if (m_app_state == STATE_APP_DNS_LOOKUP)
    {
        if (p_event_data->evt_type == STATE_EVENT_DNS_OK)
        {
            memcpy(m_broker_addr.u8, ((ipv6_addr_t *)(p_event_data->data))->u8, IPV6_ADDR_SIZE);
            mqtt_begin(); // todo: should we pass a param for the dns result?
            m_app_state = STATE_APP_MQTT_CONNECTING;
        }
    } else if (m_app_state == STATE_APP_MQTT_CONNECTING)
    {
        if (p_event_data->evt_type == STATE_EVENT_MQTT_CONNECT)
        {
            // todo: should we handle initial pubs here?
            m_app_state = STATE_APP_ACTIVE_IDLE;
        }
    } else if (m_app_state == STATE_APP_ACTIVE_IDLE)
    {
        if (p_event_data->evt_type == STATE_EVENT_MQTT_DISCONNECT)
            {
                //todo: reconnect or wait a bit?
                m_app_state = STATE_APP_FAULT;
            }
        else if (p_event_data->evt_type == STATE_EVENT_CONNECTION_LOST)
        {
            //todo: reconnect? 
            m_app_state = STATE_APP_FAULT;
        }

    } else if (m_app_state == STATE_APP_NFC)
    {
        if (p_event_data->evt_type == STATE_EVENT_NFC_RESUME)
            {
                //todo: reconnect or wait a bit?
                m_app_state = STATE_APP_FAULT;
            }
        else if (p_event_data->evt_type == STATE_EVENT_NFC_RESET)
        {
            // 
            app_mqtt_stop();
            net_stop();
            //m_app_state;
        }
    }

}

/**
 * @brief Function for application main entry.
 */
int main(void)
{
    uint32_t err_code;

    // Common initialize.
    log_init();
    scheduler_init();

    leds_init();
    timers_init();
    iot_timer_init();
    button_init();

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
