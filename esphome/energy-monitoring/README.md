# Energy monitoring

ESP32-based voltage and current monitoring with INA219-class sensors, ADS1115,
OLED displays and MQTT telemetry.

## Configurations

| File | Board | Main interfaces |
|---|---|---|
| `esp32_4ina219_mqtt_work.yaml` | ESP32 DevKit | I2C GPIO19/GPIO22, ADS1115 `0x48`, SH1106 `0x3C` |
| `esp32_4ina219_oled_pages_work.yaml` | ESP32 DevKit | I2C GPIO21/GPIO22, four sensor addresses, SPI display |
| `esp32_ads1115_acs115_4s_display_work.yaml` | ESP32 DevKit | I2C GPIO21/GPIO22, SPI GPIO18/GPIO23/GPIO19/GPIO5 |
| `esp32_ads1115_acs115_4s_display_wifi_work.yaml` | ESP32 DevKit | I2C GPIO19/GPIO22, ADS1115 `0x48`, SH1106 `0x3C` |
| `esp32c6_4ina219_mqtt_base_work.yaml` | ESP32-C6 | SPI GPIO7/GPIO6/GPIO5/GPIO4, I2C GPIO21/GPIO22 |
| `cyd_4ina219_mqtt_display_work.yaml` | ESP32 DevKit/CYD | ILI9341 SPI GPIO14/GPIO13/GPIO12, CS GPIO15, DC GPIO2 |

## Pinouts by configuration

### `esp32_4ina219_mqtt_work.yaml`

| Function | GPIO | Notes |
|---|---:|---|
| I2C SDA | GPIO19 | INA219/ADS1115 bus |
| I2C SCL | GPIO22 | INA219/ADS1115 bus |

### `esp32_4ina219_oled_pages_work.yaml`

| Function | GPIO | Notes |
|---|---:|---|
| Display SPI CLK | GPIO18 | SPI clock |
| Display SPI MOSI | GPIO23 | SPI data |
| Display SPI MISO | GPIO19 | SPI response |
| Display CS | GPIO5 | Chip select |
| I2C SDA | GPIO21 | Sensor/display bus |
| I2C SCL | GPIO22 | Sensor/display bus |

### `esp32_ads1115_acs115_4s_display_work.yaml`

| Function | GPIO | Notes |
|---|---:|---|
| Display SPI CLK | GPIO18 | SPI clock |
| Display SPI MOSI | GPIO23 | SPI data |
| Display SPI MISO | GPIO19 | SPI response |
| Display CS | GPIO5 | Chip select |
| I2C SDA | GPIO21 | ADS1115 bus |
| I2C SCL | GPIO22 | ADS1115 bus |
| Analog input | GPIO34 | ACS115 input |

### `esp32_ads1115_acs115_4s_display_wifi_work.yaml`

| Function | GPIO | Notes |
|---|---:|---|
| I2C SDA | GPIO19 | ADS1115/SH1106 bus |
| I2C SCL | GPIO22 | ADS1115/SH1106 bus |

### `esp32c6_4ina219_mqtt_base_work.yaml`

| Function | GPIO | Notes |
|---|---:|---|
| SPI CLK | GPIO7 | SCK / CLK |
| SPI MOSI | GPIO6 | MOSI / DI |
| SPI MISO | GPIO5 | MISO / DO |
| SPI CS | GPIO4 | CS / SS |
| I2C SDA | GPIO21 | INA219 bus |
| I2C SCL | GPIO22 | INA219 bus |

### `cyd_4ina219_mqtt_display_work.yaml`

ESP32 DevKit/CYD with ILI9341 display:

| Function | GPIO | Notes |
|---|---:|---|
| Display SPI CLK | GPIO14 | ILI9341 clock |
| Display SPI MOSI | GPIO13 | ILI9341 data |
| Display SPI MISO | GPIO12 | ILI9341 response |
| Display CS | GPIO15 | Chip select |
| Display DC | GPIO2 | Data/command |
| Display backlight | GPIO21 | PWM output |

Verify the exact board revision and sensor addresses before wiring.

## MQTT and operation

The configurations use `!secret` values for Wi-Fi and MQTT credentials.
Common topic prefixes are `esphome/ads1115_4cell`,
`esphome/ads1115_acs115_4cell` and `esphome/4ina219_monitor`.
Several variants expose an OLED dashboard, ESPHome API, web server and OTA.
