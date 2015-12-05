include theos/makefiles/common.mk

BUNDLE_NAME = LockHomeButtonPrefs
LockHomeButtonPrefs_FILES = LockHomeButtonPrefs.mm
LockHomeButtonPrefs_INSTALL_PATH = /Library/PreferenceBundles
LockHomeButtonPrefs_FRAMEWORKS = UIKit
LockHomeButtonPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/LockHomeButtonPrefs.plist$(ECHO_END)
