//
//  GeometryView.m
//  GeometryGraphicsByUIKit
//
//  Created by 森田秀幸 on 10/08/16.
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

- (void)drawLine {
    // 線の色を設定
    [[UIColor colorWithRed:0.9 green:0.2 blue:0.2 alpha:1.0] set];
    
    // UIBezierPathオブジェクトを生成
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    // 線の太さを設定
    [path setLineWidth:5.0];
    
    // パスの指定(始点)
    [path moveToPoint:CGPointMake(20.0, 160.0)];
    
    // パスの指定(途中の点)
    [path addLineToPoint:CGPointMake(160.0, 20.0)];
    
    // パスの指定(終点)
    [path addLineToPoint:CGPointMake(300.0, 160.0)];

    // 色、太さ、パスの情報をもとに線を描画
    [path stroke];
}

- (void)drawCircle {
    // 線の色を設定
    [[UIColor colorWithRed:0.2 green:0.2 blue:0.9 alpha:1.0] set];

    // 矩形に内接する円をパスとするUIBezierPathオブジェクトを生成
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 30, 260, 140)];
    
    // 線の太さを設定
    [path setLineWidth:5.0];
    
    // 色、太さ、パスの情報をもとに線を描画
    [path stroke];
}

- (void)drawFillCircle {
    // 塗りつぶす色を設定
    [[UIColor colorWithRed:0.9 green:0.9 blue:0.2 alpha:0.8] set];
    
    // 矩形に内接する円をパスとするUIBezierPathオブジェクトを生成
    UIBezierPath* path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(40, 40, 240, 120)];
    
    // 色、太さ、パスの情報をもとに線を描画
    [path fill];
}

- (void)drawCurve {
    // 線の色を設定
    [[UIColor colorWithRed:0.2 green:0.9 blue:0.9 alpha:1.0] set];
    
    // UIBezierPathオブジェクトを生成
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    // 線の太さを設定
    [path setLineWidth:5.0];
    
    // パスの指定(始点)
    [path moveToPoint:CGPointMake(20.0, 20.0)];

    // パスの指定(方向点を2つと端点を1つ指定)
    [path addCurveToPoint:CGPointMake(300.0, 20.0) 
            controlPoint1:CGPointMake(40.0, 40.0)
            controlPoint2:CGPointMake(260.0, 40.0)];
    
    // パスを閉じる
    [path closePath];

    // 色、太さ、パスの情報をもとに線を描画
    [path stroke];
}

- (void)drawRect:(CGRect)rect {
    [self drawLine];
    [self drawCircle];
    [self drawFillCircle];
    [self drawCurve];
}

- (void)dealloc {
    [super dealloc];
}


@end
