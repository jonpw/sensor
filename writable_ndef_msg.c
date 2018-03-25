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
#include "nrf_delay.h"
#include "boards.h"
#include "nfc_t4t_lib.h"
#include "nrf_log_ctrl.h"
#include "ndef_file_m.h"
#include "nfc_ndef_msg.h"
#include "nfc_ndef_msg_parser.h"
#include "nrf_tls.h"
#include "nfc_t4t_tlv_block.h"

#include "nrf_log.h"
#include "nrf_log_default_backends.h"

#include "main.h"
#include "mqttapp.h"
#include "nfctag.h"

#include "cJSON.h"

char ssid[] = "sensornet";
char key[] = "sensor";
char password[] = CORRECT_PASSWORD;

static uint8_t m_ndef_msg_buf[NDEF_FILE_SIZE];      /**< Buffer for NDEF file. */
static uint32_t m_ndef_msg_len;                      /**< Length of the NDEF message. */

static nfc_state_t nfc_state = NFC_STATE_IDLE;
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
    app_state_event_data_t state_update;

    UNUSED_PARAMETER(p_event_data);
    UNUSED_PARAMETER(event_size);

    // Update flash file with new NDEF message.
    if (nfc_state == NFC_STATE_FIELD_ON)
    {
        state_update.evt_type = STATE_EVENT_NFC;
        err_code       = app_sched_event_put(&state_update, 0, app_state_update);
    } else {
        state_update.evt_type = STATE_EVENT_NFC_RESET;
        err_code       = app_sched_event_put(&state_update, 0, app_state_update);
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
    ret_code_t err_code;
    app_state_event_data_t state_update;

    switch (event)
    {
        case NFC_T4T_EVENT_FIELD_ON:
            //TODO: enter NFC state in main app
            nfc_state = NFC_STATE_FIELD_ON;
            err_code       = app_sched_event_put(NULL, 0, scheduler_nfc_field_change);
            APP_ERROR_CHECK(err_code);
            break;

        case NFC_T4T_EVENT_FIELD_OFF:
            nfc_state = NFC_STATE_IDLE;
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
            if (dataLength > 0) // may be several updates in one 'write', and the last will set the length to non-zero
            {
                state_update.evt_type = STATE_EVENT_NONE;

                // Parse the NDEF record
                // Buffer for parsing results that can hold an NDEF message descriptor with up to 10 records.


                //parse_configuration();
                
                // fail? Don't process any more (disable NFC for a bit?)

                // for now, just accept all and reset everything

                //TODO: indicate NDEF was written
                //TODO: process NDEF that was written for sanity, password, compatibility etc.

                // Schedule update of NDEF message in the flash file.
                m_ndef_msg_len = dataLength;
                err_code       = app_sched_event_put(NULL, 0, scheduler_ndef_file_update);
                APP_ERROR_CHECK(err_code);

                state_update.evt_type   = STATE_EVENT_NFC_RESET;
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
    uint32_t x;
    ret_code_t err_code;
    bsp_board_led_on(2);
    nrf_delay_ms(250);
    bsp_board_led_off(2);
    nrf_delay_ms(250);


    uint8_t desc_buf[NFC_NDEF_PARSER_REQIRED_MEMO_SIZE_CALC(10)];
    uint32_t desc_buf_len = sizeof(desc_buf);
    err_code = ndef_msg_parser(desc_buf,
                        &desc_buf_len,
                        m_ndef_msg_buf,
                        m_ndef_msg_len);
    for (x=0;x<err_code;x++)
    {
        bsp_board_led_on(1);
        nrf_delay_ms(50);
        bsp_board_led_off(1);
        nrf_delay_ms(250);
    }

    if (err_code==NRF_ERROR_INVALID_LENGTH)
    {
        bsp_board_led_on(0);
        nrf_delay_ms(500);
    }
    APP_ERROR_CHECK(err_code);

    bsp_board_led_on(2);
    nrf_delay_ms(250);
    bsp_board_led_off(2);
    nrf_delay_ms(250);

    nfc_ndef_record_desc_t * ndef_rec = ((nfc_ndef_msg_desc_t *)desc_buf)->pp_record[0];

    uint32_t ndef_rec_payload_size = 0;
    err_code = ndef_rec->payload_constructor(ndef_rec->p_payload_descriptor, NULL, &ndef_rec_payload_size);
    APP_ERROR_CHECK(err_code);

    bsp_board_led_on(2);
    nrf_delay_ms(250);
    bsp_board_led_off(2);
    nrf_delay_ms(250);

    uint8_t ndef_rec_payload[ndef_rec_payload_size];
    err_code = ndef_rec->payload_constructor(ndef_rec->p_payload_descriptor, ndef_rec_payload, sizeof(ndef_rec_payload));
    APP_ERROR_CHECK(err_code);

    bsp_board_led_on(2);
    nrf_delay_ms(250);
    bsp_board_led_off(2);
    nrf_delay_ms(250);
                
    // Parse the JSON
    cJSON *root = cJSON_Parse(ndef_rec_payload);

    // Check password
    cJSON * password = cJSON_GetObjectItem(root, "password");

    if (strcmp(password->valuestring, CORRECT_PASSWORD) == 0)
    {
        cJSON * ssid_cjson = cJSON_GetObjectItem(root, "ssid");
        cJSON * key_cjson = cJSON_GetObjectItem(root, "key");

        strcpy(ssid, ssid_cjson->valuestring);
        strcpy(key, key_cjson->valuestring);

        // todo: custom commissioning. Disable nordic's COMMISSIONING_ENABLED system and use our own
        // but we have to do it partly similar to theirs (I think so?)

        cJSON * identity = cJSON_GetObjectItem(root, "identity");
        cJSON * shared_secret = cJSON_GetObjectItem(root, "shared_secret");
        nrf_tls_preshared_key_t m_preshared_key;
        m_preshared_key.p_identity = identity->valuestring;
        m_preshared_key.p_secret_key = shared_secret->valuestring;
        m_preshared_key.identity_len = 15;
        m_preshared_key.secret_key_len = 9;
        m_tls_keys.p_psk = &m_preshared_key;

        cJSON * broker = cJSON_GetObjectItem(root, "broker");
        cJSON * port = cJSON_GetObjectItem(root, "port");
        cJSON * client = cJSON_GetObjectItem(root, "client");

        strcpy(broker_hostname, broker->valuestring);
        m_broker_port = port->valueint;
        strcpy(m_client_id, client->valuestring);
    }

}

void nfc_reset_default ()
{
    ret_code_t err_code;
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
