#!/bin/bash
# Filter x86/linux-x86 library paths (incompatible with AARCH64)
NEWARGS=()
for arg in "$@"; do
    if [[ "$arg" == -Djava.library.path=*linux-x86* ]]; then
        continue
    fi
    NEWARGS+=("$arg")
done
exec /usr/bin/java "${NEWARGS[@]}"
