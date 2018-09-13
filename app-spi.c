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
#include "app-spi.h"
#include "bsec_integration.h"
#include "ndef_file_m.h"
#include "app_scheduler.h"
#include "mqttapp.h"


#define SPI_INSTANCE  0 /**< SPI instance index. */
#define SPI_MNGR_QUEUE_SIZE 4


NRF_SPI_MNGR_DEF(m_nrf_spi_mngr, SPI_MNGR_QUEUE_SIZE, SPI_INSTANCE);

accdata_t accdata;

#if defined(PCA252432)
nrf_drv_spi_config_t const bma_spi_config =
{
    .sck_pin        = SPI_SCK_PIN,
    .mosi_pin       = SPI_MOSI_PIN,
    .miso_pin       = SPI_MISO_PIN,
    .ss_pin         = BMA280_SS_PIN,
    .irq_priority   = APP_IRQ_PRIORITY_LOWEST,
    .orc            = 0xFF,
    .frequency      = NRF_DRV_SPI_FREQ_8M,
    .mode           = NRF_DRV_SPI_MODE_3,
    .bit_order      = NRF_DRV_SPI_BIT_ORDER_MSB_FIRST
};

uint8_t       m_master_data_0[] = {0x82};           /**< TX buffer. */
uint8_t       m_master_buffer_rx[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};    /**< RX buffer. */

nrf_spi_mngr_transfer_t bma_transfers[] =
{
    NRF_SPI_MNGR_TRANSFER(m_master_data_0, sizeof(m_master_data_0), m_master_buffer_rx, sizeof(m_master_buffer_rx))
};

nrf_spi_mngr_transaction_t bma_init_transaction =
{
    .begin_callback      = bma280_init_begin,
    .end_callback        = bma280_init_end,
    .p_user_data         = bma_transfers,
    .p_transfers         = bma_transfers,
    .number_of_transfers = sizeof(bma_transfers) / sizeof(bma_transfers[0]),
    .p_required_spi_cfg  = &bma_spi_config
};

nrf_spi_mngr_transaction_t transaction_1 =
{
    .begin_callback      = bma280_spi_begin,
    .end_callback        = bma280_spi_end,
    .p_user_data         = bma_transfers,
    .p_transfers         = bma_transfers,
    .number_of_transfers = sizeof(bma_transfers) / sizeof(bma_transfers[0]),
    .p_required_spi_cfg  = &bma_spi_config
};

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
    accdata.t = ((int8_t)(m_master_buffer_rx[7])*0.5f)+23.0f;
    APPL_LOG("x = %i, y = %i, z = %i, t = %d", accdata.x, accdata.y, accdata.z, accdata.t);
   ret_code_t err_code = app_sched_event_put(NULL, 0, app_sched_pub_temp);
}

void bma280_spi_get(void)
{
    APP_ERROR_CHECK(nrf_spi_mngr_schedule(&m_nrf_spi_mngr, &transaction_1));
}



#endif

#if defined(PCA662504)

nrf_drv_spi_config_t const bme_spi_config =
{
    .sck_pin        = SPI_SCK_PIN,
    .mosi_pin       = SPI_MOSI_PIN,
    .miso_pin       = SPI_MISO_PIN,
    .ss_pin         = BME680_SS_PIN,
    .irq_priority   = APP_IRQ_PRIORITY_LOWEST,
    .orc            = 0xFF,
    .frequency      = NRF_DRV_SPI_FREQ_8M,
    .mode           = NRF_DRV_SPI_MODE_3,
    .bit_order      = NRF_DRV_SPI_BIT_ORDER_MSB_FIRST
};

uint8_t       bme_data_tx[BME_BUFFER_LEN];           /**< TX buffer. */
uint8_t       bme_buffer_rx[BME_BUFFER_LEN];    /**< RX buffer. */

nrf_spi_mngr_transfer_t bme_transfers[] =
{
    NRF_SPI_MNGR_TRANSFER(bme_data_tx, sizeof(bme_data_tx), bme_buffer_rx, sizeof(bme_buffer_rx))
};

void bme680_init_begin(void *p_user_data)
{
    APPL_LOG("Begin BME680 detect: %X", (((nrf_spi_mngr_transfer_t*)p_user_data)[0]).p_tx_data[0]);
}

void bme680_init_end(ret_code_t result, void *p_user_data)
{
    APPL_LOG("BME680 detect received: %s %s", nrf_strerror_get(result), (uint8_t)(((nrf_spi_mngr_transfer_t*)p_user_data)[0]).p_rx_data[1]);
    if (bme_buffer_rx[1] == 0x61)
    {
        APPL_LOG("BME680 detected OK")
    }
    else
    {
        APPL_LOG("BME680 not detected")
    }
}

