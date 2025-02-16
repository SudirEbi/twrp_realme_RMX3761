#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from RMX3761 device
$(call inherit-product, device/realme/RMX3761/device.mk)

PRODUCT_NAME := lineage_RMX3761
PRODUCT_DEVICE := RMX3761
PRODUCT_MANUFACTURER := realme
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX3761

PRODUCT_GMS_CLIENTID_BASE := android-oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="RMX3761-user 14 UP1A.231005.007 T.R4T2.1731481403 release-keys"

BUILD_FINGERPRINT := realme/RMX3761/RE58C6:14/UP1A.231005.007/T.R4T2.1731481403:user/release-keys
