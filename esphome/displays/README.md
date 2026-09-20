# Displays and dashboards

Display-focused ESPHome configuration for an ESP32 DevKit and ILI9341 TFT.

## Configuration

| File | Board | Display |
|---|---|---|
| `esp32_tft_bms_demo_work.yaml` | ESP32 DevKit | ILI9341 over SPI |

## Pinout for `esp32_tft_bms_demo_work.yaml`

ESP32 DevKit with ILI9341 TFT:

| Function | GPIO | Notes |
|---|---:|---|
| TFT SPI CLK | GPIO14 | Display clock |
| TFT SPI MOSI | GPIO13 | Display data |
| TFT CS | GPIO15 | Chip select |
| TFT DC | GPIO2 | Data/command |
| TFT backlight | GPIO21 | PWM output |

The exact panel revision, power pins and backlight wiring should be added to
the final diagram before using this configuration as a build guide.
