//
//  GeometryView.m
//  GeometryGraphics
//
//  Created by 森田秀幸 on 10/08/03.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GeometryView.h"


@implementation GeometryView


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)drawLine:(CGContextRef)context {
    // 線の色を設定
    CGContextSetRGBStrokeColor(context, 0.9, 0.2, 0.2, 1.0);
    
    // 線の太さを設定
    CGContextSetLineWidth(context, 5.0);
    
    // パスの指定(始点)
    CGContextMoveToPoint(context, 20.0, 160.0);
    
    // パスの指定(途中の点)
    CGContextAddLineToPoint(context, 160.0, 20.0);
    
    // パスの指定(終点)
    CGContextAddLineToPoint(context, 300.0, 160.0);
    
    // コンテキストの色、太さ、パスの情報をもとに線を描画
    CGContextStrokePath(context);    
}

- (void)drawLineByArray:(CGContextRef)context {
    // 線の色を設定
    CGContextSetRGBStrokeColor(context, 0.2, 0.9, 0.2, 1.0);
    
    // 線の太さを設定
    CGContextSetLineWidth(context, 5.0);
    
    // パスを配列で指定
    CGPoint points[] = {
        CGPointMake( 20.0, 170.0),
        CGPointMake(160.0,  30.0),
        CGPointMake(300.0, 170.0),
    };
    CGContextAddLines(context, points, sizeof(points)/sizeof(points[0]));
    
    // コンテキストの色、太さ、パスの情報をもとに線を描画
    CGContextStrokePath(context);    
}

- (void)drawCircle:(CGContextRef)context {
    // 線の色を設定
    CGContextSetRGBStrokeColor(context, 0.2, 0.2, 0.9, 1.0);
    
    // 線の太さを設定
    CGContextSetLineWidth(context, 5.0);
    
    // 矩形に内接する円をパスとして指定
    CGContextAddEllipseInRect(context, CGRectMake(30, 30, 260, 140));
    
    // コンテキストの色、太さ、パスの情報をもとに線を描画
    CGContextStrokePath(context);    
}

- (void)drawFillCircle:(CGContextRef)context {
    // 塗りつぶす色を設定 (※CGContextSetRGBStrokeColorではないことに注意)
    CGContextSetRGBFillColor(context, 0.9, 0.9, 0.2, 0.8);
    
    // 円を囲む矩形を指定
    CGContextAddEllipseInRect(context, CGRectMake(40, 40, 240, 120));
    
    // コンテキストの色、太さ、パスの情報をもとに塗りつぶした図形を描画
    CGContextFillPath(context);
}

- (void)drawCurve:(CGContextRef)context {
    // 線の色を設定
    CGContextSetRGBStrokeColor(context, 0.2, 0.9, 0.9, 1.0);
    
    // 線の太さを設定
    CGContextSetLineWidth(context, 5.0);
    
    // パスの指定(始点)
    CGContextMoveToPoint(context, 20.0, 20.0);
    
    // パスの指定(方向点を2つと端点を1つ指定)
    CGContextAddCurveToPoint(context, 40.0, 40.0, 260.0, 40.0, 300.0, 20.0);
    
    // パスを閉じる
    CGContextClosePath(context);
    
    // コンテキストの色、太さ、パスの情報をもとに線を描画
    CGContextStrokePath(context);
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawLine:context];
    [self drawLineByArray:context];
    [self drawCircle:context];
    [self drawFillCircle:context];
    [self drawCurve:context];
}

- (void)dealloc {
    [super dealloc];
}


@end
