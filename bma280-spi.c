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

#define SPI_INSTANCE  0 /**< SPI instance index. */
#define SPI_MNGR_QUEUE_SIZE 4

uint8_t       m_master_data_0[] = {0x82};           /**< TX buffer. */
uint8_t       m_master_buffer_rx[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};    /**< RX buffer. */

NRF_SPI_MNGR_DEF(m_nrf_spi_mngr, SPI_MNGR_QUEUE_SIZE, SPI_INSTANCE);

accdata_t accdata;

nrf_drv_spi_config_t const bma_spi_config =
{
    .sck_pin        = BMA280_SCK_PIN,
    .mosi_pin       = BMA280_MOSI_PIN,
    .miso_pin       = BMA280_MISO_PIN,
    .ss_pin         = BMA280_SS_PIN,
    .irq_priority   = APP_IRQ_PRIORITY_LOWEST,
    .orc            = 0xFF,
    .frequency      = NRF_DRV_SPI_FREQ_8M,
    .mode           = NRF_DRV_SPI_MODE_3,
    .bit_order      = NRF_DRV_SPI_BIT_ORDER_MSB_FIRST
};

nrf_spi_mngr_transfer_t const transfers[] =
{
    NRF_SPI_MNGR_TRANSFER(m_master_data_0, sizeof(m_master_data_0), m_master_buffer_rx, sizeof(m_master_buffer_rx))
};

nrf_spi_mngr_transaction_t transaction_1 =
{
    .begin_callback      = bma280_spi_begin,
    .end_callback        = bma280_spi_end,
    .p_user_data         = transfers,
    .p_transfers         = transfers,
    .number_of_transfers = sizeof(transfers) / sizeof(transfers[0]),
    .p_required_spi_cfg  = &bma_spi_config
};

    // SPI0 (with transaction manager) initialization.

void bma280_spi_begin(void *p_user_data)
{
    // nothing
}

void bma280_spi_end(ret_code_t result, void *p_user_data)
{
    APPL_LOG("spi txcv result = %s", nrf_strerror_get(result));
    accdata.x = *(int16_t*)((&m_master_buffer_rx[1]))>>2;
    accdata.y = *(int16_t*)((&m_master_buffer_rx[3]))>>2;
    accdata.z = *(int16_t*)((&m_master_buffer_rx[5]))>>2;
    accdata.t = m_master_buffer_rx[7]*0.5f+23.0f;
    APPL_LOG("x = %i, y = %i, z = %i, t = %d", accdata.x, accdata.y, accdata.z, accdata.t);
   ret_code_t err_code = app_sched_event_put(NULL, 0, app_sched_pub_temp);

}

void bma280_spi_get(void)
{
    APP_ERROR_CHECK(nrf_spi_mngr_schedule(&m_nrf_spi_mngr, &transaction_1));
}

void bma280_spi_init(void)
{
    APP_ERROR_CHECK(nrf_spi_mngr_init(&m_nrf_spi_mngr, &bma_spi_config));
}