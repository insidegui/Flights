//
//  FlightUtilities.h
//  Flights
//
//  Created by Guilherme Rambo on 25/03/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

@import Cocoa;

@interface FUFlightViewController : NSViewController

- (instancetype)initWithFlightCode:(NSUInteger)flightCode airlineCode:(NSString *)airlineCode;

@end