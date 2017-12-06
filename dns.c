/**
 * Copyright (c) 2014 - 2017, Nordic Semiconductor ASA
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
 * @defgroup iot_sdk_dns6_app main.c
 * @{
 * @ingroup iot_sdk_app_ipv6
 * @brief This file contains the source code for Nordic's IPv6 DNS6 sample application.
 *
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
#include "nrf_delay.h"
#include "iot_common.h"
#include "iot_timer.h"
#include "ipv6_api.h"
#include "icmp6_api.h"
#include "dns6_api.h"
#include "ipv6_medium.h"

#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"

#define APP_STATE_INTERVAL              APP_TIMER_TICKS(1500)                                       /**< Interval for executing application state machine. */

#define APP_RTR_SOLICITATION_DELAY      1000                                                        /**< Time before host sends an initial solicitation in ms. */

#define DEAD_BEEF                       0xDEADBEEF                                                  /**< Value used as error code on stack dump, can be used to identify stack location on stack unwind. */
#define MAX_LENGTH_FILENAME             128                                                         /**< Max length of filename to copy for the debug error handler. */

#define APP_HOSTNAME                    "example.com"                                               /**< Host name to perform DNS resolution and Echo Ping. */
#define APP_DNS_LOCAL_PORT              0x8888                                                      /**< UDP Port number of local DNS Resolver. */
#define APP_DNS_SERVER_PORT             0x0035                                                      /**< UDP Port number of DNS Server. */
#define APP_DNS_SERVER_ADDR             {{0x20, 0x01, 0x48, 0x60, 0x48, 0x60, 0x00, 0x00, \
                                          0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x88}}          /**< IPv6 address of Google's DNS Server. */

#define APP_MAX_ECHO_REQUEST_RTR        3                                                           /**< Maximum echo request retransmission before application goes back to querying state. */

/**@brief Application's state. */
typedef enum
{
    APP_STATE_IDLE = 0,
    APP_STATE_QUERYING,
    APP_STATE_RESOLVING
} app_state_t;

static ipv6_medium_instance_t m_ipv6_medium;
eui64_t                       eui64_local_iid;                                                      /**< Local EUI64 value that is used as the IID for*/
static iot_interface_t      * mp_interface = NULL;                                                  /**< Pointer to IoT interface if any. */
static ipv6_addr_t            m_hostname_address;                                                   /**< IPv6 address of given hostname. */
static display_state_t        m_display_state = LEDS_INACTIVE;                                      /**< Board LED display state. */
static volatile app_state_t   m_app_state = APP_STATE_IDLE;                                         /**< State of application state machine. */

/**@brief Addresses used in sample application. */
static const ipv6_addr_t      m_local_routers_multicast_addr = {{0xFF, 0x02, 0x00, 0x00,
                                                                 0x00, 0x00, 0x00, 0x00,
                                                                 0x00, 0x00, 0x00, 0x00,
                                                                 0x00, 0x00, 0x00, 0x02}};          /**< Multi-cast address of all routers on the local network segment. */


void static dns_lookup(const char * p_hostname)
{
    APPL_LOG("Start button has been pushed.");

    // Change application state in case being in IDLE state.
    if (m_app_state == APP_STATE_IDLE)
    {
        m_app_state = APP_STATE_QUERYING;

        err_code = dns6_query(APP_HOSTNAME, app_dns_handler);
        APP_ERROR_CHECK(err_code);
        m_app_state = APP_STATE_RESOLVING;
    }
}

/**@brief DNS6 module event handler.
 *
 * @details Callback registered with the DNS6 module to receive asynchronous events from
 *          the module for registering query.
 */
static void app_dns_handler(uint32_t      process_result,
                            const char  * p_hostname,
                            ipv6_addr_t * p_addr,
                            uint16_t      addr_count)
{
    uint32_t index;

    if (m_app_state != APP_STATE_RESOLVING)
    {
        // Exit if it's not in resolving state.
        return;
    }

    APPL_LOG("DNS Response for hostname: %s, with %d IPv6 addresses and status 0x%08lX",
    p_hostname, addr_count, process_result);

    if (process_result == NRF_SUCCESS)
    {
        for (index = 0; index < addr_count; index++)
        {
            APPL_LOG("[%ld] IPv6 Address: ", index);
            APPL_ADDR(p_addr[index]);

            // Store only first given address, but print all of them.
            if (index == 0)
            {
                memcpy(m_hostname_address.u8, p_addr[0].u8, IPV6_ADDR_SIZE);

                // Change application state.
                m_app_state = APP_STATE_IDLE;

            }
        }
    }
    else
    {
        // Start application state machine from beginning.
        // TODO: handle DNS lookup failure
        m_app_state = APP_STATE_IDLE;
    }
}

    static const iot_timer_client_t list_of_clients[] =
    {

        {dns6_timeout_process,    SEC_TO_MILLISEC(DNS6_RETRANSMISSION_INTERVAL)},

/**@brief Function for initializing IP stack.
 *
 * @details Initialize the IP Stack.
 */
static void dns_client_init(void)
{
    uint32_t    err_code;

    // Configure DNS client and server parameters.
    dns6_init_t dns_init_param =
    {
        .local_src_port  = APP_DNS_LOCAL_PORT,
        .dns_server      =
        {
            .port = APP_DNS_SERVER_PORT,
            .addr = APP_DNS_SERVER_ADDR
        }
    };

    err_code = dns6_init(&dns_init_param);
    APP_ERROR_CHECK(err_code);
}

/**@brief Function for application main entry.
 */
int dns_main_init(void)
{
    uint32_t err_code;

    dns_client_init();

    APPL_LOG("Init complete.");

}


/**
 * @}
 */
