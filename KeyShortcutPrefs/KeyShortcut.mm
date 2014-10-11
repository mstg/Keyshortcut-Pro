/* Created by Mustafa Gezen on 06.05.2014 */
#import <Preferences/Preferences.h>

@interface KeyShortcutListController: PSListController
@end

@interface NSDistributedNotificationCenter : NSNotificationCenter
+ (id)notificationCenterForType:(id)arg1;
+ (id)defaultCenter;
- (BOOL)suspended;
- (void)setSuspended:(BOOL)arg1;
- (void)postNotificationName:(id)arg1 object:(id)arg2 userInfo:(id)arg3;
- (void)postNotificationName:(id)arg1 object:(id)arg2;
- (void)postNotification:(id)arg1;
- (void)postNotificationName:(id)arg1 object:(id)arg2 userInfo:(id)arg3 deliverImmediately:(BOOL)arg4;
- (void)postNotificationName:(id)arg1 object:(id)arg2 userInfo:(id)arg3 options:(unsigned int)arg4;
- (void)removeObserver:(id)arg1 name:(id)arg2 object:(id)arg3;
- (id)addObserverForName:(id)arg1 object:(id)arg2 queue:(id)arg3 usingBlock:(id)arg4;
- (id)addObserverForName:(id)arg1 object:(id)arg2 suspensionBehavior:(unsigned int)arg3 queue:(id)arg4 usingBlock:(id)arg5;
- (void)addObserver:(id)arg1 selector:(SEL)arg2 name:(id)arg3 object:(id)arg4;
- (void)addObserver:(id)arg1 selector:(SEL)arg2 name:(id)arg3 object:(id)arg4 suspensionBehavior:(unsigned int)arg5;
- (id)init;
@end

@implementation KeyShortcutListController
    - (id)specifiers {
    	if(_specifiers == nil) {
    		_specifiers = [[self loadSpecifiersFromPlistName:@"KeyShortcut" target:self] retain];
    	}
    	return _specifiers;
    }

    - (void)switchpwnTwitter {
        [self twitter:@"switchpwn"];
    }

    - (void)respring {
        setuid(0);
        system("killall SpringBoard");
    }

    // Thanks insanj
    - (void)twitter:(NSString *)user {
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetbot:///user_profile/" stringByAppendingString:user]]];

        else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitterrific:///profile?screen_name="  stringByAppendingString:user]]];

        else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tweetings:///user?screen_name=" stringByAppendingString:user]]];

        else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]])
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"twitter://user?screen_name=" stringByAppendingString:user]]];

        else
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"https://mobile.twitter.com/" stringByAppendingString:user]]];
    }
@end

// vim:ft=objc
