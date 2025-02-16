LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Include any additional makefiles here
include $(call all-makefiles-under,$(LOCAL_PATH))

# Recovery init configuration
include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.RMX3761.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := rootdir/etc/init.recovery.RMX3761.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)
