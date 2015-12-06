ARCHS = armv7 arm64 

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = LockHomeButtonToggle
LockHomeButtonToggle_FILES = Switch.xm
LockHomeButtonToggle_FRAMEWORKS = UIKit
LockHomeButtonToggle_LIBRARIES = flipswitch
LockHomeButtonToggle_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk


after-install::
	install.exec "killall -9 SpringBoard"
