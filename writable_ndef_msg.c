/**
 * Copyright (c) 2017 - 2017, Nordic Semiconductor ASA
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
 * @defgroup nfc_writable_ndef_msg_example_main main.c
 * @{
 * @ingroup nfc_writable_ndef_msg_example
 * @brief The application main file of NFC writable NDEF message example.
 *
 */

#include <stdint.h>
#include <stdbool.h>
#include "app_error.h"
#include "app_scheduler.h"
#include "boards.h"
#include "nfc_t4t_lib.h"
#include "nrf_log_ctrl.h"
#include "ndef_file_m.h"
#include "nfc_ndef_msg.h"

#include "nrf_log.h"
#include "nrf_log_default_backends.h"

#define CORRECT_PASSWORD "testapp"

static uint8_t m_ndef_msg_buf[NDEF_FILE_SIZE];      /**< Buffer for NDEF file. */
static uint8_t m_ndef_msg_len;                      /**< Length of the NDEF message. */

/**@brief Application's state. */
typedef enum
{
    NFC_STATE_IDLE = 0,
    NFC_STATE_FIELD_ON
} nfc_state_t;

/**
 * @brief Function for updating NDEF message in the flash file.
 */
static void scheduler_ndef_file_update(void * p_event_data, uint16_t event_size)
{
    ret_code_t err_code;

    UNUSED_PARAMETER(p_event_data);
    UNUSED_PARAMETER(event_size);

    // Update flash file with new NDEF message.
    err_code = ndef_file_update(m_ndef_msg_buf, m_ndef_msg_len + NLEN_FIELD_SIZE);
    APP_ERROR_CHECK(err_code);

    NRF_LOG_INFO("NDEF message updated!");
}


/**
 * @brief Function for updating main app state/LEDs
 */
static void scheduler_nfc_field_change(void * p_event_data, uint16_t event_size)
{
    ret_code_t err_code;

    UNUSED_PARAMETER(p_event_data);
    UNUSED_PARAMETER(event_size);

    // Update flash file with new NDEF message.
    if (nfc_state_t == NFC_STATE_FIELD_ON)
    {
        m_app_state = APP_STATE_NFC;
    } else {
        // TODO: For now, assume a reset to idle after any NFC ops
        app_soft_reset();
        m_app_state = APP_STATE_IDLE;
    }

    NRF_LOG_INFO("NDEF message updated!");
}


/**
 * @brief Callback function for handling NFC events.
 */
static void nfc_callback(void          * context,
                         nfc_t4t_event_t event,
                         const uint8_t * data,
                         size_t          dataLength,
                         uint32_t        flags)
{
    (void)context;

    switch (event)
    {
        case NFC_T4T_EVENT_FIELD_ON:
            //TODO: enter NFC state in main app
            nfc_state_t = NFC_STATE_FIELD_ON;
            err_code       = app_sched_event_put(NULL, 0, scheduler_nfc_field_change);
            APP_ERROR_CHECK(err_code);
            break;

        case NFC_T4T_EVENT_FIELD_OFF:
            bsp_board_leds_off();
            nfc_state_t = NFC_STATE_IDLE;
            err_code       = app_sched_event_put(NULL, 0, scheduler_nfc_field_change);
            APP_ERROR_CHECK(err_code);
            //TODO: exit NFC state in main app
            break;

        case NFC_T4T_EVENT_NDEF_READ:
            //TODO: indicate NDEF was read
            break;

            /* The NDEF may be updated with information:
            * that requires a complete re-connect to BT/IPSP (changed IPSP SSID/password)
            * requires broker re-connect due to changes in MQTT broker settings (server/port)
            * doesnt require restart, but changes button behaviour or direct link mappings
            */
        case NFC_T4T_EVENT_NDEF_UPDATED:
            if (dataLength > 0)
            {
                ret_code_t err_code;
                app_state_event_t state_update = STATE_EVENT_NONE;

                // Parse the NDEF record
                uint32_t nfc_data_len = m_ndef_msg_len; // Filled by the length of the NFC data.
                uint8_t nfc_data[] = m_ndef_msg_buf; // Filled by the value of the NFC data.
                // Buffer for parsing results that can hold an NDEF message descriptor with up to 10 records.
                uint8_t desc_buf[NFC_NDEF_PARSER_REQIRED_MEMO_SIZE_CALC(10)];
                uint32_t desc_buf_len = sizeof(desc_buf);
                ret_code = ndef_msg_parser(desc_buf,
                                    &desc_buf_len,
                                    nfc_data,
                                    &nfc_data_len);
                if (ret_code != NRF_SUCCESS)
                {
                    app_trace_log("Error when parsing an NDEF message.\r\n");
                }
                
                parse_configuration();
                
                // fail? Don't process any more (disable NFC for a bit?)

                // for now, just accept all and reset everything

                // update 6lowpan/btle ssid & key

                // update TLS security values

                // update broker hostname, port
                
                




                //TODO: indicate NDEF was written
                //TODO: process NDEF that was written for sanity, password, compatibility etc.

                // Schedule update of NDEF message in the flash file.
                m_ndef_msg_len = dataLength;
                err_code       = app_sched_event_put(NULL, 0, scheduler_ndef_file_update);
                APP_ERROR_CHECK(err_code);

                state_update   = STATE_EVENT_NFC_RESET;
                err_code       = app_sched_event_put(&state_update, 0, app_state_update);
                APP_ERROR_CHECK(err_code);
            }
            break;

        default:
            break;
    }
}

