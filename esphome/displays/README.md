# Displays and dashboards

Display-focused ESPHome configuration for an ESP32 DevKit and ILI9341 TFT.

## Configuration

| File | Board | Display |
|---|---|---|
| `esp32_tft_bms_demo_work.yaml` | ESP32 DevKit | ILI9341 over SPI |

## Pinout

| Signal | GPIO |
|---|---:|
| CLK | GPIO14 |
| MOSI | GPIO13 |
| CS | GPIO15 |
| DC | GPIO2 |

The exact panel revision, power pins and backlight wiring should be added to
the final diagram before using this configuration as a build guide.


