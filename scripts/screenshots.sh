#!/bin/bash
# Regenerate App Store screenshots on a 6.9" simulator.
#
# App state is injected through the UserDefaults argument domain
# (`-key value` launch arguments outperform writing the preferences plist,
# which the simulator's cfprefsd caches and overwrites).
set -euo pipefail

BID="com.mengmusanqian.hknewcomerguide"
SCHEME="HKNewcomerGuide"
OUT="fastlane/screenshots/zh-Hant"
DERIVED="build/sim"

xcodegen generate

RUNTIME=$(xcrun simctl list runtimes --json \
  | python3 -c "import json,sys; rs=[r for r in json.load(sys.stdin)['runtimes'] if r['isAvailable'] and 'iOS' in r['name']]; print(sorted(rs, key=lambda r: [int(x) for x in r['version'].split('.')])[-1]['identifier'])")

DEVTYPE=$(xcrun simctl list devicetypes --json \
  | python3 -c "import json,sys; ds=[d for d in json.load(sys.stdin)['devicetypes'] if 'Pro Max' in d['name']]; print(sorted(ds, key=lambda d: d['name'])[-1]['identifier'])")

echo "runtime=$RUNTIME"
echo "devicetype=$DEVTYPE"

SIM=$(xcrun simctl create "ASC-Shots" "$DEVTYPE" "$RUNTIME")
trap 'xcrun simctl delete "$SIM" >/dev/null 2>&1 || true' EXIT

xcodebuild -project HKNewcomerGuide.xcodeproj -scheme "$SCHEME" \
  -destination "id=$SIM" -derivedDataPath "$DERIVED" \
  -quiet build

APP="$DERIVED/Build/Products/Debug-iphonesimulator/$SCHEME.app"

xcrun simctl bootstatus "$SIM" -b
xcrun simctl install "$SIM" "$APP"
# Freeze the status bar so screenshots do not show a live clock or carrier.
xcrun simctl status_bar "$SIM" override --time "9:41" --batteryState charged --batteryLevel 100

mkdir -p "$OUT"

grab() {
  local name=$1; shift
  xcrun simctl terminate "$SIM" "$BID" >/dev/null 2>&1 || true
  sleep 2
  xcrun simctl launch "$SIM" "$BID" "$@" >/dev/null
  sleep 7
  xcrun simctl io "$SIM" screenshot "$OUT/$name.png" >/dev/null
  echo "captured $name"
}

grab 1_picker    --args -selectedTab 0 -selectedPersonaID ''
grab 2_talent    --args -selectedTab 0 -selectedPersonaID talent -doneStepKeys '("talent#0","talent#1")'
grab 3_directory --args -selectedTab 1 -selectedPersonaID talent
grab 4_favorites --args -selectedTab 2 -favoriteEntryIDs '("octopus","whatsapp","myobservatory","pps","immd")'

# App Store Connect rejects screenshots that carry an alpha channel.
python3 - "$OUT" <<'PY'
import sys, pathlib
from PIL import Image
out = pathlib.Path(sys.argv[1])
for p in sorted(out.glob("*.png")):
    im = Image.open(p)
    if im.mode != "RGB":
        bg = Image.new("RGB", im.size, (255, 255, 255))
        im = im.convert("RGBA")
        bg.paste(im, mask=im.split()[-1])
        im = bg
        im.save(p, "PNG")
    print(f"{p.name}: {im.size} {im.mode}")
PY
