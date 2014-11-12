ARCHS = armv7 arm64
TARGET = iphone:latest:6.0

include theos/makefiles/common.mk

TWEAK_NAME = KeyShortcutPro
KeyShortcutPro_FILES = KeyShortcut.xm
KeyShortcutPro_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

THEOS_PACKAGE_BASE_VERSION = 1.7-1
_THEOS_INTERNAL_PACKAGE_VERSION = 1.7-1

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += KeyShortcutPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
