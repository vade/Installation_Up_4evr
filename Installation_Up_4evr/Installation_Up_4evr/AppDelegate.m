//
//  AppDelegate.m
//  Installation_Up_4evr
//
//  Created by vade on 1/28/15.
//  Copyright (c) 2015 vade. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    // First Launch we cache the existing user preferences
   
    
    
    // We then write them all to our own prefs under the key "originalPrefs"
    
    // We then warn the user we are going make mass changes
    
    // Then we force all the settings
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (void) someExampleUserDefaultSwizzling
{
    // Global
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // grab a copy of a particular
    NSMutableDictionary *dictionaryPreferences = [[userDefaults persistentDomainForName:@"com.apple.DictionaryServices"] mutableCopy];
  
    NSArray *activeDictionaries = [dictionaryPreferences objectForKey:@"DCSActiveDictionaries"];
    dictionaryPreferences[@"DCSActiveDictionaries"] = @[@"/Library/Dictionaries/Oxford American Writer's Thesaurus.dictionary"];
    [userDefaults setPersistentDomain:dictionaryPreferences forName:@"com.apple.DictionaryServices"];
    {
        NSString *word = @"apple";
        NSString *definition = (__bridge_transfer NSString *)DCSCopyTextDefinition(NULL, (__bridge CFStringRef)word, CFRangeMake(0, [word length]));
        NSLog(@"%@", definition);
    }
    dictionaryPreferences[@"DCSActiveDictionaries"] = activeDictionaries;
    [userDefaults setPersistentDomain:dictionaryPreferences forName:@"com.apple.DictionaryServices"];
}

@end
