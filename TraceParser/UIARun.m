//
//  UIARun.m
//  TraceReader
//
//  Created by Bogdan Sala on 18/03/15.
//  Copyright (c) 2015 Bogdan Sala. All rights reserved.
//

#import "UIARun.h"
#import "XRTrackSegment.h"

@interface UIARun ()

@property (nonatomic, assign) CGFloat float1;
@property (nonatomic, assign) CGFloat float2;
@property (nonatomic, assign) NSInteger integer1;
@property (nonatomic, strong) NSMutableArray *trackSegments;
@property (nonatomic, strong) NSMutableDictionary *dictionary1;
@property (nonatomic, assign) NSInteger integer2;
@property (nonatomic, assign) NSInteger integer3;
@property (nonatomic, strong) NSMutableDictionary *dictionary2;
@property (nonatomic, assign) NSInteger integer4;
@property (nonatomic, strong) NSObject *object1;
@property (nonatomic, strong) NSMutableDictionary *dictionary3;
@property (nonatomic, strong) NSObject *object2;
@property (nonatomic, strong) NSObject *object3;
@property (nonatomic, strong) NSMutableDictionary *screenshotDictionary;

@end

@implementation UIARun

- (id)initWithCoder:(NSCoder *)decoder {
//    self = [super init];
    if (!self) {
        return nil;
    }
    self.float1 = [[decoder decodeObject] doubleValue];
    self.float2 = [[decoder decodeObject] doubleValue];
    self.integer1 = [[decoder decodeObject] integerValue];
    self.trackSegments = [decoder decodeObject];
    self.dictionary1 = [decoder decodeObject];
    self.integer2 = [[decoder decodeObject] integerValue];
    self.integer3 = [[decoder decodeObject] integerValue];
    self.dictionary2 = [decoder decodeObject];
    self.integer4 = [[decoder decodeObject] integerValue];
    self.object1 = [decoder decodeObject];
    self.dictionary3 = [decoder decodeObject];
    self.object2 = [decoder decodeObject];
    self.object3 = [decoder decodeObject];
    self.screenshotDictionary = [decoder decodeObject];
    //here we have the images
    self.allScreenshotData = [self.screenshotDictionary allValues];
    
    return self;
}

@end
