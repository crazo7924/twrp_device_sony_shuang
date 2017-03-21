#
# Copyright (C) 2011 The Android Open Source Project
#           (C) 2013-2016 The CyanogenMod Project
#           (C) 2017 The LineageOS Project
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

# Inherit device configurations
$(call inherit-product, device/sony/falconss/device.mk)

# Device display
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Device identifications
PRODUCT_DEVICE := falconss
PRODUCT_NAME := omni_falconss
PRODUCT_RELEASE_NAME := falconss
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
PRODUCT_MODEL := Xperia E1

# Prebuilts
PRODUCT_COPY_FILES += \
    device/sony/falconss/prebuilts/dt.img:dt.img \
    device/sony/falconss/prebuilts/kernel:kernel
