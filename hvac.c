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
#include "hvac.h"
#include "app_pwm.h"
#include "nrf_drv_pwm.h"

static nrf_drv_pwm_t m_pwm0 = NRF_DRV_PWM_INSTANCE(0); // for data
static nrf_drv_pwm_t m_pwm1 = NRF_DRV_PWM_INSTANCE(1); // for carrier


nrf_drv_pwm_config_t const config0 =
{
    .output_pins =
    {
        GIO1 | NRF_DRV_PWM_PIN_INVERTED, // channel 0
        NRF_DRV_PWM_PIN_NOT_USED,             // channel 1
        NRF_DRV_PWM_PIN_NOT_USED,             // channel 2
        NRF_DRV_PWM_PIN_NOT_USED,             // channel 3
    },
    .irq_priority = APP_IRQ_PRIORITY_LOW,
    .base_clock   = NRF_PWM_CLK_1MHz,
    .count_mode   = NRF_PWM_MODE_UP,
    .top_value    = 20000,
    .load_mode    = NRF_PWM_LOAD_WAVE_FORM,
    .step_mode    = NRF_PWM_STEP_AUTO
};

nrf_drv_pwm_config_t const config1 =
{
    .output_pins =
    {
        GIO2 | NRF_DRV_PWM_PIN_INVERTED, // channel 0
        NRF_DRV_PWM_PIN_NOT_USED,             // channel 1
        NRF_DRV_PWM_PIN_NOT_USED,             // channel 2
        NRF_DRV_PWM_PIN_NOT_USED,             // channel 3
    },
    .irq_priority = APP_IRQ_PRIORITY_LOW,
    .base_clock   = NRF_PWM_CLK_1MHz,
    .count_mode   = NRF_PWM_MODE_UP,
    .top_value    = 26,
    .load_mode    = NRF_PWM_LOAD_COMMON,
    .step_mode    = NRF_PWM_STEP_AUTO
};

static nrf_pwm_values_wave_form_t seq_values[18*8+2] = {};
static nrf_pwm_values_common_t seq_carrier[1] = {};

nrf_pwm_sequence_t const seq =
{
    .values.p_common = seq_values,
    .length          = NRF_PWM_VALUES_LENGTH(seq_values),
    .repeats         = 0,
    .end_delay       = 0
};

nrf_pwm_sequence_t const carrier =
{
    .values.p_common = seq_carrier,
    .length          = NRF_PWM_VALUES_LENGTH(seq_carrier),
    .repeats         = 0,
    .end_delay       = 0
};

extern HvacMode_t                m_hvac_mode = HVAC_COLD;           // Example HVAC_HOT  HvacMitsubishiMode
extern int                     m_hvac_temp = 24;           // Example 21  (°c)
extern HvacFanMode_t             m_hvac_fanmode = FAN_SPEED_AUTO;        // Example FAN_SPEED_AUTO  HvacMitsubishiFanMode
extern HvacVanneMode_t           m_hvac_vannemode = VANNE_AUTO;      // Example VANNE_AUTO_MOVE  HvacMitsubishiVanneMode
extern int                     m_hvac_off = false;                  // Example false

static void event_handler(nrf_drv_pwm_evt_type_t event_type)
{
    if (event_type == NRF_DRV_PWM_EVT_END_SEQ0)
    {
    }

    else if (event_type == NRF_DRV_PWM_EVT_END_SEQ1)
    {
    }
}




