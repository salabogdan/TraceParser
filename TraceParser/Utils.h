//
//  ImageExport.h
//  TraceReader
//
//  Created by Bogdan Sala on 18/03/15.
//  Copyright (c) 2015 Bogdan Sala. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ZIP_FAILED @"Unzip Failed"

@interface Utils : NSObject
+ (NSString *)unzipFile:(NSString *)filePath;
@end
