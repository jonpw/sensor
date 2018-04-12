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

#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"

#include "main.h"
#include "mqttapp.h"

//char broker_hostname[32] = "broker.hivemq.org";
char broker_hostname[32] = "archer.local";

uint16_t m_broker_port = 8883;       /**< Port number of MQTT Broker being used. */

// TODO: make mqtt client id unique e.g. based on hardware serial # or hash thereof
char                           m_client_id[] = "testapp123456";                         /**< Unique MQTT client identifier. */

//uint8_t identity[] = {0x43, 0x6c, 0x69, 0x65, 0x6e, 0x74, 0x5f, 0x69, 0x64, 0x65, 0x6e, 0x74, 0x69, 0x74, 0x79};
const uint8_t identity[] = "testapp123456";
const uint8_t shared_secret[] = {0x73, 0x65, 0x63, 0x72, 0x65, 0x74, 0x50, 0x53, 0x4b};

char mqtt_username[16] = "user";
char mqtt_password[16] = "pass";
mqtt_username_t m_mqtt_username = {.p_utf_str = &mqtt_username, .utf_strlen = 0};
mqtt_password_t m_mqtt_password = {.p_utf_str = &mqtt_password, .utf_strlen = 0};


nrf_tls_preshared_key_t m_preshared_key = {
    .p_identity     = &identity[0],
    .p_secret_key   = &shared_secret[0],
    .identity_len   = 13,
    .secret_key_len = 9
};

nrf_tls_key_settings_t m_tls_keys = {
    .p_psk = &m_preshared_key
};

eui64_t                                     eui64_local_iid;                                        /**< Local EUI64 value that is used as the IID for*/
static mqtt_client_t                        m_app_mqtt_client;                                      /**< MQTT Client instance reference provided by the MQTT module. */
// TODO: make mqtt client id unique e.g. based on hardware serial # or hash thereof
static mqtt_state_t                     mqtt_state = STATE_MQTT_IDLE;               /**< MQTT Connection state. */
static uint8_t                              m_ind_err_count = 0;
static uint16_t                             m_message_counter = 1;                                  /**< Message counter used to generated message ids for MQTT messages. */
static uint16_t                             m_sub_message_id = 1;

static void app_mqtt_connect(ip_addr_t * ipaddr);
void app_mqtt_evt_handler(mqtt_client_t * const p_client, const mqtt_evt_t * p_evt);

//TODO: Preliminary mqtt_begin
void mqtt_begin(ip_addr_t * ipaddr)
{
    APPL_LOG("mqtt_begin: Connecting to %32X", ipaddr->addr);
    mqtt_state = STATE_MQTT_CONNECTING;
    app_mqtt_connect(ipaddr);
}

/**@brief Connect to MQTT broker. */
static void app_mqtt_connect(ip_addr_t * ipaddr)
{
    uint32_t err_code;
    mqtt_client_init(&m_app_mqtt_client);
    memcpy(m_app_mqtt_client.broker_addr.u32, ipaddr->addr, IPV6_ADDR_SIZE);
    m_app_mqtt_client.broker_port          = m_broker_port;
    m_app_mqtt_client.evt_cb               = app_mqtt_evt_handler;
    m_app_mqtt_client.client_id.p_utf_str  = (uint8_t *)m_client_id;
    m_app_mqtt_client.client_id.utf_strlen = strlen(m_client_id);
    m_mqtt_password.utf_strlen = strlen(m_mqtt_password.p_utf_str);
    m_app_mqtt_client.p_password           = &m_mqtt_password;
    m_mqtt_username.utf_strlen = strlen(m_mqtt_username.p_utf_str);
    m_app_mqtt_client.p_user_name          = &m_mqtt_username;
    //memcpy(m_app_mqtt_client.p_password, mqtt_password, strlen(mqtt_password));
    //memcpy(m_app_mqtt_client.p_user_name, mqtt_username, strlen(mqtt_username));
    //m_app_mqtt_client.transport_type       = MQTT_TRANSPORT_SECURE;
    m_app_mqtt_client.transport_type       = MQTT_TRANSPORT_NON_SECURE;
    m_app_mqtt_client.p_security_settings  = &m_tls_keys;
    err_code = mqtt_connect(&m_app_mqtt_client);
    APPL_LOG("app_mqtt_connect: mqtt_connect returned %i", err_code);
}


