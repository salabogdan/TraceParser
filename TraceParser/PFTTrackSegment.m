//
//  PFTTrackSegment.m
//  TraceReader
//
//  Created by Bogdan Sala on 18/03/15.
//  Copyright (c) 2015 Bogdan Sala. All rights reserved.
//

#import "PFTTrackSegment.h"

@implementation PFTTrackSegment

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    [decoder decodeObject];
    [decoder decodeObject];

    self.startTime = [[decoder decodeObject] doubleValue];
    self.endTime   = [[decoder decodeObject] doubleValue];
    
    [decoder decodeObject];

    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
}

@end
