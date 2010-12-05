//
//  BookmarkViewController.h
//  ModalView
//
//  Created by hatakeyama takashi on 10/09/16.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// モーダルビューを閉じる際に呼び出すデリゲートプロトコル
@protocol BookmarkViewDelegate

- (void)dismissModalAndReturnURL:(NSURL *)url;

@end


@interface BookmarkViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>  {
    NSArray *sites;
    NSArray *urls;
    id<BookmarkViewDelegate> delegate;
}

@property (nonatomic, assign) id<BookmarkViewDelegate> delegate;

@end