/**@brief Publishes LED state to MQTT broker.
 *
 * @param[in]   led_state   LED state being published.
 */
void app_mqtt_publish(mqtt_publish_message_t * pubmsg)
{
    uint32_t err_code;
    // Set topic to be published.
    mqtt_publish_param_t param;

    param.message.topic.qos              = MQTT_QoS_1_ATLEAST_ONCE;
    param.message.topic.topic.p_utf_str  = pubmsg->topic.topic.p_utf_str;
    param.message.topic.topic.utf_strlen = pubmsg->topic.topic.utf_strlen;
    param.message.payload.p_bin_str      = pubmsg->payload.p_bin_str,
    param.message.payload.bin_strlen     = pubmsg->payload.bin_strlen;
    param.message_id                     = m_message_counter;
    param.dup_flag                       = 0;
    param.retain_flag                    = 0;

    err_code = mqtt_publish(&m_app_mqtt_client, &param);
    APPL_LOG("mqtt_publish result 0x%08lx", err_code);

    if (err_code == NRF_SUCCESS)
    {
        // Avoid ever sending invalid message id 0.
        m_message_counter+= 2;
    }
    else
    {
        // todo: indicate failure of publish
    }
}


/**@brief Subscribe with the broker. */
static void app_mqtt_subscribe(mqtt_topic_t * topic)
{
    uint32_t err_code;
    /*
    {
        .topic =
        {
            .p_utf_str  = (uint8_t *)topic_str,
            .utf_strlen = strlen(topic_str)
        },
        .qos = MQTT_QoS_1_ATLEAST_ONCE
    };*/

    const mqtt_subscription_list_t subscription_list =
    {
        .p_list     = &topic,
        .list_count = 1,
        .message_id = m_sub_message_id
    };
    m_sub_message_id++;

    err_code = mqtt_subscribe(&m_app_mqtt_client, &subscription_list);
    APPL_LOG("mqtt_subscribe result 0x%08lx", err_code);


    if (err_code == NRF_SUCCESS)
    {
        // todo : indicate success or not bother?
    }
}


/**@brief Unsubscribe with the broker. */
static void app_mqtt_unsubscribe(mqtt_topic_t * topic)
{
    uint32_t err_code;

    /*mqtt_topic_t topic =
    {
        .topic =
        {
            .p_utf_str  = (uint8_t *)topic_str,
            .utf_strlen = strlen(topic_str)
        },
        .qos = MQTT_QoS_0_AT_MOST_ONCE
    };*/

    const mqtt_subscription_list_t subscription_list =
    {
        .p_list     = &topic,
        .list_count = 1,
        .message_id = m_sub_message_id
    };
    m_sub_message_id++;

    err_code = mqtt_unsubscribe(&m_app_mqtt_client, &subscription_list);
    APPL_LOG("mqtt_unsubscribe result 0x%08lx", err_code);

    if (err_code == NRF_SUCCESS)
    {
        // todo: same?
    }
}

