//
//  ImageExport.c
//  TraceReader
//
//  Created by Bogdan Sala on 18/03/15.
//  Copyright (c) 2015 Bogdan Sala. All rights reserved.
//

#include "ImageExport.h"
#import <AppKit/AppKit.h>

BOOL saveImageAtPath(NSImage *image, NSString *path) {
    
    CGImageRef cgRef = [image CGImageForProposedRect:NULL
                                             context:nil
                                               hints:nil];
    NSBitmapImageRep *newRep = [[NSBitmapImageRep alloc] initWithCGImage:cgRef];
    [newRep setSize:[image size]];   // if you want the same resolution
    NSData *pngData = [newRep representationUsingType:NSPNGFileType properties:nil];
    return [pngData writeToFile:path atomically:YES];
}