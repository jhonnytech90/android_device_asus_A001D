#!/bin/bash
# Aplica todos os patches de compatibilidade para build LineageOS 17.1 A001D
# Detecta AARCH64 e pula patches x86-incompativeis em VM Intel
set -e

BASE="$(cd "$(dirname "$0")/../../../.."; pwd)"
PATCHES="$(dirname "$0")"
ARCH="$(uname -m)"

echo "Host: $ARCH"
echo "Base: $BASE"
echo "Patches: $PATCHES"

# ---- Python 2->3 fixes (build/make) ----
echo ""
echo "=== build/make (Python 2->3) ==="
if git -C "$BASE/build/make" apply --check "$PATCHES/build_make.patch" 2>/dev/null; then
  git -C "$BASE/build/make" apply "$PATCHES/build_make.patch" && echo "OK"
else
  echo "SKIP (ja aplicado ou conflito)"
fi

# ---- Python 2->3 fixes (bionic) ----
echo ""
echo "=== bionic (Python 2->3) ==="
if git -C "$BASE/bionic" apply --check "$PATCHES/bionic.patch" 2>/dev/null; then
  git -C "$BASE/bionic" apply "$PATCHES/bionic.patch" && echo "OK"
else
  echo "SKIP (ja aplicado ou conflito)"
fi

# ---- JDK9 wrappers ----
echo ""
echo "=== prebuilts/jdk9 wrappers ==="
JDK9=$BASE/prebuilts/jdk/jdk9/linux-x86/bin

# javac wrapper: universal (compat JDK11 + filtra java.xml.ws.annotation)
cp "$PATCHES/jdk9_javac_wrapper.sh" "$JDK9/javac"
chmod 755 "$JDK9/javac"
echo "javac wrapper: OK"

if [ "$ARCH" = "aarch64" ]; then
  # java wrapper: AARCH64 apenas (filtra -Djava.library.path=*linux-x86*)
  cp "$PATCHES/jdk9_java_wrapper.sh" "$JDK9/java"
  chmod 755 "$JDK9/java"
  echo "java wrapper (AARCH64): OK"
else
  echo "java wrapper: SKIP (x86_64 usa o binario original)"
fi

echo ""
echo "=== Todos os patches aplicados! ==="
