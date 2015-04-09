//
//  main.m
//  TraceReader
//
//  Created by Bogdan Sala on 18/03/15.
//  Copyright (c) 2015 Bogdan Sala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIARun.h"
#import "ImageExport.h"
#import "Utils.h"

#define templateUDID @"1E2B732A-6DCA-48F6-9272-CF92DECBC024"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc < 2) {
            printf("Please specify the trace file!\n");
            exit(1);
        }
        
        if (argc < 3) {
            printf("Please specify the output file!\n");
            exit(1);
        }
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *workihngDic = [fileManager currentDirectoryPath];
        
        NSString *inputTraceFile = [[NSString stringWithUTF8String:argv[1]] stringByExpandingTildeInPath];
        NSString *outputFile = [[NSString stringWithUTF8String:argv[2]] stringByExpandingTildeInPath];
        NSString *resultZipDirectory = [NSString stringWithFormat:@"%@/instrument_data/%@/run_data", inputTraceFile, templateUDID];
        
        NSError *error;
        NSArray * directoryContents = [fileManager contentsOfDirectoryAtPath:resultZipDirectory error:&error];
        
        if (error) {
            printf("No Activity Manager trace result found!\n");
            exit(1);
        }
        
        for (NSString *zipFile in directoryContents) {
            NSString *unzipedFile = [Utils unzipFile:[NSString stringWithFormat:@"%@/%@", resultZipDirectory, zipFile]];
            if (![unzipedFile isEqualToString:ZIP_FAILED]) {
                NSString *resultUnzippedFile = [NSString stringWithFormat:@"%@/%@", workihngDic, unzipedFile];
                
                // Read the trace file into memory
                NSURL *traceFile = [NSURL fileURLWithPath:[resultUnzippedFile stringByExpandingTildeInPath]];
                NSData *traceData = [NSData dataWithContentsOfURL:traceFile];
                
                // Deserialize the data and dump its content
                UIARun *run = [NSUnarchiver unarchiveObjectWithData:traceData];
                for (NSString *imageKey in run.allScreenshotData) {
                    NSImage *image = [[NSImage alloc] initWithData:run.allScreenshotData[imageKey]];
                    saveImageAtPath(image, [[NSString stringWithFormat:@"%@/%@.png", outputFile, imageKey] stringByExpandingTildeInPath]);
                }
            }
        }
    }
    return 0;
}


