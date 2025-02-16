#
# Copyright (C) 2024 TWRP Team
#
# Device tree for RMX3761
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Device information
PRODUCT_DEVICE := RMX3761
PRODUCT_NAME := omni_RMX3761
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX3761
PRODUCT_MANUFACTURER := realme

# Recovery flags
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_PACKAGES += \
    recovery \
    twrp-app
