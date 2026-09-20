# Energy monitoring

ESP32-based voltage and current monitoring with INA219-class sensors, ADS1115,
OLED displays and MQTT telemetry.

![Device photo placeholder](images/device-placeholder.svg)

> Replace the placeholder with a photo of the assembled device.

## Configurations

| File | Board | Main interfaces |
|---|---|---|
| `esp32_4ina219_mqtt_work.yaml` | ESP32 DevKit | I2C GPIO19/GPIO22, ADS1115 `0x48`, SH1106 `0x3C` |
| `esp32_4ina219_oled_pages_work.yaml` | ESP32 DevKit | I2C GPIO21/GPIO22, four sensor addresses, SPI display |
| `esp32_ads1115_acs115_4s_display_work.yaml` | ESP32 DevKit | I2C GPIO21/GPIO22, SPI GPIO18/GPIO23/GPIO19/GPIO5 |
| `esp32_ads1115_acs115_4s_display_wifi_work.yaml` | ESP32 DevKit | I2C GPIO19/GPIO22, ADS1115 `0x48`, SH1106 `0x3C` |
| `esp32c6_4ina219_mqtt_base_work.yaml` | ESP32-C6 | SPI GPIO7/GPIO6/GPIO5/GPIO4, I2C GPIO21/GPIO22 |
| `cyd_4ina219_mqtt_display_work.yaml` | ESP32 DevKit/CYD | ILI9341 SPI GPIO14/GPIO13/GPIO12, CS GPIO15, DC GPIO2 |

## Pinout

![Wiring placeholder](images/wiring-placeholder.svg)

| Bus | Pin | Purpose |
|---|---:|---|
| I2C | GPIO21 | SDA |
| I2C | GPIO22 | SCL |
| I2C variant | GPIO19 | SDA on Wi-Fi/ADS1115 variant |
| SPI | GPIO18 | CLK |
| SPI | GPIO23 | MOSI |
| SPI | GPIO19 | MISO |
| SPI | GPIO5 | CS |

Verify the exact board revision and sensor addresses before wiring.

## MQTT and operation

The configurations use `!secret` values for Wi-Fi and MQTT credentials.
Common topic prefixes are `esphome/ads1115_4cell`,
`esphome/ads1115_acs115_4cell` and `esphome/4ina219_monitor`.
Several variants expose an OLED dashboard, ESPHome API, web server and OTA.

## Images to replace

- `images/device-placeholder.svg` - finished device photo.
- `images/wiring-placeholder.svg` - verified wiring diagram.
- `images/pinout-placeholder.svg` - annotated board pinout.
