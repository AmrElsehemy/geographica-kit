# GeographicaKit

Geography domain data for the **Geographica** family of independent iOS apps (flag quiz, country shapes, map puzzle, capital challenge, …).

GeographicaKit knows *what geography games know*. It deliberately has **no dependency on GameTimeKit** (which handles how games behave: haptics, audio, monetisation) so the same data can power apps, websites and content tooling.

## Modules

- `GeographicaCore`: `Country`, `Continent`, and the offline `CountryCatalog` (197 entries: 193 UN members + Vatican City, Palestine, Kosovo, Taiwan).
- `GeographicaFlags`: flag emoji, `FlagDifficulty` tiers, and curated groups of look-alike flags for building good distractors.

Add more modules (maps, borders) only when a second app needs them.

## Test

```bash
swift test
```