void parse_configuration ()
{
    // Parse the JSON
    cJSON *root = cJSON_Parse(ndef_text);

    // Check password
    password = cJSON_GetObjectItem(root, "password")->valuestring;

    if (password == CORRECT_PASSWORD)
    {
        ssid = cJSON_GetObjectItem(root, "ssid")->valuestring;
        key = cJSON_GetObjectItem(root, "key")->valuestring;

        // todo: how to store the ssid/key in gatt or w/e?...

        identity = cJSON_GetObjectItem(root, "identity")->valuestring;
        shared_secret = cJSON_GetObjectItem(root, "shared_secret")->valuestring;
        m_preshared_key = {
            .p_identity = &identity[0];
            .p_secret_key = &shared_secret[0];
            .identity_len = 15;
            .secret_key_len = 9;
        }
        m_tls_keys.p_psk = &m_preshared_key;

        broker = cJSON_GetObjectItem(root, "broker")->valuestring;
        port = cJSON_GetObjectItem(root, "port")->valueint;
        client = cJSON_GetObjectItem(root, "client")->valuestring;

        broker_hostname = broker;
        broker_port = port;
        m_client_id = client;
    }

}

void nfc_reset_default ()
{
    uint32_t size = sizeof(m_ndef_msg_buf);
    err_code = ndef_file_default_message(m_ndef_msg_buf, &size);
    APP_ERROR_CHECK(err_code);
    err_code = ndef_file_update(m_ndef_msg_buf, NDEF_FILE_SIZE);
    APP_ERROR_CHECK(err_code);
    NRF_LOG_DEBUG("Default NDEF message restored!");\
}


/**
 * @brief   Function for application main entry.
 */
int nfc_main_init(bool resetDefault)
{
    ret_code_t err_code;

    NRF_LOG_INFO("NFC Initialize");

    /* Initialize FDS. */
    err_code = ndef_file_setup();
    APP_ERROR_CHECK(err_code);

    /* Load NDEF message from the flash file. */
    err_code = ndef_file_load(m_ndef_msg_buf, sizeof(m_ndef_msg_buf));
    APP_ERROR_CHECK(err_code);
    parse_configuration();

    /* Set up NFC */
    err_code = nfc_t4t_setup(nfc_callback, NULL);
    APP_ERROR_CHECK(err_code);

    /* Run Read-Write mode for Type 4 Tag platform */
    err_code = nfc_t4t_ndef_rwpayload_set(m_ndef_msg_buf, sizeof(m_ndef_msg_buf));
    APP_ERROR_CHECK(err_code);

    /* Start sensing NFC field */
    err_code = nfc_t4t_emulation_start();
    APP_ERROR_CHECK(err_code);

}


/** @} */