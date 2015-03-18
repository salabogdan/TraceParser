//
//  PFTTrackSegment.h
//  TraceReader
//
//  Created by Bogdan Sala on 18/03/15.
//  Copyright (c) 2015 Bogdan Sala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PFTTrackSegment : NSObject <NSCoding>

@property (nonatomic,assign) double startTime;
@property (nonatomic,assign) double endTime;

@end
