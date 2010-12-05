//
//  TextRenderingView.m
//  RetinaDisplay
//
//  Created by 森田秀幸 on 10/08/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TextRenderingView.h"


@implementation TextRenderingView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [[UIColor redColor] set];
    UIFont *font = [UIFont systemFontOfSize:30]; 
    [@"Retina Display対応" drawAtPoint:CGPointMake(5, 5) withFont:font]; 
}

- (void)dealloc {
    [super dealloc];
}


@end