nrf_spi_mngr_transaction_t bme_init_transaction =
{
    .begin_callback      = bme680_init_begin,
    .end_callback        = bme680_init_end,
    .p_user_data         = bme_transfers,
    .p_transfers         = bme_transfers,
    .number_of_transfers = sizeof(bme_transfers) / sizeof(bme_transfers[0]),
    .p_required_spi_cfg  = &bme_spi_config
};

void bme680_cb_begin(void *p_user_data)
{
    //APPL_LOG("BME680 transaction begin: %X", (((nrf_spi_mngr_transfer_t*)p_user_data)[0]).p_tx_data[0]);
    //uint8_t error_string[] = "bme680_cb_begin";
    //app_sched_event_put(error_string, sizeof(error_string), log_print);
}

void bme680_cb_end(ret_code_t result, void *p_user_data)
{
    //APPL_LOG("BME680 transaction received: %s %X", nrf_strerror_get(result), (((nrf_spi_mngr_transfer_t*)p_user_data)[0]).p_rx_data[1]);
    //uint8_t error_string[] = "bme680_cb_end";
    //app_sched_event_put(error_string, sizeof(error_string), log_print);
}

nrf_spi_mngr_transaction_t bme_transaction =
{
    .begin_callback      = bme680_cb_begin,
    .end_callback        = bme680_cb_end,
    .p_user_data         = bme_transfers,
    .p_transfers         = bme_transfers,
    .number_of_transfers = sizeof(bme_transfers) / sizeof(bme_transfers[0]),
    .p_required_spi_cfg  = &bme_spi_config
};

    // SPI0 (with transaction manager) initialization.

/*!
 * @brief           Write operation in either I2C or SPI
 *
 * param[in]        dev_addr        I2C or SPI device address
 * param[in]        reg_addr        register address
 * param[in]        reg_data_ptr    pointer to the data to be written
 * param[in]        data_len        number of bytes to be written
 *
 * @return          result of the bus communication function
 */
int8_t bme680_write(uint8_t dev_addr, uint8_t reg_addr, uint8_t *reg_data_ptr, uint16_t data_len)
{
    uint32_t err_code;
    bme_data_tx[0] = reg_addr;
    memcpy(bme_data_tx+1, reg_data_ptr, data_len);
    ((nrf_spi_mngr_transfer_t*)bme_transaction.p_transfers)[0].tx_length = data_len + 1;
    ((nrf_spi_mngr_transfer_t*)bme_transaction.p_transfers)[0].rx_length = data_len + 1;
    err_code = nrf_spi_mngr_schedule(&m_nrf_spi_mngr, &bme_transaction);
    while (!nrf_spi_mngr_is_idle(&m_nrf_spi_mngr))
    {
        // nothing
    }
    //APPL_LOG("bme680_write: write: %X ... for %i bytes", bme_transaction.p_transfers[0].p_tx_data[1], data_len);
    return err_code;
}

/*!
 * @brief           Read operation in either I2C or SPI
 *
 * param[in]        dev_addr        I2C or SPI device address
 * param[in]        reg_addr        register address
 * param[out]       reg_data_ptr    pointer to the memory to be used to store the read data
 * param[in]        data_len        number of bytes to be read
 *
 * @return          result of the bus communication function
 */



int8_t bme680_read(uint8_t dev_addr, uint8_t reg_addr, uint8_t *reg_data_ptr, uint16_t data_len)
{
    uint32_t err_code = BME680_E_COM_FAIL;
    uint8_t read_reg = (reg_addr | 0x80);
    //uint8_t error_string[] = "bme680 read: setup";
    //app_sched_event_put(error_string, sizeof(error_string), log_print);

    if (data_len > BME_BUFFER_LEN)
    {
        APPL_LOG("bme680_read: buffer too small");
        return err_code;
    }
    memset(bme_buffer_rx, 0x00, BME_BUFFER_LEN);
    nrf_spi_mngr_transfer_t bme_read_transfers[] =
    {
        NRF_SPI_MNGR_TRANSFER(&read_reg, 1, bme_buffer_rx, data_len+1)
    };

    nrf_spi_mngr_transaction_t bme_read_transaction =
    {
        .begin_callback      = bme680_cb_begin,
        .end_callback        = bme680_cb_end,
        .p_user_data         = bme_read_transfers,
        .p_transfers         = bme_read_transfers,
        .number_of_transfers = sizeof(bme_read_transfers) / sizeof(bme_read_transfers[0]),
        .p_required_spi_cfg  = &bme_spi_config
    };
    err_code = nrf_spi_mngr_schedule(&m_nrf_spi_mngr, &bme_read_transaction);
    while (!nrf_spi_mngr_is_idle(&m_nrf_spi_mngr))
    {

    }
    memcpy(reg_data_ptr, bme_buffer_rx+1, data_len);
    //err_code = BME680_E_COM_FAIL;

    //uint8_t error_string2 = "bme680 read: done";
    //app_sched_event_put(error_string2, sizeof(error_string2), log_print);
    //APPL_LOG("bme680_read: read: %X ... for %i bytes", (uint8_t)bme_read_transaction.p_transfers[0].p_rx_data[1], data_len);
    return err_code;
}

