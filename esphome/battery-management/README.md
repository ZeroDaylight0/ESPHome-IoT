# JK-BMS battery management

ESPHome configurations for reading JK-BMS telemetry, publishing it to MQTT
and displaying battery data on TFT panels.

## Configurations

| File | Board | Connection |
|---|---|---|
| `cyd_jkbms_mqtt_display_work.yaml` | ESP32 DevKit/CYD | JK-BMS telemetry, ILI9341 display |
| `jkbms_uart_ap_tft_work.yaml` | ESP32 DevKit | UART RX GPIO3 / TX GPIO21, ILI9341 TFT |
| `lilygo_jkbms_ap_display_work.yaml` | Lolin32 | JK-BMS MQTT, TTGO T-Display |

## Full configured pinout

| Interface | Pin | Purpose |
|---|---:|---|
| UART | GPIO3 | JK-BMS RX |
| UART | GPIO21 | JK-BMS TX |
| TFT SPI | GPIO18 | CLK |
| TFT SPI | GPIO23 | MOSI |
| TFT SPI | GPIO19 | MISO |
| TFT | GPIO5 | CS on `jkbms_uart_ap_tft_work.yaml` |
| TFT | GPIO4 | DC on `jkbms_uart_ap_tft_work.yaml` |
| TFT | GPIO2 | Reset/DC depending on configuration |
| TTGO T-Display | GPIO5 | CS |
| TTGO T-Display | GPIO16 | DC |
| TTGO T-Display | GPIO23 | Reset |

The UART baud rate is configured as 115200 in the UART TFT variant. Confirm
the BMS connector pinout and voltage levels before connecting.

## MQTT

The primary topic prefixes are `jkbms_2_AP_cell` and `jk_bms_invertor`.
MQTT credentials remain in local `secrets.yaml`.


