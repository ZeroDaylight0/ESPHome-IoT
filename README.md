# ESPHome IoT Portfolio

ESPHome and ESP32 projects for energy monitoring, battery management,
displays, sensors, MQTT, and Home Assistant.

## Projects

- `esphome/energy-monitoring/` - INA219 and ADS1115 monitoring
- `esphome/battery-management/` - JK-BMS integrations
- `esphome/displays/` - OLED, TFT, and CYD configurations
- `esphome/sensors/` - vibration, radar, and weather projects
- `esphome/camera/` - ESP32-CAM MQTT configuration
- `esphome/networking/` - Ethernet and MQTT examples

## Quick start

Install ESPHome:

```bash
python -m pip install esphome
```

Copy `secrets.example.yaml` to `secrets.yaml` and fill in local values.
The real secrets file is intentionally ignored by Git.

Validate a configuration:

```bash
esphome config esphome/energy-monitoring/esp32_4ina219_mqtt_work.yaml
```

Upload it:

```bash
esphome run esphome/energy-monitoring/esp32_4ina219_mqtt_work.yaml
```

## Security

Passwords, tokens, Wi-Fi credentials, and MQTT credentials are kept in
`secrets.yaml` and are never committed to this repository.
