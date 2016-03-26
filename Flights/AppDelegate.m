//
//  AppDelegate.m
//  Flights
//
//  Created by Guilherme Rambo on 25/03/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

#import "AppDelegate.h"

#import "FLMainWindowController.h"

@interface AppDelegate ()

@property (strong) FLMainWindowController *mainWC;


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self showMainWindowController];
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    [self showMainWindowController];
    
    return YES;
}

- (void)showMainWindowController {
    if (!self.mainWC) self.mainWC = [[FLMainWindowController alloc] init];
    
    [self.mainWC showWindow:self];
}

@end
