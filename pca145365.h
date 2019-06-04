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
#ifndef PCA145365
#define PCA145365

#ifdef __cplusplus
extern "C" {
#endif

#include "nrf_gpio.h"



#define LEDS_NUMBER    0

#define LED_START	   6
#define LED_G          8
#define LED_R          7
#define LED_B          6
#define LED_STOP	   8

#define LEDS_ACTIVE_STATE 1

#define LEDS_INV_MASK  LEDS_MASK

#define LEDS_LIST { LED_R, LED_G, LED_B}

#define BSP_LED_0	LED_R
#define BSP_LED_1	LED_G
#define BSP_LED_2	LED_B

#define BUTTONS_NUMBER 2

#define BUTTON_START   31
#define BUTTON_1       31
#define BUTTON_2       32+0
#define BUTTON_STOP    32+0
#define BUTTON_PULL    NRF_GPIO_PIN_PULLUP

#define BUTTONS_ACTIVE_STATE 0

#define BUTTONS_LIST { BUTTON_1, BUTTON_2 }

#define BSP_BUTTON_0   BUTTON_1
#define BSP_BUTTON_1   BUTTON_2

#define TOPIC_BUTTON_1	"button1"
#define TOPIC_BUTTON_2	"button2"

#define TOPIC_CONTROL "archer/sample"

#define BROKER_HOSTNAME "archer.local"
#define MSG_BUTTON_PRESSED "pressed"

#define SPI_SCK_PIN   	32+9  // SPI clock GPIO pin number.
#define SPI_MOSI_PIN  	12  // SPI Master Out Slave In GPIO pin number.
#define SPI_MISO_PIN  	8  // SPI Master In Slave Out GPIO pin number.
#define SPI_SS_PIN    	0  // SPI Slave Select GPIO pin number.

#define BMA280_SS_PIN		0
#define BMA280_INT1		32+13
#define BMA280_INT2		32+13
#define BME680_SS_PIN		6

#define I2C_SCL			4
#define I2C_SDA			26

#define INT_AM			20
#define GPIO_VL53		32+13
#define SDNx_VL53		2

#define MP_CLK			15
#define MP_DO			13
#define MP_LR			17

#define HVAC_IR

#define TWI_ADDR_VL53	0x29
#define TWI_ADDR_SI705x 0x40
#define TWI_ADDR_AM88xx 0x59
#define TWI_ADDR_LTR329 0x29

#define LTR329_REG_ALS_CONTR		0x80
#define LTR329_REG_ALS_MEAS_RATE	0x85
#define LTR329_REG_PART_ID			0x86
#define LTR329_REG_MANUFAC_ID		0x87
#define LTR329_REG_ALS_DATA_CH1_0	0x88
#define LTR329_REG_ALS_DATA_CH1_1	0x89
#define LTR329_REG_ALS_DATA_CH0_0	0x8A
#define LTR329_REG_ALS_DATA_CH0_1	0x8B
#define LTR329_REG_ALS_STATUS		0x8C

#define Si705x_REG_PART_ID 		0xFA0F
#define Si705x_REG_PART_ID2		0xFCC9
#define Si705x_REG_SOFT_RESET	0xFE
#define Si705x_REG_TEMP_NORM	0x7CA2
#define Si705x_REG_TEMP_NORM_NH	0x7866
#define Si705x_REG_TEMP_FAST	0x6458
#define Si705x_REG_TEMP_FAST_NH	0x609C
#define Si705x_REG_QUERY		0x805D
#define Si705x_REG_QUERY2		0xEFC8
#define Si705x_REG_FW_REV		0x84F1

#define AMG88XX_REG_PCTL		0x00
#define AMG88XX_REG_RST			0x01
#define AMG88XX_REG_FPSC		0x02
#define AMG88XX_REG_INTC		0x03	
#define AMG88XX_REG_STAT		0x04
#define AMG88XX_REG_SCLR		0x05
#define AMG88XX_REG_AVE			0x07
#define AMG88XX_REG_INTLH		0x08
#define AMG88XX_REG_INTHH		0x09
#define AMG88XX_REG_INTLL		0x0A
#define AMG88XX_REG_INTLH		0x0B
#define AMG88XX_REG_IHYSL		0x0C
#define AMG88XX_REG_IHYSH		0x0D
#define AMG88XX_REG_TTHL		0x0E
#define AMG88XX_REG_TTHH		0x0F
#define AMG88XX_REG_INT0		0x10
#define AMG88XX_REG_INT1		0x11
#define AMG88XX_REG_INT2		0x12
#define AMG88XX_REG_INT3		0x13
#define AMG88XX_REG_INT4		0x14
#define AMG88XX_REG_INT5		0x15
#define AMG88XX_REG_INT6		0x16
#define AMG88XX_REG_INT7		0x17
#define AMG88XX_REG_T01			0x80
#define AMG88XX_SIZE_X			8
#define AMG88XX_SIZE_Y			8
#define AMG88XX_PIXELS			AMG88XX_SIZE_X*AMG88XX_SIZE_Y

#define AMG88XX_REG_PCTL_NORMAL	0x00
#define AMG88XX_REG_PCTL_SLEEP	0x01
#define AMG88XX_REG_PCTL_STANDBY_60s	0x01
#define AMG88XX_REG_PCTL_STANDBY_10s	0x01
#define AMG88XX_REG_RST_FLAG	0x30
#define AMG88XX_REG_RST_INIT	0x3F
#define AMG88XX_REG_FPSC_1FPS	0x01
#define AMG88XX_REG_INTC_INTEN	0x01
#define AMG88XX_REG_INTC_INTMOD	0x02


// Low frequency clock source to be used by the SoftDevice
#define NRF_CLOCK_LFCLKSRC      {.source       = NRF_CLOCK_LF_SRC_RC,      \
                                 .rc_ctiv      = 0,                          \
                                 .rc_temp_ctiv = 0,                          \
                                 .accuracy     = NRF_CLOCK_LF_ACCURACY_20_PPM}

#ifdef __cplusplus
}
#endif

#endif
