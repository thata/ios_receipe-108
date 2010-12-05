//
//  AutoreleasePoolAppDelegate.m
//  AutoreleasePool
//
//  Created by 森田秀幸 on 10/07/07.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AutoreleasePoolAppDelegate.h"
#import "AutoreleasePoolViewController.h"

@implementation AutoreleasePoolAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    for (NSInteger i = 0; i < 100; i++) {
        //autoreleaseプールを生成する
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        //大きい文字列を生成しautoreleaseする
        NSMutableString *bigString = [[[NSMutableString alloc] init] autorelease];
        for (NSInteger i = 0; i < 100000; i++) {
            [bigString appendString:@"abcdefghijklmnopqrstuvwxyz"];
        }
        
        //その大きい文字列をここで利用
        //...
        
        //ここでautoreleaseした大きい文字列が解放される
        [pool release];
    }
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
