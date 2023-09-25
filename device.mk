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

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_SOONG_NAMESPACES += external/mesa3d

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# VNDK
PRODUCT_USE_VNDK_OVERRIDE := true

# AAPT configuration
PRODUCT_AAPT_CONFIG := normal
# PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true

# Build recovery.img
PRODUCT_BUILD_RECOVERY_IMAGE := true

# Audio policy configuration
USE_XML_AUDIO_POLICY_CONF := 1

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.service \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.bluetooth.audio@2.1-impl

# Build default bluetooth a2dp and usb audio HALs
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.usb.default \
    audio.r_submix.default

# Build tinyalsa cli tools for debugging
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix \
    tinypcminfo

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1-service.btlinux

# Display
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3-service.clearkey \
    android.hardware.drm@1.3-service.widevine \
    android.hardware.graphics.allocator@4.0-service.minigbm_msm \
    android.hardware.graphics.composer@2.3-impl \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.graphics.mapper@4.0-impl.minigbm_msm \
    gralloc.minigbm_msm \
    hwcomposer.drm \
    libGLES_mesa \
    libEGL_mesa \
    libGLESv1_CM_mesa \
    libGLESv2_mesa \
    libgallium_dri \
    libglapi

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-service \
    android.hardware.health@2.1-impl

# TODO: disable this service once we implement system suspend
PRODUCT_PACKAGES += \
    suspend_blocker

# Keymaster HAL
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1-service \

# Lights AIDL HALs
PRODUCT_PACKAGES += \
    vendor.qti.hardware.lights.service

PRODUCT_PACKAGES += \
    sensors.iio \
    android.hardware.sensors@1.0-impl:64 \
    android.hardware.sensors@1.0-service

#
# Power HAL
#
PRODUCT_PACKAGES += \
    android.hardware.power-service.example

#
# PowerStats HAL
#
PRODUCT_PACKAGES += \
    android.hardware.power.stats-service.example
    
# Memtrack
#PRODUCT_PACKAGES += \
#    memtrack.msm8939 \
#    android.hardware.memtrack@1.0-service \
#    android.hardware.memtrack@1.0-impl

# Usb
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Wi-Fi
PRODUCT_PACKAGES += \
    hostapd \
    libwpa_client \
    wpa_supplicant \
    wpa_supplicant.conf \
    wificond \
    wifilogd

# vndk/vndk-sp/ll-ndk modules
PRODUCT_PACKAGES += \
    vndk_package

# Audio config
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml

# Media codecs config file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml

# Wi-Fi config overlay
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# WCNSS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_wlan_dictionary.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_wlan_dictionary.dat

# venus
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/venus.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.b00 \
    $(LOCAL_PATH)/firmware/venus.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.b01 \
    $(LOCAL_PATH)/firmware/venus.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.b02 \
    $(LOCAL_PATH)/firmware/venus.b03:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.b03 \
    $(LOCAL_PATH)/firmware/venus.b04:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.b04 \
    $(LOCAL_PATH)/firmware/venus.mbn:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.mbn \
    $(LOCAL_PATH)/firmware/venus.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.mdt \
    $(LOCAL_PATH)/firmware/wcnss.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b00 \
    $(LOCAL_PATH)/firmware/wcnss.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b01 \
    $(LOCAL_PATH)/firmware/wcnss.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b02 \
    $(LOCAL_PATH)/firmware/wcnss.b04:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b04 \
    $(LOCAL_PATH)/firmware/wcnss.b06:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b06 \
    $(LOCAL_PATH)/firmware/wcnss.b09:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b09 \
    $(LOCAL_PATH)/firmware/wcnss.b10:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b10 \
    $(LOCAL_PATH)/firmware/wcnss.b11:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b11 \
    $(LOCAL_PATH)/firmware/wcnss.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.mdt \

# Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/fstab.ramdisk.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(LOCAL_PATH)/rootdir/vendor/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/init.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.usb.rc \
    $(LOCAL_PATH)/rootdir/vendor/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    $(LOCAL_PATH)/rootdir/vendor/etc/init/sensors.ido.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/sensors.ido.rc \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.gralloc=minigbm_msm \
    ro.hardware.hwcomposer=drm \
    debug.sf.no_hw_vsync=1 \
    ro.opengles.version=196608 \
    ro.sf.lcd_density=320 \

# HACK: Avoid usb crash
PRODUCT_PRODUCT_PROPERTIES := \
    persist.adb.nonblocking_ffs=0 \
    ro.adb.nonblocking_ffs=0

# Wi-Fi interface name
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
