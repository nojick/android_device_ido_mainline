#
# Copyright 2020, Pavel Dubrova <pashadubrova@gmail.com>
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
KERNEL_MODS := $(wildcard /out/target/product/ido/obj/KERNEL_OBJ/*.ko)

# Following modules go to vendor partition
VENDOR_KERN_MODS :=
BOARD_VENDOR_KERNEL_MODULES := $(filter $(VENDOR_KERN_MODS),$(KERNEL_MODS))
BOARD_VENDOR_KERNEL_MODULES := $(addprefix $(KERNEL_MODS)/, $(notdir $(BOARD_VENDOR_KERNEL_MODULES_LOAD)))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_MODS)/, $(notdir $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD)))
# All other modules go to ramdisk
BOARD_GENERIC_RAMDISK_KERNEL_MODULES := $(filter-out $(VENDOR_KERN_MODS),$(KERNEL_MODS))


# Inherit from those products. Most specific first
$(call inherit-product, device/xiaomi/ido/device.mk)
# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
# Enable Scoped Storage related
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

PRODUCT_NAME := lineage_ido
PRODUCT_DEVICE := ido
PRODUCT_MODEL := Xiaomi Redmi 3
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
