static BOOL suppress = YES;

%hook SpringBoard
-(void)_handleMenuButtonEvent {
	if(suppress)
		return ;
	else %orig;
}

-(void)_menuButtonWasHeld {
	if(suppress)
		return ;
	else %orig;
}

-(void)handleMenuDoubleTap {
	if(suppress)
		return ;
	else %orig;
}
%end

%hook SBControlCenterController 
-(id)init {
	if(suppress)
		nil;
	return %orig;
}
%end

%hook SBNotificationCenterController 
-(id)init {
	if(suppress)
		nil;
	return %orig;
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
