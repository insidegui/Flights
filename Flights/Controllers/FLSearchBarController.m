//
//  FLSearchBarController.m
//  Flights
//
//  Created by Guilherme Rambo on 25/03/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

#import "FLSearchBarController.h"

@interface FLSearchBarController ()
@property (weak) IBOutlet NSSearchField *searchField;

@end

@implementation FLSearchBarController

- (instancetype)init
{
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (void)viewDidAppear
{
    [super viewDidAppear];
    
    [self.view.window makeFirstResponder:self.searchField];
}

- (IBAction)searchFieldAction:(id)sender {
    if (self.searchField.stringValue.length < 4) return;
    
    NSString *airlineCode = [self.searchField.stringValue substringWithRange:NSMakeRange(0, 2)];
    NSString *flightCode = [self.searchField.stringValue substringWithRange:NSMakeRange(2, self.searchField.stringValue.length - 2)];
    NSUInteger flightCodeNumber = (NSUInteger)[flightCode integerValue];
    
    if (flightCodeNumber <= 0) return;
    
    self.callback(airlineCode, flightCodeNumber);
}

@end
