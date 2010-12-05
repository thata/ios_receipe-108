//
//  ParsingXMLAppDelegate.m
//  ParsingXML
//
//  Created by hatakeyama takashi on 10/09/20.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ParsingXMLAppDelegate.h"

@implementation ParsingXMLAppDelegate

@synthesize window;

- (void)loadTwitterStatus {
    NSString *user = @"htkymtks";
    NSString *s = [NSString stringWithFormat:
                   @"http://api.twitter.com/1/statuses/user_timeline/%@.xml", 
                   user];
    NSURL *url = [NSURL URLWithString:s];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser parse];
    [parser release];
}

// XMLのパース開始
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    // 初期化処理
    statuses = [NSMutableArray array];
    inNameElement = NO;
    inTextElement = NO;
}

// XMLのパース終了
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    // 取得したつぶやきを出力する
    for (NSString *status in statuses) {
        NSLog(@"%@", status);
    }
}

// 要素の開始タグを読み込み
- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName 
    attributes:(NSDictionary *)attributeDict {
    
    if ([elementName isEqualToString:@"name"]) {
        // nameタグの中に入った！
        inNameElement = YES;
        name = [NSMutableString string];
    } else if ([elementName isEqualToString:@"text"]) {
        // textタグの中に入った！
        inTextElement = YES;
        text = [NSMutableString string];
    }
}

// 要素の閉じタグを読み込み
- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"status"]) {
        // statusタグが終わるタイミングで、statusesにつぶやきを追加する
        NSString *s = [NSString stringWithFormat:@"%@: %@", name, text];
        [statuses addObject:s];
    } else if ([elementName isEqualToString:@"name"]) {
        // nameタグから出た！
        inNameElement = NO;
    } else if ([elementName isEqualToString:@"text"]) {
        // textタグから出た！
        inTextElement = NO;
    }
}

// テキストデータ読み込み
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    // テキストデータは複数回に分けて呼び出されることがあるので注意
    if (inNameElement) {
        [name appendString:string];
    } else if (inTextElement) {
        [text appendString:string];
    }
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application 
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    // ツイッターのステータスを読み込む
    [self loadTwitterStatus];
    
    [window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
