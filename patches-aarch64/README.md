# Patches para build LineageOS 17.1 - ASUS A001D

Patches acumulados durante build no Oracle Cloud (AARCH64).

## Aplicar patches apos repo sync

```bash
device/asus/A001D/patches-aarch64/apply-patches.sh
```

## Conteudo

| Arquivo | Escopo | Descricao |
|---------|--------|-----------|
| build_make.patch | Universal | Python 2→3: check_boot_jars, auto_gen_test_config, check_elf_file, etc. |
| bionic.patch | Universal | Python 2→3: gensyscalls, genseccomp, genfunctosyscallnrs |
| prebuilts_jdk9.patch | **AARCH64 only** | Wrappers java/javac/jar: filtra paths linux-x86 e compat JDK11 |

O script  detecta a arquitetura automaticamente e pula
 em hosts x86_64.
