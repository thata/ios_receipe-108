//
//  ParsingXMLAppDelegate.h
//  ParsingXML
//
//  Created by hatakeyama takashi on 10/09/20.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParsingXMLAppDelegate : NSObject <UIApplicationDelegate, NSXMLParserDelegate> {
    UIWindow *window;
    
    // XMLのパースに用いるフィールド群
    NSMutableArray *statuses;
    BOOL inNameElement;
    BOOL inTextElement;
    NSMutableString *name;
    NSMutableString *text;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

