# ESPHome IoT Portfolio

> Embedded monitoring, battery telemetry and visual dashboards built around
> ESP32, ESPHome, MQTT and Home Assistant.

This repository is a portfolio of practical IoT systems: multi-channel
voltage/current measurement, JK-BMS telemetry, TFT/OLED interfaces, sensor
nodes, Ethernet experiments and camera-assisted monitoring.

The focus is not only on getting a board online. Each configuration combines
hardware integration, resilient telemetry, a local fallback interface and
clear observability through MQTT, logs and web/API endpoints.

## Highlights

- Multi-cell and multi-channel energy monitoring with INA219 and ADS1115.
- JK-BMS data acquisition over UART with MQTT publication and TFT dashboards.
- ESP32-CYD and TTGO display interfaces using SPI.
- OLED dashboards using I2C.
- ESP32-C3 sensor nodes for vibration monitoring.
- ESP32-CAM MQTT integration.
- Ethernet and DHT11 demonstration configuration.
- OTA updates, captive portals, local web servers and Home Assistant-friendly
  MQTT discovery patterns.
- Secrets separated from configuration with ESPHome `!secret` references.

## Repository layout

```text
.
├── esphome/
│   ├── energy-monitoring/
│   ├── battery-management/
│   ├── displays/
│   ├── sensors/
│   ├── camera/
│   ├── networking/
│   └── assets/
├── README.md
├── .gitignore
└── secrets.example.yaml
```

Only selected working configurations are published. Local archives,
experiments, Python services, generated ESPHome files and virtual
environments are intentionally kept outside the public repository.

## Project catalogue

### Energy monitoring

| Configuration | Board | Interfaces and role |
|---|---|---|
| [`esp32_4ina219_mqtt_work.yaml`](esphome/energy-monitoring/esp32_4ina219_mqtt_work.yaml) | ESP32 DevKit | ADS1115, I2C on GPIO19/GPIO22, MQTT topic prefix `esphome/ads1115_4cell`, SH1106 OLED |
| [`esp32_4ina219_oled_pages_work.yaml`](esphome/energy-monitoring/esp32_4ina219_oled_pages_work.yaml) | ESP32 DevKit | SPI display, I2C on GPIO21/GPIO22, four I2C sensor addresses `0x40`–`0x45`, MQTT `esphome/4ina219_monitor` |
| [`esp32_ads1115_acs115_4s_display_work.yaml`](esphome/energy-monitoring/esp32_ads1115_acs115_4s_display_work.yaml) | ESP32 DevKit | ADS1115, I2C GPIO21/GPIO22, SPI GPIO18/GPIO23/GPIO19/GPIO5, SH1106 OLED |
| [`esp32_ads1115_acs115_4s_display_wifi_work.yaml`](esphome/energy-monitoring/esp32_ads1115_acs115_4s_display_wifi_work.yaml) | ESP32 DevKit | Wi-Fi variant, ADS1115, I2C GPIO19/GPIO22, SH1106 OLED |
| [`esp32c6_4ina219_mqtt_base_work.yaml`](esphome/energy-monitoring/esp32c6_4ina219_mqtt_base_work.yaml) | ESP32-C6 | SPI GPIO7/GPIO6/GPIO5/GPIO4, I2C GPIO21/GPIO22, MQTT `esphome/4ina219_monitor` |
| [`cyd_4ina219_mqtt_display_work.yaml`](esphome/energy-monitoring/cyd_4ina219_mqtt_display_work.yaml) | ESP32 DevKit / CYD-style display | ILI9341 SPI GPIO14/GPIO13/GPIO12, CS GPIO15, DC GPIO2; MQTT energy dashboard |

### Battery management

