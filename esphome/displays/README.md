# Displays and dashboards

Display-focused ESPHome configuration for an ESP32 DevKit and ILI9341 TFT.

![Device photo placeholder](images/device-placeholder.svg)

## Configuration

| File | Board | Display |
|---|---|---|
| `esp32_tft_bms_demo_work.yaml` | ESP32 DevKit | ILI9341 over SPI |

## Pinout

![Wiring placeholder](images/wiring-placeholder.svg)

| Signal | GPIO |
|---|---:|
| CLK | GPIO14 |
| MOSI | GPIO13 |
| CS | GPIO15 |
| DC | GPIO2 |

The exact panel revision, power pins and backlight wiring should be added to
the final diagram before using this configuration as a build guide.

## Replace these placeholders

- `images/device-placeholder.svg` - display photo.
- `images/wiring-placeholder.svg` - SPI wiring diagram.
- `images/pinout-placeholder.svg` - annotated display pinout.
