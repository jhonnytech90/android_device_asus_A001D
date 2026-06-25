#!/bin/bash
# --no-threads: desativa parallelismo do linker (QEMU futex issue)
# -plugin-opt=jobs=1: limita threads do LLVMgold ThinLTO a 1 (QEMU futex deadlock fix)
exec -a ld.lld "$(dirname "$0")/ld.lld.real" --no-threads -plugin-opt=jobs=1 "$@"
