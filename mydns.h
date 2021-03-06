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

#ifndef MYDNS_H
#define MYDNS_H

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
#include "ipv6_medium.h"
#include "lwip/dns.h"
#include "lwip/ip_addr.h"

#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"


#define APP_DNS_LOCAL_PORT              0x8888                                                      /**< UDP Port number of local DNS Resolver. */
//#define APP_DNS_SERVER_ADDR             (u32_t){0x20014860, 0x48600000, 0x00000000, 0x00008888}          /**< IPv6 address of Google's DNS Server. */
//#define DNS_SERVER_ADDRESS             (u32_t){0x20014860, 0x48600000, 0x00000000, 0x00008888}          /**< IPv6 address of Google's DNS Server. */
//#define DNS_SERVER_ADDRESS              (u32_t){0xFE800000, 0x00000000, 0xC6E984FF, 0xFE7B25E3}
//#define APP_DNS_SERVER_ADDR             (u32_t){0xFE800000, 0x00000000, 0xC6E984FF, 0xFE7B25E3}

//#define DNS_SERVER_ADDRESS              (u32_t){0xFE800000, 0x00000000, 0x021583FF, 0xFEED6AAD}
//#define APP_DNS_SERVER_ADDR             (u32_t){0xFE800000, 0x00000000, 0x021583FF, 0xFEED6AAD}
#define DNS_SERVER_X0             0xFE800000
#define DNS_SERVER_X1             0x00000000
#define DNS_SERVER_X2             0x021583FF
#define DNS_SERVER_X3             0xFEED6AAD
//#define DNS_SERVER_X3             0x0000FE80
//#define DNS_SERVER_X2             0x00000000
//#define DNS_SERVER_X1             0x83FF0215
//#define DNS_SERVER_X0             0x6AADFEED
//#define DNS_SERVER_X0             0x20010DB8
//#define DNS_SERVER_X1             0x00000000
//#define DNS_SERVER_X2             0x00000000
//#define DNS_SERVER_X3             0x00000001

//#define DNS_SERVER_ADDRESS(ipaddr) (ip6_addr_set(ipaddr, APP_DNS_SERVER_ADDR))

/**@brief Application's state. */
typedef enum
{
    STATE_DNS_IDLE = 0,
    STATE_DNS_QUERYING,
    STATE_DNS_RESOLVING
} dns_state_t;

eui64_t                       eui64_local_iid;                                                      /**< Local EUI64 value that is used as the IID for*/
/**@brief Addresses used in sample application. */

extern int dns_main_init(void);
extern void app_dns_lookup(char * p_hostname);
extern ip_addr_t ipaddr_last_dns;

#endif