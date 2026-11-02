# Contributing

## Adding a new device config

1. Place the YAML in the matching folder under `esphome/` (`sensors/`, `displays/`, `energy-monitoring/`, ...).
2. Use `!secret` for every credential — no hardcoded passwords or keys.
3. Validate before committing:

   ```bash
   esphome config esphome/<folder>/<device>.yaml
   yamllint esphome/
   ```

4. Add a short section to the folder `README.md`: board, wiring and a photo if possible.

## Style

- 2-space indentation, LF line endings (see `.editorconfig`).
- Prefer `substitutions:` for pins and names so configs are easy to adapt.
