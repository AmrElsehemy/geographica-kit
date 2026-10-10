# Flag artwork source

SVGs are copied unmodified from [hampusborgos/country-flags](https://github.com/hampusborgos/country-flags)
at commit `c09927e63705529bbf59ca6684cd9b23225dddad`.

That project states the flags are not under copyright because flags are in the public domain. Some
SVGs include state emblems; check local law for your use (for example, trademark or "flag desecration"
rules) before using them in marketing material.

The PNGs under `Sources/GeographicaFlags/Resources/Flags` are generated from these files:

    NODE_PATH=$(npm root -g) node Scripts/render-flags.mjs 720
