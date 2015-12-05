#import <Preferences/Preferences.h>

@interface LockHomeButtonPrefsListController: PSListController {
}
@end

@implementation LockHomeButtonPrefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"LockHomeButtonPrefs" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
