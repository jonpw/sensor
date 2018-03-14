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

#ifndef MAIN_H
#define MAIN_H

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
#include "iot_timer.h"
#include "ipv6_medium.h"

#include "iot_common.h"

// project's includes

#define SCHED_MAX_EVENT_DATA_SIZE           16                                                      /**< Maximum size of scheduler events. */
#define SCHED_QUEUE_SIZE                    192                                                     /**< Maximum number of events in the scheduler queue. */

#define STATE_APP_INTERVAL              APP_TIMER_TICKS(1500)                                       /**< Interval for executing application state machine. */

#define APP_RTR_SOLICITATION_DELAY      1000                                                        /**< Time before host sends an initial solicitation in ms. */

#define DEAD_BEEF                       0xDEADBEEF                                                  /**< Value used as error code on stack dump, can be used to identify stack location on stack unwind. */
#define MAX_LENGTH_FILENAME             128                                                         /**< Max length of filename to copy for the debug error handler. */

#define ALL_APP_LED                        (BSP_LED_0 | BSP_LED_1 | BSP_LED_2)                        /**< Define used for simultaneous operation of all application LEDs. */

#define LWIP_SYS_TICK_MS                    10                                                      /**< Interval for timer used as trigger to send. */
#define LED_BLINK_INTERVAL_MS               300                                                     /**< LED blinking interval. */

#define BROKER_HOSTNAME "broker.hivemq.org"
#define MSG_BUTTON_PRESSED "pressed"

#define TOPIC_BUTTON_1  "button/1/event"
#define TOPIC_BUTTON_2  "button/2/event"
#define TOPIC_BUTTON_3  "button/3/event"
#define TOPIC_BUTTON_4  "button/4/event"

#define INITIAL_BROKER_ADDR             (u32_t){0x20010DB8, 0x00000000, 0x00000000, 0x00000001}

/**@brief Application's state. */
typedef enum
{
    STATE_APP_IDLE = 0,
    STATE_APP_STARTING,
    STATE_APP_CONNECTABLE,  // waiting for BT+IPSP connection and negotiation [return here if ip disconnected]
    STATE_APP_CONNECTED,    // ip interface is up
    STATE_APP_DNS_LOOKUP,  // going to send request to DNS server [return here on mqtt disconnect?]
    STATE_APP_MQTT_CONNECTING,
    STATE_APP_ACTIVE_IDLE,           // waiting for button presses
    STATE_APP_NFC,                   // NFC operations (field is present - operations suspended)
    STATE_APP_FAULT                 // catch state
} app_state_t;

typedef enum
{
    STATE_EVENT_NONE = 0,
    STATE_EVENT_DNS_OK,
    STATE_EVENT_DNS_FAIL,
    STATE_EVENT_MQTT_CONNECT,
    STATE_EVENT_MQTT_DISCONNECT,
    STATE_EVENT_MQTT_CONNECT_FAILED,
    STATE_EVENT_SOFT_RESET,
    STATE_EVENT_GO,
    STATE_EVENT_CONNECTED,
    STATE_EVENT_CONNECTION_LOST,
    STATE_EVENT_NFC,
    STATE_EVENT_NFC_RESUME,
    STATE_EVENT_NFC_RESET
} app_state_event_t;

typedef struct
{
    app_state_event_t evt_type;
    uint8_t * data
} app_state_event_data_t;

/**@brief LED's indication state. */
typedef enum
{
    LEDS_INACTIVE = 0,
    LEDS_IF_DOWN,
    LEDS_IF_UP,
    LEDS_CONNECTABLE,
    LEDS_BROKER_DNS,
    LEDS_BROKER_CONNECTING,
    LEDS_CONNECTED_TO_BROKER,
    LEDS_ACTIVE_IDLE,
    LEDS_PUBACK,
    LEDS_NFC
} display_state_t;

typedef enum
{
    BUTTON_TYPE_NONE = 0,
    BUTTON_TYPE_PUBLISH,
    BUTTON_TYPE_PUBLISH_TILT
} button_type_t;

/*typedef struct
{
    button_type_t type,
    uint8_t pin,
    uint8_t number,
    mqtt_topic_t topic
} button_config_t;*/

/** Modify m_broker_addr according to your setup.
 *  The address provided below is a place holder.  */
extern ip_addr_t m_broker_addr;

APP_TIMER_DEF(m_app_timer);                                                                         /**< Timer instance used for application state machine. */
APP_TIMER_DEF(m_iot_timer_tick_src_id);                                                             /**< App timer instance used to update the IoT timer wall clock. */

#define APP_ENABLE_LOGS                     1                                                       /**< Enable logs in the application. */

#if (APP_ENABLE_LOGS == 1)

#define APPL_LOG  NRF_LOG_INFO
#define APPL_DUMP NRF_LOG_RAW_HEXDUMP_INFO
#define APPL_ADDR IPV6_ADDRESS_LOG

#else // APP_ENABLE_LOGS

#define APPL_LOG(...)
#define APPL_DUMP(...)
#define APPL_ADDR(...)

#endif // APP_ENABLE_LOGS

void app_state_update(app_state_event_data_t * p_event_data, uint16_t event_size);
#endif