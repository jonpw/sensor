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

#ifndef BMA280_SPI_H
#define BMA280_SPI_H

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

#define SPI_INSTANCE  0 /**< SPI instance index. */
#define SPI_MNGR_QUEUE_SIZE 4

extern uint8_t       m_master_data_0[];           /**< TX buffer. */
extern uint8_t       m_master_buffer_rx[];    /**< RX buffer. */

/*extern uint8_t NRF_TWI_MNGR_BUFFER_LOC_IND lm75b_conf_reg_addr;
extern uint8_t NRF_TWI_MNGR_BUFFER_LOC_IND lm75b_temp_reg_addr;
extern uint8_t NRF_TWI_MNGR_BUFFER_LOC_IND lm75b_tos_reg_addr;
extern uint8_t NRF_TWI_MNGR_BUFFER_LOC_IND lm75b_thyst_reg_addr;*/

#define VL53_READ(p_reg_addr, p_buffer, byte_cnt) \
    NRF_TWI_MNGR_WRITE(TWI_ADDR_VL53, p_reg_addr, 1,        NRF_TWI_MNGR_NO_STOP), \
    NRF_TWI_MNGR_READ (TWI_ADDR_VL53, p_buffer,   byte_cnt, 0)

#define BNO055_READ(p_reg_addr, p_buffer, byte_cnt) \
    NRF_TWI_MNGR_WRITE(TWI_ADDR_BNO055, p_reg_addr, 1,        NRF_TWI_MNGR_NO_STOP), \
    NRF_TWI_MNGR_READ (TWI_ADDR_BNO055, p_buffer,   byte_cnt, 0)

#define SI705X_READ(p_reg_addr, p_buffer, byte_cnt) \
    NRF_TWI_MNGR_WRITE(TWI_ADDR_SI705x, p_reg_addr, 1,        NRF_TWI_MNGR_NO_STOP), \
    NRF_TWI_MNGR_READ (TWI_ADDR_SI705x, p_buffer,   byte_cnt, 0)

#define AM88XX_READ(p_reg_addr, p_buffer, byte_cnt) \
    NRF_TWI_MNGR_WRITE(TWI_ADDR_AM88xx, p_reg_addr, 1,        NRF_TWI_MNGR_NO_STOP), \
    NRF_TWI_MNGR_READ (TWI_ADDR_AM88xx, p_buffer,   byte_cnt, 0)

#define LTR329_READ(p_reg_addr, p_buffer, byte_cnt) \
    NRF_TWI_MNGR_WRITE(TWI_ADDR_LTR329, p_reg_addr, 1,        NRF_TWI_MNGR_NO_STOP), \
    NRF_TWI_MNGR_READ (TWI_ADDR_LTR329, p_buffer,   byte_cnt, 0)

#define VL53_READ_TEMP(p_buffer) \
    VL53_READ(&vl53_temp_reg_addr, p_buffer, 2)

nrf_drv_twi_config_t const app_twi_config;

#define LM75B_INIT_TRANSFER_COUNT 1

extern nrf_twi_mngr_transfer_t const vl53_init_transfers[VL53_INIT_TRANSFER_COUNT];

nrf_spi_mngr_transaction_t transaction_1;

extern void twi_vl53_callback(ret_code_t result, void *p_user_data);
extern void bma280_spi_get(void);

#endif