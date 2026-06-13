#
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Base — mais específico primeiro
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Device
$(call inherit-product, device/asus/A001D/device.mk)

# LineageOS 17.1 common
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Identificação do produto — deve vir por último
PRODUCT_DEVICE       := A001D
PRODUCT_NAME         := lineage_A001D
PRODUCT_BRAND        := asus
PRODUCT_MODEL        := ASUS_A001D
PRODUCT_MANUFACTURER := asus

# Fingerprint stock Oreo — mantém compatibilidade GMS e SafetyNet
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="WW_Phone-user 8.1.0 OPM1 15.32.1902.653 release-keys" \
    PRODUCT_DEVICE=ASUS_A001D_2 \
    PRODUCT_NAME=WW_Phone

BUILD_FINGERPRINT := asus/WW_Phone/ASUS_A001D_2:8.1.0/OPM1/15.32.1902.653-20190307:user/release-keys
