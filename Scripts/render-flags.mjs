// Renders Assets/flags-svg/*.svg to Sources/GeographicaFlags/Resources/Flags/*.png with headless Chromium.
//   NODE_PATH=$(npm root -g) node Scripts/render-flags.mjs [widthPx]
// Each PNG keeps the flag's own aspect ratio, is `widthPx` wide (default 720) and has a transparent
// background. Re-run after adding or changing an SVG.
import { createRequire } from 'node:module';
import { readdirSync, mkdirSync, readFileSync } from 'node:fs';
import { resolve, join } from 'node:path';

// createRequire (unlike ESM imports) honours NODE_PATH, so a globally installed Playwright works.
const { chromium } = createRequire(import.meta.url)('playwright');

const width = Number(process.argv[2] ?? 720);
const root = resolve(new URL('..', import.meta.url).pathname);
const inDir = join(root, 'Assets/flags-svg');
const outDir = join(root, 'Sources/GeographicaFlags/Resources/Flags');
mkdirSync(outDir, { recursive: true });

const browser = await chromium.launch();
const page = await browser.newPage({ viewport: { width, height: width * 2 }, deviceScaleFactor: 1 });
let count = 0;
for (const file of readdirSync(inDir).filter((f) => f.endsWith('.svg')).sort()) {
  const svg = readFileSync(join(inDir, file), 'utf8');
  const uri = 'data:image/svg+xml;base64,' + Buffer.from(svg).toString('base64');
  await page.setContent(
    `<html><body style="margin:0;background:transparent"><img id="f" src="${uri}" style="display:block;width:${width}px;height:auto"></body></html>`
  );
  const img = page.locator('#f');
  await img.evaluate((el) => el.decode());
  await img.screenshot({ path: join(outDir, file.replace('.svg', '.png')), omitBackground: true });
  count += 1;
}
await browser.close();
console.log(`rendered ${count} flags at ${width}px wide`);
