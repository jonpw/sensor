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

uint32_t err_code;
nrf_drv_pwm_config_t const config0 =
{
    .output_pins =
    {
        IR_LED | NRF_DRV_PWM_PIN_INVERTED, // channel 0
        NRF_DRV_PWM_PIN_NOT_USED,             // channel 1
        NRF_DRV_PWM_PIN_NOT_USED,             // channel 2
        NRF_DRV_PWM_PIN_NOT_USED,             // channel 3
    },
    .irq_priority = APP_IRQ_PRIORITY_LOW,
    .base_clock   = NRF_PWM_CLK_1MHz,
    .count_mode   = NRF_PWM_MODE_UP,
    .top_value    = 1000,
    .load_mode    = NRF_PWM_LOAD_WAVE_FORM,
    .step_mode    = NRF_PWM_STEP_AUTO
};
err_code = nrf_drv_pwm_init(&m_pwm0, &config0, NULL);
if (err_code != NRF_SUCCESS)
{
    // Initialization failed. Take recovery action.
}


nrf_pwm_values_common_t seq_values[144*4+2] = {};

nrf_pwm_sequence_t const seq =
{
    .values.p_common = seq_values,
    .length          = NRF_PWM_VALUES_LENGTH(seq_values),
    .repeats         = 0,
    .end_delay       = 0
};


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
  HvacMode                HVAC_Mode,           // Example HVAC_HOT  HvacMitsubishiMode
  int                     HVAC_Temp,           // Example 21  (°c)
  HvacFanMode             HVAC_FanMode,        // Example FAN_SPEED_AUTO  HvacMitsubishiFanMode
  HvacVanneMode           HVAC_VanneMode,      // Example VANNE_AUTO_MOVE  HvacMitsubishiVanneMode
  int                     OFF                  // Example false
)
{

    //#define  HVAC_MITSUBISHI_DEBUG;  // Un comment to access DEBUG information through Serial Interface

    byte mask = 1; //our bitmask
    byte data[18] = { 0x23, 0xCB, 0x26, 0x01, 0x00, 0x20, 0x08, 0x06, 0x30, 0x45, 0x67, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F };
    // data array is a valid trame, only byte to be chnaged will be updated.

    byte i;

    // Byte 6 - On / Off
    if (OFF) {
        data[5] = (byte) 0x0; // Turn OFF HVAC
    } else {
        data[5] = (byte) 0x20; // Tuen ON HVAC
    }

  // Byte 7 - Mode
    switch (HVAC_Mode)
    {
        case HVAC_HOT:   data[6] = (byte) 0x08; break;
        case HVAC_COLD:  data[6] = (byte) 0x18; break;
        case HVAC_DRY:   data[6] = (byte) 0x10; break;
        case HVAC_AUTO:  data[6] = (byte) 0x20; break;
        default: break;
    }

    // Byte 8 - Temperature
    // Check Min Max For Hot Mode
    byte Temp;
    if (HVAC_Temp > 31) { Temp = 31;}
    else if (HVAC_Temp < 16) { Temp = 16; } 
    else { Temp = HVAC_Temp; };
    data[7] = (byte) Temp - 16;

  // Byte 10 - FAN / VANNE
    switch (HVAC_FanMode)
    {
        case FAN_SPEED_1:       data[9] = (byte) B00000001; break;
        case FAN_SPEED_2:       data[9] = (byte) B00000010; break;
        case FAN_SPEED_3:       data[9] = (byte) B00000011; break;
        case FAN_SPEED_4:       data[9] = (byte) B00000100; break;
        case FAN_SPEED_5:       data[9] = (byte) B00000100; break; //No FAN speed 5 for MITSUBISHI so it is consider as Speed 4
        case FAN_SPEED_AUTO:    data[9] = (byte) B10000000; break;
        case FAN_SPEED_SILENT:  data[9] = (byte) B00000101; break;
        default: break;
    }

    switch (HVAC_VanneMode)
    {
        case VANNE_AUTO:        data[9] = (byte) data[9] | B01000000; break;
        case VANNE_H1:          data[9] = (byte) data[9] | B01001000; break;
        case VANNE_H2:          data[9] = (byte) data[9] | B01010000; break;
        case VANNE_H3:          data[9] = (byte) data[9] | B01011000; break;
        case VANNE_H4:          data[9] = (byte) data[9] | B01100000; break;
        case VANNE_H5:          data[9] = (byte) data[9] | B01101000; break;
        case VANNE_AUTO_MOVE:   data[9] = (byte) data[9] | B01111000; break;
        default: break;
    }

    // Byte 18 - CRC
    data[17] = 0;
    for (i = 0; i < 17; i++) {
        data[17] = (byte) data[i] + data[17];  // CRC is a simple bits addition
    }

      // Header for the Packet
    i = 0;
    seq_values[i]=HVAC_MITSUBISHI_HDR_MARK;
    seq_values[i+3]=HVAC_MITSUBISHI_HDR_SPACE+HVAC_MITSUBISHI_HDR_MARK;
    i++;
    for (i = 0; i < 18; i++) {
        // Send all Bits from Byte Data in Reverse Order
        for (mask = 00000001; mask > 0; mask <<= 1) { //iterate through bit mask
            if (data[i] & mask) { // Bit ONE
                seq_values[i]=HVAC_MITSUBISHI_BIT_MARK;
                seq_values[i+3]=HVAC_MITSUBISHI_ONE_SPACE+HVAC_MITSUBISHI_BIT_MARK;
                i++;
            }
            else { // Bit ZERO
                seq_values[i]=HVAC_MITSUBISHI_BIT_MARK;
                seq_values[i+3]=HVAC_MITSUBISHI_ZERO_SPACE+HVAC_MITSUBISHI_BIT_MARK;
                i++;
            }
        //Next bits
        }
    }
    // End of Packet and retransmission of the Packet
    seq_values[i]=HVAC_MITSUBISHI_RPT_MARK;
    seq_values[i+3]=HVAC_MITSUBISHI_RPT_SPACE+HVAC_MITSUBISHI_RPT_MARK;
    i++;
}

void hvac_transmit(void)
{
    /*
    nrf_drv_pwm_simple_playback(&m_pwm0, &seq, 3, 0);
    nrf_drv_pwm_simple_playback(&m_pwm0, &seq, 3, NRF_DRV_PWM_FLAG_LOOP);*/
    constructCommand(HVAC_COLD, 24, FAN_SPEED_AUTO, VANNE_AUTO, false);
    nrf_drv_pwm_complex_playback(&m_pwm0, &seq, &seq, 1, 0);
}

void hvac_init(void)
{
    APP_ERROR_CHECK(nrf_drv_pwm_init(&m_pwm0, &config0, NULL));
}