# JK-BMS battery management

ESPHome configurations for reading JK-BMS telemetry, publishing it to MQTT
and displaying battery data on TFT panels.

## Configurations

| File | Board | Connection |
|---|---|---|
| `cyd_jkbms_mqtt_display_work.yaml` | ESP32 DevKit/CYD | JK-BMS telemetry, ILI9341 display |
| `jkbms_uart_ap_tft_work.yaml` | ESP32 DevKit | UART RX GPIO3 / TX GPIO21, ILI9341 TFT |
| `lilygo_jkbms_ap_display_work.yaml` | Lolin32 | JK-BMS MQTT, TTGO T-Display |

## Pinouts by configuration

### `cyd_jkbms_mqtt_display_work.yaml`

ESP32 DevKit/CYD with an ILI9341 display. JK-BMS data is received through
MQTT, so this configuration has no local BMS UART pins.

| Function | GPIO | Notes |
|---|---:|---|
| TFT SPI CLK | GPIO14 | ILI9341 clock |
| TFT SPI MOSI | GPIO13 | ILI9341 data |
| TFT CS | GPIO15 | Chip select |
| TFT DC | GPIO2 | Data/command |
| TFT backlight | GPIO21 | PWM output |

### `jkbms_uart_ap_tft_work.yaml`

ESP32 DevKit with direct JK-BMS UART and ILI9341 TFT:

| Function | GPIO | Notes |
|---|---:|---|
| JK-BMS RX | GPIO3 | ESP32 UART receive |
| JK-BMS TX | GPIO21 | ESP32 UART transmit |
| TFT SPI CLK | GPIO18 | Display clock |
| TFT SPI MOSI | GPIO23 | Display data |
| TFT SPI MISO | GPIO19 | Display response |
| TFT CS | GPIO5 | Chip select |
| TFT DC | GPIO4 | Data/command |
| TFT reset | GPIO2 | Display reset |
| Wi-Fi reset button | GPIO0 | Active-low input |

### `lilygo_jkbms_ap_display_work.yaml`

Lolin32 with TTGO T-Display-style SPI panel:

| Function | GPIO | Notes |
|---|---:|---|
| Display SPI CLK | GPIO18 | Display clock |
| Display SPI MOSI | GPIO19 | Display data |
| Status LED | GPIO15 | WS2812 output |
| TFT CS | GPIO5 | Chip select |
| TFT DC | GPIO16 | Data/command |
| TFT reset | GPIO23 | Display reset |
| Wi-Fi reset button | GPIO0 | Active-low input |

The UART baud rate is configured as 115200 in the UART TFT variant. Confirm
the BMS connector pinout and voltage levels before connecting.

## MQTT

The primary topic prefixes are `jkbms_2_AP_cell` and `jk_bms_invertor`.
MQTT credentials remain in local `secrets.yaml`.

