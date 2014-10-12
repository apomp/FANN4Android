LOCAL_PATH := $(call my-dir)

# INCLUDE OPENCV AND OWN MODULE
include $(CLEAR_VARS)

# Float FANN Module
LOCAL_MODULE    := float-fann
LOCAL_SRC_FILES := fann/floatfann.c \
				   fann/fann_cascade.c \
				   fann/fann_error.c \
				   fann/fann_io.c \
				   fann/fann_train_data.c \
				   fann/fann.c 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/fann/include
include $(BUILD_STATIC_LIBRARY)

# Double FANN Module
include $(CLEAR_VARS)
LOCAL_MODULE    := double-fann
LOCAL_SRC_FILES := fann/doublefann.c \
				   fann/fann_cascade.c \
				   fann/fann_error.c \
				   fann/fann_io.c \
				   fann/fann_train_data.c \
				   fann/fann.c 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/fann/include
include $(BUILD_STATIC_LIBRARY)

# Static FANN Module
include $(CLEAR_VARS)
LOCAL_MODULE    := fixed-fann
LOCAL_SRC_FILES := fann/fixedfann.c \
				   fann/fann_cascade.c \
				   fann/fann_error.c \
				   fann/fann_io.c \
				   fann/fann_train_data.c \
				   fann/fann.c 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/fann/include
include $(BUILD_STATIC_LIBRARY)

# FANN Module
include $(CLEAR_VARS)
LOCAL_MODULE    := fann
LOCAL_SRC_FILES := fann/fann_cascade.c \
				   fann/fann_error.c \
				   fann/fann_io.c \
				   fann/fann_train_data.c \
				   fann/fann.c 
LOCAL_C_INCLUDES += $(LOCAL_PATH)/fann/include
include $(BUILD_STATIC_LIBRARY)

# MAIN Module FANN
include $(CLEAR_VARS)

LOCAL_MODULE            :=  fann-test
LOCAL_SRC_FILES         := 	main/fann-test-jni.cpp
LOCAL_LDLIBS            += -lm -llog -landroid
LOCAL_STATIC_LIBRARIES  += float-fann double-fann fixed-fann fann
LOCAL_CFLAGS            += -std=c++11 -I$(LOCAL_PATH)/fann/include
include $(BUILD_SHARED_LIBRARY)