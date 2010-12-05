//
//  RootViewController.h
//  GetWebContents
//
//  Created by hatakeyama takashi on 10/09/20.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController {
    // 受信したデータを格納する
    NSMutableData *receivedData;
    // 受信したデータの文字コードを格納する
    NSStringEncoding receivedDataEncoding;    
}

@end
