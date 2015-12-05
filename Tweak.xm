static BOOL suppress = YES;

%hook SpringBoard
-(void)_menuButtonWasHeld {
	if(suppress)
		return ;
	else %orig;
}
%end

static void PreferencesCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	CFPreferencesAppSynchronize(CFSTR("com.iamjamieq.lockhomebutton"));
	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/private/var/mobile/Library/Preferences/com.iamjamieq.lockhomebutton.plist"];
	suppress = !([prefs objectForKey:@"suppress"] ? [[prefs objectForKey:@"suppress"] boolValue] : YES);
}

%ctor
{
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, PreferencesCallback, CFSTR("com.iamjamieq.lockhomebutton.preferencechanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	%init();
}