/*!
 * @brief           System specific implementation of sleep function
 *
 * @param[in]       t_ms    time in milliseconds
 *
 * @return          none
 */
void bme680_sleep(uint32_t t_ms)
{
    nrf_delay_ms(t_ms);
}

/*!
 * @brief           Capture the system time in microseconds
 *
 * @return          system_current_time    current system timestamp in microseconds
 */
int64_t get_timestamp_us_app()
{
    static int64_t system_current_time = 0;
    //APPL_LOG("diff: %i", app_timer_cnt_diff_compute(app_timer_cnt_get(), system_current_time/1000));
    system_current_time += (app_timer_cnt_diff_compute(app_timer_cnt_get(), system_current_time/1000) * 1000);
    APPL_LOG("system current time: %i", system_current_time);
    return system_current_time;
}

void bsec_data_callback(int64_t timestamp, float iaq, uint8_t iaq_accuracy, float temperature, float humidity, float pressure, float raw_temperature, float raw_humidity, float gas, bsec_library_return_t bsec_status)
{
    static uint8_t msg[6][16];
    //sprintf(msg[0], NRF_LOG_FLOAT_MARKER, NRF_LOG_FLOAT(iaq));
    snprintf(msg[0], 16, "%f", iaq);
    app_mqtt_queue("iaq", msg[0]);
    //APPL_LOG("bsec_data_callback: " NRF_LOG_FLOAT_MARKER, NRF_LOG_FLOAT(iaq));
    snprintf(msg[1], 16, "%i", iaq_accuracy);
    app_mqtt_queue("iaq_accuracy", msg[1]);
    //APPL_LOG("bsec_data_callback: %i", iaq_accuracy);
    //sprintf(msg[2], NRF_LOG_FLOAT_MARKER, NRF_LOG_FLOAT(temperature));
    snprintf(msg[2], 16, "%f", temperature);
    app_mqtt_queue("temperature", msg[2]);
    //APPL_LOG("bsec_data_callback: " NRF_LOG_FLOAT_MARKER, NRF_LOG_FLOAT(temperature));
    //sprintf(msg[3], NRF_LOG_FLOAT_MARKER, NRF_LOG_FLOAT(humidity));
    snprintf(msg[3], 16, "%f", humidity);
    app_mqtt_queue("humidity", msg[3]);
    //APPL_LOG("bsec_data_callback: " NRF_LOG_FLOAT_MARKER, NRF_LOG_FLOAT(humidity));
    //sprintf(msg[4], NRF_LOG_FLOAT_MARKER, NRF_LOG_FLOAT(pressure));
    snprintf(msg[4], 16, "%f", pressure);
    app_mqtt_queue("pressure", msg[4]);
    //APPL_LOG("bsec_data_callback: %i", pressure);
    //app_mqtt_publish_simple("raw_temperature", sprintf(msg, NRF_LOG_FLOAT_MARKER, raw_temperature));
    //APPL_LOG("bsec_data_callback: %i", raw_temperature);
    //app_mqtt_publish_simple("raw_humidity", sprintf(msg, NRF_LOG_FLOAT_MARKER, raw_humidity));
    //APPL_LOG("bsec_data_callback: %i", raw_humidity);
    //sprintf(msg[5], NRF_LOG_FLOAT_MARKER, NRF_LOG_FLOAT(gas));
    snprintf(msg[5], 16, "%f", gas);
    app_mqtt_queue("gas", msg[5]);
    //APPL_LOG("bsec_data_callback: %i", gas);
    uint32_t err_code = app_sched_event_put(NULL, 0, app_mqtt_queue_do);
    APP_ERROR_CHECK(err_code);
}

void bme680_begin(void)
{
    bsec_iot_loop();
}

void bma280_spi_init(void)
{
    APPL_LOG("begin spi init");
    APP_ERROR_CHECK(nrf_spi_mngr_init(&m_nrf_spi_mngr, &bme_spi_config));
    // begin BME680 check
    bme_data_tx[0] = (0x50 | 0x80);
    APP_ERROR_CHECK(nrf_spi_mngr_schedule(&m_nrf_spi_mngr, &bme_init_transaction));
    //nrf_delay_ms(100);
}

#endif