/**
 * Copyright (c) 2015 - 2017, Nordic Semiconductor ASA
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

//#include "bma2x2.h"
#include "app_util_platform.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"
#include "main.h"
#include "app_error.h"
#include <string.h>
#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"
#include "nrf_spi_mngr.h"
#include "bma280-spi.h"

#define TWI_INSTANCE  0 /**< TWI instance index. */
#define TWI_MNGR_QUEUE_SIZE 4

uint8_t NRF_TWI_MNGR_BUFFER_LOC_IND vl53_conf_reg_addr  = VL53_REG_CONF;
uint8_t NRF_TWI_MNGR_BUFFER_LOC_IND vl53_temp_reg_addr  = VL53_REG_TEMP;
uint8_t NRF_TWI_MNGR_BUFFER_LOC_IND vl53_tos_reg_addr   = VL53_REG_TOS;
uint8_t NRF_TWI_MNGR_BUFFER_LOC_IND vl53_thyst_reg_addr = VL53_REG_THYST;

uint8_t       twi_trans_vl53_reg[]  = {0x00};           /**< TX buffer. */
uint8_t       twi_trans_vl53_buff[] = {0x00};    /**< RX buffer. */

NRF_TWI_MNGR_DEF(m_nrf_twi_mngr, TWI_MNGR_QUEUE_SIZE, TWI_INSTANCE);

accdata_t accdata;

nrf_drv_twi_config_t const app_twi_config =
{
    .scl                = I2C_SCL,
    .sda                = I2C_SDA,
    .frequency          = NRF_TWI_FREQ_400K,
    .interrupt_priority = APP_IRQ_PRIORITY_LOW,
    .clear_bus_init     = false
};

nrf_twi_mngr_transfer_t const twi_trans_vl53_get[] =
{
    VL53_READ_TEMP(twi_trans_vl53_buff);
};

nrf_twi_mngr_transaction_t transaction_1 =
{
    .callback            = twi_vl53_callback,
    .p_user_data         = NULL,
    .p_transfers         = transfers,
    .number_of_transfers = sizeof(transfers) / sizeof(transfers[0]),
    .p_required_twi_cfg  = &bma_twi_config
};

nrf_twi_mngr_transaction_t transaction_1 =
{
    .callback            = twi_vl53_callback,
    .p_user_data         = NULL,
    .p_transfers         = transfers,
    .number_of_transfers = sizeof(transfers) / sizeof(transfers[0]),
    .p_required_twi_cfg  = &bma_twi_config
};

    // SPI0 (with transaction manager) initialization.

void twi_vl53_callback(ret_code_t result, void *p_user_data)
{
    APPL_LOG("twi callback result = %s", nrf_strerror_get(result));
}

void twi_vl53_get(void)
{
    APP_ERROR_CHECK(nrf_twi_mngr_schedule(&m_nrf_twi_mngr, &transaction_1));
}

void app_twi_init(void)
{
    APP_ERROR_CHECK(nrf_twi_mngr_init(&m_nrf_twi_mngr, &vl53_twi_config));
}

