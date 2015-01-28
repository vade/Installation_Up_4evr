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
    
    // grab a copy of a particular domain - dictionary for example because thats the last example I saw
    NSMutableDictionary *dictionaryPreferences = [[userDefaults persistentDomainForName:@"com.apple.DictionaryServices"] mutableCopy];
  
    // read a value from the prefs
    NSArray *cachedPrefsValue = [dictionaryPreferences objectForKey:@"DCSActiveDictionaries"];
    
    // force a new value
    dictionaryPreferences[@"DCSActiveDictionaries"] = @[@"/Library/Dictionaries/Oxford American Writer's Thesaurus.dictionary"];
    [userDefaults setPersistentDomain:dictionaryPreferences forName:@"com.apple.DictionaryServices"];

    
    // reset the old value
    dictionaryPreferences[@"DCSActiveDictionaries"] = cachedPrefsValue;
    [userDefaults setPersistentDomain:dictionaryPreferences forName:@"com.apple.DictionaryServices"];
}

@end
