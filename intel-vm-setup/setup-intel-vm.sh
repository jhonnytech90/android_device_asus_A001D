#!/bin/bash
# =============================================================
# Setup LineageOS 17.1 para ASUS A001D - VM Intel (x86_64)
# =============================================================
set -e

LINEAGE_DIR="${1:-$HOME/lineageos}"
echo "=== Setup LineageOS 17.1 A001D em: $LINEAGE_DIR ==="
mkdir -p "$LINEAGE_DIR"
cd "$LINEAGE_DIR"

# 1. repo init
echo ""
echo "=== [1/5] repo init ==="
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1 --depth=1

# 2. local manifest
echo ""
echo "=== [2/5] local manifest ==="
mkdir -p .repo/local_manifests
cp "$(dirname "$0")/local_manifest.xml" .repo/local_manifests/a001d.xml
echo "Manifesto copiado para .repo/local_manifests/a001d.xml"

# 3. repo sync
echo ""
echo "=== [3/5] repo sync (vai demorar ~1h+) ==="
repo sync -c -j8 --no-tags --no-clone-bundle --force-sync 2>&1 | tee /tmp/repo_sync.log

# 4. patches (Python 2->3, javac JDK11 compat)
echo ""
echo "=== [4/5] aplicando patches ==="
device/asus/A001D/patches-aarch64/apply-patches.sh

# 5. build
echo ""
echo "=== [5/5] build ==="
source build/envsetup.sh
lunch lineage_A001D-userdebug
echo ""
echo "Pronto! Rode: brunch A001D"
echo "Ou: mka bacon"
