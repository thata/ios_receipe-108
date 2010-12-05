//
//  OriginalBitmapView.m
//  RetinaDisplay
//
//  Created by 森田秀幸 on 10/08/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OriginalBitmapView.h"
#import "TextRenderingView.h"

@implementation OriginalBitmapView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    TextRenderingView* view = [[[TextRenderingView alloc] initWithFrame:self.bounds] autorelease];
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    if ([systemVersion compare:@"4.0"] == NSOrderedAscending) {
        UIGraphicsBeginImageContext(view.bounds.size);
    } else {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    }
    [view drawRect: self.bounds];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [image drawInRect:rect];
}

- (void)dealloc {
    [super dealloc];
}


@end
