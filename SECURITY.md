# Security Policy

## Secrets

All configs read Wi-Fi, API, OTA and MQTT credentials via `!secret`.

1. Copy `secrets.example.yaml` to `secrets.yaml`.
2. Fill in your own values.
3. **Never commit `secrets.yaml`** — it is listed in `.gitignore`.

If you accidentally pushed real credentials, change the Wi-Fi/MQTT passwords and
regenerate the ESPHome API encryption key and OTA password.

## Reporting a vulnerability

Please do **not** open a public issue. Use
[GitHub private vulnerability reporting](https://github.com/ZeroDaylight0/ESPHome-IoT/security/advisories/new).
