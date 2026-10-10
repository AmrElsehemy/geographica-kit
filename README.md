# GeographicaKit

Geography domain data for the **Geographica** family of independent iOS apps (flag quiz, country shapes, map puzzle, capital challenge, …).

GeographicaKit knows *what geography games know*. It deliberately has **no dependency on GameTimeKit** (which handles how games behave: haptics, audio, monetisation) so the same data can power apps, websites and content tooling.

## Modules

- `GeographicaCore`: `Country`, `Continent`, and the offline `CountryCatalog` (197 entries: 193 UN members + Vatican City, Palestine, Kosovo, Taiwan).
- `GeographicaFlags`: flag artwork (bundled PNGs plus a SwiftUI `FlagView`), emoji fallback, `FlagDifficulty` tiers, and curated groups of look-alike flags for building good distractors.

Add more modules (maps, borders) only when a second app needs them.

## Test

```bash
swift test
```

## Flag artwork

`FlagCatalog.imageURL(iso2:)` returns a bundled PNG per country (720 px wide, native aspect ratio, transparent background; 3.3 MB for all 197). On Apple platforms, `FlagView(iso2:)` renders it and falls back to the emoji if it can't be loaded.

The SVG sources are in `Assets/flags-svg` (public domain, see `ATTRIBUTION.md`). To regenerate the PNGs after changing an SVG: `NODE_PATH=$(npm root -g) node Scripts/render-flags.mjs 720` (needs Playwright with Chromium).