| Configuration | Board | Interfaces and role |
|---|---|---|
| [`cyd_jkbms_mqtt_display_work.yaml`](esphome/battery-management/cyd_jkbms_mqtt_display_work.yaml) | ESP32 DevKit / CYD | JK-BMS MQTT display, ILI9341 SPI clock GPIO14, MOSI GPIO13, CS GPIO15, DC GPIO2 |
| [`jkbms_uart_ap_tft_work.yaml`](esphome/battery-management/jkbms_uart_ap_tft_work.yaml) | ESP32 DevKit | JK-BMS UART RX GPIO3 / TX GPIO21, ILI9341 SPI GPIO18/GPIO23/GPIO19, CS GPIO5, DC GPIO4, reset GPIO2 |
| [`lilygo_jkbms_ap_display_work.yaml`](esphome/battery-management/lilygo_jkbms_ap_display_work.yaml) | Lolin32 | JK-BMS MQTT, TTGO T-Display SPI clock GPIO18, MOSI GPIO19, CS GPIO5, DC GPIO16, reset GPIO23 |

### Displays and dashboards

| Configuration | Board | Display configuration |
|---|---|---|
| [`esp32_tft_bms_demo_work.yaml`](esphome/displays/esp32_tft_bms_demo_work.yaml) | ESP32 DevKit | ILI9341 SPI clock GPIO14, MOSI GPIO13, CS GPIO15, DC GPIO2 |
| [`6320-font.ttf`](esphome/battery-management/6320-font.ttf) | Asset | Custom font used by the display-oriented configurations |

### Sensors and alerting

| Configuration | Board | Interfaces and role |
|---|---|---|
| [`vibration_sensor.yaml`](esphome/sensors/vibration_sensor.yaml) | ESP32-C3 DevKitM-1 | SH1106 OLED at `0x3C`, I2C GPIO5/GPIO6, MQTT `vibration_sensor` |
| [`vibration_sensor_hw483.yaml`](esphome/sensors/vibration_sensor_hw483.yaml) | ESP32-C3 DevKitM-1 | HW483-oriented variant, SH1106 OLED, I2C GPIO5/GPIO6, MQTT `vibration_hw483` |
| [`esp-alert.yaml`](esphome/sensors/esp-alert.yaml) | ESP32 DevKit | ILI9342 SPI clock GPIO14, MOSI GPIO13, MISO GPIO12, CS GPIO15, DC GPIO2 |
| [`esphome_radar_cyd.yaml`](esphome/sensors/esphome_radar_cyd.yaml) | ESP32 DevKit / CYD | Radar/alert dashboard, SPI GPIO14/GPIO13/GPIO12, display CS GPIO15, DC GPIO2 |
| [`weather_alert_display.yaml`](esphome/sensors/weather_alert_display.yaml) | ESP32 DevKit | SH1106 OLED at `0x3C`, I2C SDA GPIO21 / SCL GPIO22, MQTT topic prefix `esp` |

### Camera and networking

| Configuration | Board | Interfaces and role |
|---|---|---|
| [`esp32cam_meter_mqtt_work.yaml`](esphome/camera/esp32cam_meter_mqtt_work.yaml) | ESP32 DevKit configuration | Camera/MQTT workflow, I2C SDA GPIO26 / SCL GPIO27, local web/API endpoints |
| [`esp32-dht-ethernet.yaml`](esphome/networking/esp32-dht-ethernet.yaml) | ESP32-C3 DevKitM-1 | Ethernet controller SPI clock GPIO21, MOSI GPIO10, MISO GPIO9, CS GPIO20; DHT11 |
| [`lightcheck_tft_mqtt_work.yaml`](esphome/networking/lightcheck_tft_mqtt_work.yaml) | ESP32 DevKit | TTGO T-Display SPI GPIO18/GPIO19, CS GPIO5, DC GPIO16, reset GPIO23, backlight GPIO4 |

## Pinout reference

The following tables are extracted from the YAML files in this repository.
They describe the configured connections, not a universal wiring guarantee.
Always check the exact board revision, voltage levels, pull-ups and sensor
datasheet before applying power.

### Common I2C buses

