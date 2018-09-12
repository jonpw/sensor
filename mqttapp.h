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

#ifndef MQTTAPP_H
#define MQTTAPP_H

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

extern char broker_hostname[32];

extern uint16_t m_broker_port;       /**< Port number of MQTT Broker being used. */

extern char topic_base[32];

#define DEFAULT_BROKER						"archer"
#define DEFAULT_BROKER_PORT					8883
#define DEFAULT_IDENTITY					"testapp123456"
#define DEFAULT_SHARED_SECRET				{0x73, 0x65, 0x63, 0x72, 0x65, 0x74, 0x50, 0x53, 0x4b}
#define DEFAULT_MQTT_USER					"user"
#define DEFAULT_MQTT_PASS					"pass"
#define TOPIC_DEBUG                         "debug/1234/#"
#define TOPIC_HVAC 							"hvac/#"
#define TOPIC_HVAC_MODE 					"hvac/mode"
#define TOPIC_HVAC_TEMP						"hvac/temp"
#define TOPIC_HVAC_FAN_MODE					"hvac/fan"
#define TOPIC_HVAC_VANNE_MODE				"hvac/vanne"
#define TOPIC_HVAC_POWER					"hvac/power"

/**@brief Application state with respect to MQTT. */
typedef enum
{
    STATE_MQTT_IDLE,            // not even trying to connect
    STATE_MQTT_CONNECTING,      // connection underway
    STATE_MQTT_CONNECTED        // connected and ready
} mqtt_state_t;

typedef struct
{
	uint8_t * topic;
	uint8_t * message;
} mqtt_simple_msg_t;

eui64_t                                     eui64_local_iid;                                        /**< Local EUI64 value that is used as the IID for*/
// TODO: make mqtt client id unique e.g. based on hardware serial # or hash thereof
extern char                           m_client_id[16];                         /**< Unique MQTT client identifier. */

extern const uint8_t identity[16];
extern const uint8_t shared_secret[9];

extern nrf_tls_preshared_key_t m_preshared_key;
extern nrf_tls_key_settings_t m_tls_keys;

//TODO: Preliminary mqtt_begin
void mqtt_begin(ip_addr_t * ipaddr, uint16_t addr_size);

int mqtt_app_init(void);

void app_mqtt_publish(mqtt_publish_message_t * pubmsg);
void app_mqtt_subscribe(mqtt_topic_t * topic);
void app_mqtt_unsubscribe(mqtt_topic_t * topic);
extern void app_mqtt_queue_do();

#endif