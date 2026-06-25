#!/bin/bash
# Filter out JDK9-specific modules not present in JDK 11
# Also inject --module-version 11 when --system=none is detected (core-all-system-modules)
NEWARGS=()
has_system_none=false
for arg in "$@"; do
    if [[ "$arg" == "-J--add-modules=java.xml.ws.annotation" ]]; then
        continue
    fi
    if [[ "$arg" == "--system=none" ]]; then
        has_system_none=true
    fi
    NEWARGS+=("$arg")
done
if $has_system_none; then
    NEWARGS+=("--module-version" "11")
fi
exec /usr/bin/javac "${NEWARGS[@]}"
