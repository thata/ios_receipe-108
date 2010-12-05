//
//  VectorRenderingView.m
//  RetinaDisplay
//
//  Created by 森田秀幸 on 10/08/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "VectorRenderingView.h"


@implementation VectorRenderingView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [[UIColor redColor] set]; 

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path    moveToPoint:CGPointMake(  5,  5)];
    [path addLineToPoint:CGPointMake(275,  5)];
    [path addLineToPoint:CGPointMake(275, 75)];
    [path addLineToPoint:CGPointMake(  5, 75)];
    [path closePath];
    [path fill];
}

- (void)dealloc {
    [super dealloc];
}


@end
