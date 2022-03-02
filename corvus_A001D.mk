#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from A001D device
$(call inherit-product, device/asus/A001D/device.mk)

# Inherit some common Corvus stuff
$(call inherit-product, vendor/corvus/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := A001D
PRODUCT_NAME := corvus_A001D
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_A001D
PRODUCT_MANUFACTURER := asus

PRODUCT_BUILD_PROP_OVERRIDES += \
PRIVATE_BUILD_DESC="WW_Phone-user 8.1.0 OPM1 15.32.1902.653 release-keys" \
PRODUCT_DEVICE=ASUS_A001D_2 \
PRODUCT_NAME=WW_Phone

BUILD_FINGERPRINT := asus/WW_Phone/ASUS_A001D_2:8.1.0/OPM1/15.32.1902.653-20190307:user/release-keys