void app_mqtt_evt_handler(mqtt_client_t * const p_client, const mqtt_evt_t * p_evt)
{
    uint32_t err_code;
    app_state_event_data_t state_update;
    char const * p_desc = nrf_strerror_get(p_evt->result);
    APPL_LOG ("app_mqtt_evt_handler: called with err_code=%s", p_desc);


    switch (p_evt->id)
    {
        case MQTT_EVT_CONNACK:
        {
            APPL_LOG (">> MQTT_EVT_CONNACK, result %08lx", p_evt->result);
            if (p_evt->result == MQTT_CONNECTION_ACCEPTED)
            {
                mqtt_state = STATE_MQTT_CONNECTED;

                mqtt_topic_t topic =
                {
                    .topic =
                    {
                        .p_utf_str  = "archer/sample",
                        .utf_strlen = strlen("archer/sample")
                    },
                    .qos = MQTT_QoS_1_ATLEAST_ONCE
                };
                app_mqtt_subscribe(&topic);

                // TODO: Can we tell if session is continued?
                // TODO: Sub to default topics (<sensor>/#)
                // TODO: Sub to nominated topics (how do we hook to things?)
                state_update.evt_type   = STATE_EVENT_MQTT_CONNECT;
                err_code       = app_sched_event_put(&state_update, sizeof(app_state_event_data_t), app_state_update);
                APP_ERROR_CHECK(err_code);
            }
            else
            {
                state_update.evt_type   = STATE_EVENT_MQTT_CONNECT_FAILED;
                err_code       = app_sched_event_put(&state_update, sizeof(app_state_event_data_t), app_state_update);
                APP_ERROR_CHECK(err_code);
                mqtt_state = STATE_MQTT_IDLE;
            }
            break;
        }
        case MQTT_EVT_PUBACK:
        {
            APPL_LOG (">> MQTT_EVT_PUBACK");
            //TODO: indicate confirmation of transmission?
            break;
        }
        case MQTT_EVT_PUBLISH:
        {
            APPL_LOG (">> Data length 0x%04lX", p_evt->param.publish.message.payload.bin_strlen);
            APPL_LOG (">> Topic length 0x%04lX", p_evt->param.publish.message.topic.topic.utf_strlen);

/*
            if (p_evt->param.publish.message.payload.bin_strlen == 1)
            {
                // Accept binary or ASCII 0 and 1.
                if ((p_evt->param.publish.message.payload.p_bin_str[0] == 0) ||
                    (p_evt->param.publish.message.payload.p_bin_str[0] == 0x30))
                {
                    LEDS_OFF(LED_FOUR);
                }
                else if ((p_evt->param.publish.message.payload.p_bin_str[0] == 1) ||
                         (p_evt->param.publish.message.payload.p_bin_str[0] == 0x31))
                {
                    LEDS_ON(LED_FOUR);
                }
            }*/

            //if (strcmp(p_evt->param.publish.message.payload.p_bin_str, TOPIC_BUTTON_1) == 0)
            //{
//
            //} else if (strcmp(p_evt->param.publish.message.payload.p_bin_str, TOPIC_BUTTON_2) == 0)
            //{
//            
            //}

            bma280_spi_get();

            // handle acknowledgement, if required (QoS terminates here)
            if (p_evt->param.publish.message.topic.qos == MQTT_QoS_1_ATLEAST_ONCE)
            {
                const mqtt_puback_param_t ack_param = {
                    .message_id = p_evt->param.publish.message_id
                };

                // Send acknowledgment.
                uint32_t err_code = mqtt_publish_ack(p_client, &ack_param);

                APPL_LOG (">> mqtt_publish_ack message id 0x%04x, result 0x%08lx",
                          p_evt->param.publish.message_id,
                          err_code);
                UNUSED_VARIABLE(err_code);
            }
            break;
        }
        case MQTT_EVT_DISCONNECT:
        {
            APPL_LOG (">> MQTT_EVT_DISCONNECT");
            mqtt_state = STATE_MQTT_IDLE;

            state_update.evt_type   = STATE_EVENT_MQTT_DISCONNECT;
            err_code       = app_sched_event_put(&state_update, sizeof(app_state_event_data_t), app_state_update);
            APP_ERROR_CHECK(err_code);

            break;
        }
        default:
            break;
    }
}

/**
 * @brief Function for application main entry.
 */
int mqtt_app_init(void)
{
    uint32_t err_code;

    err_code = mqtt_init();
    char const * p_desc = nrf_strerror_get(err_code);
    APPL_LOG ("mqtt_app_init: mqtt_init() returned %s", p_desc);
    APP_ERROR_CHECK(err_code);
}

/**
 * @}
 */
