//
//  FLMainWindowController.m
//  Flights
//
//  Created by Guilherme Rambo on 25/03/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

#import "FLMainWindowController.h"

#import "FlightUtilities.h"
#import "FLSearchBarController.h"

@interface FLMainWindowController ()

@property (strong) FUFlightViewController *flightVC;
@property (strong) FLSearchBarController *searchVC;

@property (weak) IBOutlet NSVisualEffectView *backgroundView;
@property (weak) IBOutlet NSView *containerView;

@property (weak) IBOutlet NSImageView *emptyImageView;

@end

@implementation FLMainWindowController

- (instancetype)init
{
    self = [super initWithWindowNibName:NSStringFromClass([self class])];
    
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.window.movableByWindowBackground = YES;
    
    self.window.titlebarAppearsTransparent = YES;
    self.window.titleVisibility = NSWindowTitleHidden;
    
    self.searchVC = [[FLSearchBarController alloc] init];
    [self.searchVC.view setFrameOrigin:NSMakePoint(0, NSHeight(self.window.contentView.bounds) - NSHeight(self.searchVC.view.bounds) - 22.0)];
    [self.backgroundView addSubview:self.searchVC.view];
    
    __weak typeof(self) weakSelf = self;
    [self.searchVC setCallback:^(NSString *airline, NSUInteger flight) {
        [weakSelf findFlightWithCode:flight airlineCode:airline];
    }];
}

- (void)findFlightWithCode:(NSUInteger)code airlineCode:(NSString *)airlineCode
{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        self.emptyImageView.animator.alphaValue = 0.0;
        self.flightVC.view.animator.alphaValue = 0.0;
    } completionHandler:^{
        if (self.flightVC) {
            [self.flightVC.view removeFromSuperview];
            self.flightVC = nil;
        }
        
        self.flightVC = [[FUFlightViewController alloc] initWithFlightCode:code airlineCode:airlineCode];
        [self.containerView addSubview:self.flightVC.view];
    }];
}

@end
