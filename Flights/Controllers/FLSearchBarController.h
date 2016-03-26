//
//  FLSearchBarController.h
//  Flights
//
//  Created by Guilherme Rambo on 25/03/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FLSearchBarController : NSViewController

@property (nonatomic, copy) void (^callback)(NSString *airlineCode, NSUInteger flightCode);

@end
