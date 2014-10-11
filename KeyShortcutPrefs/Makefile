#ARCHS = armv7 arm64
TARGET = iphone:latest:7.0

include ../theos/makefiles/common.mk

BUNDLE_NAME = KeyShortcut
KeyShortcut_FILES = KeyShortcut.mm
KeyShortcut_INSTALL_PATH = /Library/PreferenceBundles
KeyShortcut_FRAMEWORKS = UIKit
KeyShortcut_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/KeyShortcut.plist$(ECHO_END)
