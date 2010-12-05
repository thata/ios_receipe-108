//
//  PropertyViewController.h
//  Property
//
//  Created by 森田秀幸 on 10/08/12.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyViewController : UIViewController {
    // インスタンス変数nameを宣言
    UILabel* nameLabel;
}

// インスタンス変数nameがプロパティであることを宣言
@property(retain, nonatomic) UILabel* name;

@end