/****************************************************************************
/* Send IR command to Mitsubishi HVAC - sendHvacMitsubishi
/***************************************************************************/
void constructCommand(
  HvacMode_t                HVAC_Mode,           // Example HVAC_HOT  HvacMitsubishiMode
  int                     HVAC_Temp,           // Example 21  (°c)
  HvacFanMode_t             HVAC_FanMode,        // Example FAN_SPEED_AUTO  HvacMitsubishiFanMode
  HvacVanneMode_t           HVAC_VanneMode,      // Example VANNE_AUTO_MOVE  HvacMitsubishiVanneMode
  int                     OFF                  // Example false
)
{

    //#define  HVAC_MITSUBISHI_DEBUG;  // Un comment to access DEBUG information through Serial Interface

    uint8_t mask = 1; //our bitmask
    uint8_t data[18] = { 0x23, 0xCB, 0x26, 0x01, 0x00, 0x20, 0x08, 0x06, 0x30, 0x45, 0x67, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F };
    // data array is a valid trame, only byte to be chnaged will be updated.

    uint8_t i, j;

    // Byte 6 - On / Off
    if (OFF) {
        data[5] = (uint8_t) 0x0; // Turn OFF HVAC
    } else {
        data[5] = (uint8_t) 0x20; // Tuen ON HVAC
    }

  // Byte 7 - Mode
    switch (HVAC_Mode)
    {
        case HVAC_HOT:   data[6] = (uint8_t) 0x08; break;
        case HVAC_COLD:  data[6] = (uint8_t) 0x18; break;
        case HVAC_DRY:   data[6] = (uint8_t) 0x10; break;
        case HVAC_AUTO:  data[6] = (uint8_t) 0x20; break;
        default: break;
    }

    // Byte 8 - Temperature
    // Check Min Max For Hot Mode
    uint8_t Temp;
    if (HVAC_Temp > 31) { Temp = 31;}
    else if (HVAC_Temp < 16) { Temp = 16; } 
    else { Temp = HVAC_Temp; };
    data[7] = (uint8_t) Temp - 16;

  // Byte 10 - FAN / VANNE
    switch (HVAC_FanMode)
    {
        case FAN_SPEED_1:       data[9] = (uint8_t) 0x01; break;
        case FAN_SPEED_2:       data[9] = (uint8_t) 0x02; break;
        case FAN_SPEED_3:       data[9] = (uint8_t) 0x03; break;
        case FAN_SPEED_4:       data[9] = (uint8_t) 0x04; break;
        case FAN_SPEED_5:       data[9] = (uint8_t) 0x04; break; //No FAN speed 5 for MITSUBISHI so it is consider as Speed 4
        case FAN_SPEED_AUTO:    data[9] = (uint8_t) 0x80; break;
        case FAN_SPEED_SILENT:  data[9] = (uint8_t) 0x05; break;
        default: break;
    }

    switch (HVAC_VanneMode)
    {
        case VANNE_AUTO:        data[9] = (uint8_t) data[9] | 0x40 ; break;
        case VANNE_H1:          data[9] = (uint8_t) data[9] | 0x48 ; break;
        case VANNE_H2:          data[9] = (uint8_t) data[9] | 0x50 ; break;
        case VANNE_H3:          data[9] = (uint8_t) data[9] | 0x58 ; break;
        case VANNE_H4:          data[9] = (uint8_t) data[9] | 0x60 ; break;
        case VANNE_H5:          data[9] = (uint8_t) data[9] | 0x68 ; break;
        case VANNE_AUTO_MOVE:   data[9] = (uint8_t) data[9] | 0x78 ; break;
        default: break;
    }

    // Byte 18 - CRC
    data[17] = 0;
    for (i = 0; i < 17; i++) {
        data[17] = (uint8_t) data[i] + data[17];  // CRC is a simple bits addition
    }

      // Header for the Packet
    i = 0;
    seq_values[i].channel_0=HVAC_MITSUBISHI_HDR_MARK;
    seq_values[i].counter_top=HVAC_MITSUBISHI_HDR_SPACE+HVAC_MITSUBISHI_HDR_MARK;
    APPL_LOG("dat:%i/%i",seq_values[i].channel_0,seq_values[i].counter_top);
    i++;
    for (j = 0; j < 18; j++) {
        // Send all Bits from Byte Data in Reverse Order
        for (mask = 0x01; mask > 0; mask <<= 1) { //iterate through bit mask
            if (data[j] & mask) { // Bit ONE
                seq_values[i].channel_0=HVAC_MITSUBISHI_BIT_MARK;
                seq_values[i].counter_top=HVAC_MITSUBISHI_ONE_SPACE+HVAC_MITSUBISHI_BIT_MARK;
                //APPL_LOG("dat:%X/%X",seq_values[i],seq_values[i+3]);
                i++;
            }
            else { // Bit ZERO
                seq_values[i].channel_0=HVAC_MITSUBISHI_BIT_MARK;
                seq_values[i].counter_top=HVAC_MITSUBISHI_ZERO_SPACE+HVAC_MITSUBISHI_BIT_MARK;
                //APPL_LOG("dat:%X/%X",seq_values[i],seq_values[i+3]);
                i++;
            }
        //Next bits
        }
    }
    // End of Packet and retransmission of the Packet
    seq_values[i].channel_0=HVAC_MITSUBISHI_RPT_MARK;
    seq_values[i].counter_top=HVAC_MITSUBISHI_RPT_SPACE+HVAC_MITSUBISHI_RPT_MARK;
    APPL_LOG("dat:%i/%i",seq_values[i].channel_0,seq_values[i].counter_top);
    i++;
    APPL_LOG("seqs:%i",i);
    APPL_LOG("dat:%i/%i %i/%i",seq_values[0].channel_0,seq_values[0].counter_top,seq_values[1].channel_0,seq_values[1].counter_top);
}

void hvac_transmit(void)
{
    /*
    nrf_drv_pwm_simple_playback(&m_pwm0, &seq, 3, 0);
    nrf_drv_pwm_simple_playback(&m_pwm0, &seq, 3, NRF_DRV_PWM_FLAG_LOOP);*/
    constructCommand(m_hvac_mode, m_hvac_temp, m_hvac_fanmode, m_hvac_vannemode, m_hvac_off);
    nrf_drv_pwm_complex_playback(&m_pwm0, &seq, &seq, 1, NRF_DRV_PWM_FLAG_STOP);
    nrf_drv_pwm_simple_playback(&m_pwm1, &carrier, 200, NRF_DRV_PWM_FLAG_LOOP);
}

void pwm_handler(nrf_drv_pwm_evt_type_t event_type)
{
    if (event_type == NRF_DRV_PWM_EVT_FINISHED)
    {
        nrf_drv_pwm_stop(&m_pwm0, 0);
        APPL_LOG("pwm done");
    }
    APPL_LOG("pwm evt %X", event_type);
}

void hvac_init(void)
{
    APP_ERROR_CHECK(nrf_drv_pwm_init(&m_pwm0, &config0, pwm_handler));
    APP_ERROR_CHECK(nrf_drv_pwm_init(&m_pwm1, &config1, pwm_handler));
    //nrf_gpio_cfg(GIO1, NRF_GPIO_PIN_DIR_OUTPUT, NRF_GPIO_PIN_INPUT_CONNECT, NRF_GPIO_PIN_PULLUP, NRF_GPIO_PIN_S0S1, NRF_GPIO_PIN_SENSE_LOW);
}