| Use case | SDA | SCL | Devices |
|---|---:|---:|---|
| Four-cell monitoring | GPIO21 | GPIO22 | ADS1115 / INA219-class sensors, SH1106 |
| ADS1115 Wi-Fi variant | GPIO19 | GPIO22 | ADS1115, SH1106 |
| ESP32-C3 vibration nodes | GPIO5 | GPIO6 | SH1106 at `0x3C` |
| ESP32-CAM auxiliary bus | GPIO26 | GPIO27 | Camera-side peripheral bus |

### Common SPI buses

| Use case | CLK | MOSI | MISO | CS | DC | Reset/backlight |
|---|---:|---:|---:|---:|---:|---|
| Standard TFT | GPIO18 | GPIO23 | GPIO19 | GPIO5 | GPIO4 | GPIO2 reset |
| CYD TFT | GPIO14 | GPIO13 | GPIO12 | GPIO15 | GPIO2 | Display-dependent |
| TTGO T-Display | GPIO18 | GPIO19 | not configured | GPIO5 | GPIO16 | GPIO23 reset |
| ESP32-C6 base | GPIO7 | GPIO6 | GPIO5 | GPIO4 | display-dependent | display-dependent |
| Ethernet controller | GPIO21 | GPIO10 | GPIO9 | GPIO20 | not applicable | not applicable |

## Architecture

```text
Sensors / JK-BMS / camera
            │
            ▼
         ESPHome
      ┌─────┼─────┐
      │     │     │
     API   MQTT  Web UI
      │     │     │
      ▼     ▼     ▼
 Home Assistant  Broker  Local diagnostics
```

Each node keeps hardware-specific details in its YAML file while sharing the
same operational model:

1. Connect to Wi-Fi or Ethernet.
2. Read the attached sensor, BMS or display.
3. Publish telemetry through MQTT.
4. Expose ESPHome API, logs or a local web endpoint where configured.
5. Support OTA updates without exposing credentials in source control.

## MQTT

MQTT credentials and broker addresses are loaded from `secrets.yaml`.
Representative topic prefixes currently used by the configurations include:

```text
esphome/ads1115_4cell
esphome/ads1115_acs115_4cell
esphome/4ina219_monitor
jkbms_2_AP_cell
jk_bms_invertor
vibration_sensor
vibration_hw483
tele/lightcheck
esp
```

Topic names are part of each configuration and can be adapted to match an
existing Home Assistant installation.

## Setup

### 1. Install ESPHome

```bash
python -m pip install esphome
```

### 2. Create local secrets

```powershell
Copy-Item secrets.example.yaml secrets.yaml
```

Fill in the local file. It is ignored by Git and must never be committed.

### 3. Validate a configuration

```bash
esphome config esphome/energy-monitoring/esp32_4ina219_mqtt_work.yaml
```

### 4. Compile and upload

```bash
esphome run esphome/energy-monitoring/esp32_4ina219_mqtt_work.yaml
```

For a new board, use a USB connection for the first upload. OTA can be used
after the device has joined the network.

## Security

The repository intentionally contains no real passwords, tokens, API keys or
Wi-Fi credentials.

Configurations use references such as:

```yaml
wifi:
  ssid: !secret wifi_ssid
  password: !secret wifi_password

mqtt:
  broker: !secret mqtt_host
  username: !secret mqtt_username
  password: !secret mqtt_password
```

Never replace these references with real values before committing. If a
credential is ever exposed, revoke it and issue a new one; deleting the line
alone is not enough.

## Portfolio notes

This is an evolving hardware portfolio. Configurations are intentionally
kept close to the devices they control so that the pinout, buses, MQTT
integration and display logic remain easy to audit.

For a production deployment, add:

- a photo of the assembled device;
- a verified wiring diagram;
- measured voltage/current limits;
- the exact board revision;
- a Home Assistant dashboard screenshot;
- a short test log after flashing.

## License

Unless stated otherwise in a project directory, this portfolio is released
under the MIT License.
