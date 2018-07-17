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
#include "ws2811.h"
#include "app_pwm.h"
#include "nrf_drv_pwm.h"

static nrf_drv_pwm_t m_pwm0 = NRF_DRV_PWM_INSTANCE(0); // for data

typedef struct
{
    uint8_t red,
    uint8_t green,
    uint8_t blue,
    uint8_t white
} led_rgbw;

typedef struct
{
    uint8_t red,
    uint8_t green,
    uint8_t blue
} led_rgb;

typedef struct
{
    uint8_t value
} led_single;

typedef enum
{
    PIXEL_TYPE_RGBW,
    PIXEL_TYPE_RGB,
    PIXEL_TYPE_SINGLE
} pixel_type;

typedef struct
{
    pixel_type type,
    void * values
} pixel;

nrf_drv_pwm_config_t const config0 =
{
    .output_pins =
    {
        GIO1 , // channel 0
        GIO2,             // channel 1
        GIO3,             // channel 2
        GIO4,             // channel 3
    },
    .irq_priority = APP_IRQ_PRIORITY_LOW,
    .base_clock   = NRF_PWM_CLK_16MHz,
    .count_mode   = NRF_PWM_MODE_UP,
    .top_value    = 20,
    .load_mode    = NRF_PWM_LOAD_INDIVIDUAL,
    .step_mode    = NRF_PWM_STEP_AUTO
};

static nrf_pwm_values_individual_t seq_values[sizeof(led_rgbw)*8] = {};

nrf_pwm_sequence_t const seq =
{
    .values.p_common = seq_values,
    .length          = NRF_PWM_VALUES_LENGTH(seq_values),
    .repeats         = 0,
    .end_delay       = 0
};

pixel * m_pixels;
uint8_t current_pixel;
uint8_t pixel_count;

void prepare_led_data(pixel * m_pixel)
{
    switch pixel.typedef
    {
        case PIXEL_TYPE_RGBW:
        {
            i = 0;
            for (mask=0x01, mask>0, mask<<1)
            {
                if (m_pixel.red & mask) seq_values[i].channel_0 = 10; else seq_values[i].channel_0 = 5;
                if (m_pixel.green & mask) seq_values[i+8].channel_0 = 10; else seq_values[i+8].channel_0 = 5;
                if (m_pixel.blue & mask) seq_values[i+16].channel_0 = 10; else seq_values[i+16].channel_0 = 5;
                if (m_pixel.white & mask) seq_values[i+24].channel_0 = 10; else seq_values[i+24].channel_0 = 5;
                seq_values[i].channel_1 = seq_values[i].channel_0;
                seq_values[i+8].channel_1 = seq_values[i+8].channel_0;
                seq_values[i+16].channel_1 = seq_values[i+16].channel_0;
                seq_values[i+24].channel_1 = seq_values[i+24].channel_0;
                seq_values[i].channel_2 = seq_values[i].channel_0;
                seq_values[i+8].channel_2 = seq_values[i+8].channel_0;
                seq_values[i+16].channel_2 = seq_values[i+16].channel_0;
                seq_values[i+24].channel_2 = seq_values[i+24].channel_0;
                seq_values[i].channel_3 = seq_values[i].channel_0;
                seq_values[i+8].channel_3 = seq_values[i+8].channel_0;
                seq_values[i+16].channel_3 = seq_values[i+16].channel_0;
                seq_values[i+24].channel_3 = seq_values[i+24].channel_0;
                i++;
            }
            seq.length = 32*4;
        }
        case PIXEL_TYPE_RGB:
        {
            i = 0;
            for (mask=0x01, mask>0, mask<<1)
            {
                if (m_pixel.red & mask) seq_values[i].channel_0 = 10; else seq_values[i].channel_0 = 5;
                if (m_pixel.green & mask) seq_values[i+8].channel_0 = 10; else seq_values[i+8].channel_0 = 5;
                if (m_pixel.blue & mask) seq_values[i+16].channel_0 = 10; else seq_values[i+16].channel_0 = 5;
                seq_values[i].channel_1 = seq_values[i].channel_0;
                seq_values[i+8].channel_1 = seq_values[i+8].channel_0;
                seq_values[i+16].channel_1 = seq_values[i+16].channel_0;
                seq_values[i].channel_2 = seq_values[i].channel_0;
                seq_values[i+8].channel_2 = seq_values[i+8].channel_0;
                seq_values[i+16].channel_2 = seq_values[i+16].channel_0;
                seq_values[i].channel_3 = seq_values[i].channel_0;
                seq_values[i+8].channel_3 = seq_values[i+8].channel_0;
                seq_values[i+16].channel_3 = seq_values[i+16].channel_0;
                i++;
            }
            seq.length = 24*4;
        }
        case PIXEL_TYPE_SINGLE:
        {
            i = 0;
            for (mask=0x01, mask>0, mask<<1)
            {
                if (m_pixel.value & mask) seq_values[i].channel_0 = 10; else seq_values[i].channel_0 = 5;
                seq_values[i].channel_1 = seq_values[i].channel_0;
                seq_values[i].channel_2 = seq_values[i].channel_0;
                seq_values[i].channel_3 = seq_values[i].channel_0;
                i++;
            }
            seq.length = 8*4;
        }
    }
}

void ws2811_transmit(pixel * pixels, uint8_t count)
{

    /*
    nrf_drv_pwm_simple_playback(&m_pwm0, &seq, 3, 0);
    nrf_drv_pwm_simple_playback(&m_pwm0, &seq, 3, NRF_DRV_PWM_FLAG_LOOP);*/
    constructCommand(m_hvac_mode, m_hvac_temp, m_hvac_fanmode, m_hvac_vannemode, m_hvac_off);
    nrf_drv_pwm_complex_playback(&m_pwm0, &seq, &seq, 1, NRF_DRV_PWM_FLAG_STOP);
    nrf_drv_pwm_simple_playback(&m_pwm1, &carrier, 1, NRF_DRV_PWM_FLAG_LOOP);
}

void ws2811_handler(nrf_drv_pwm_evt_type_t event_type)
{
    APPL_LOG("pwm evt %X", event_type);
    if ((event_type == NRF_PWM_EVENT_SEQSTARTED0) | (event_type == NRF_PWM_EVENT_SEQSTARTED0))
    {
        if (current_pixel < pixel_count)
        {
            current_pixel++;
            prepare_led_data(pixels[current_pixel]);
        }      
    }
    if ((event_type == NRF_PWM_EVT_END_SEQ0) | (event_type == NRF_PWM_EVT_END_SEQ0))
    {
        if (current_pixel == pixel_count)
        {
            nrf_drv_pwm_stop(&m_pwm0, false);
        }
    }
}

void ws2811_init(void)
{
    APP_ERROR_CHECK(nrf_drv_pwm_init(&m_pwm0, &config0, pwm_handler));
    //nrf_gpio_cfg(GIO1, NRF_GPIO_PIN_DIR_OUTPUT, NRF_GPIO_PIN_INPUT_CONNECT, NRF_GPIO_PIN_PULLUP, NRF_GPIO_PIN_S0S1, NRF_GPIO_PIN_SENSE_LOW);
}