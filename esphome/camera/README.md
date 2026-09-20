# ESP32-CAM MQTT monitoring

Camera-oriented ESPHome configuration for meter monitoring and MQTT
integration.

## Configuration

| File | Board | Interfaces |
|---|---|---|
| `esp32cam_meter_mqtt_work.yaml` | ESP32 DevKit configuration | I2C GPIO26/GPIO27, Wi-Fi, MQTT, API and web server |

## Pinout

| Signal | GPIO |
|---|---:|
| I2C SDA | GPIO26 |
| I2C SCL | GPIO27 |

Camera module power, camera data pins and the exact sensor wiring must be
documented from the physical board revision before publishing a final diagram.


