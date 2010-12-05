//
//  RestfulRequestAppDelegate.m
//  RestfulRequest
//
//  Created by hatakeyama takashi on 10/09/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RestfulRequestAppDelegate.h"

@implementation RestfulRequestAppDelegate

@synthesize window;

- (void)sendPost {
    /* POST /users.xml */
    
    // URLを生成
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/users.xml"];
    // リクエストを生成
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 「Content-Type」に「application/xml」をセット
    [request setValue:@"application/xml"forHTTPHeaderField:@"Content-Type"];
    // HTTPメソッドをセット
    [request setHTTPMethod:@"POST"];	
    // 送信するデータをセット
    NSString *content = @"<user><name>POSTさん</name><age>20</age></user>";
    [request setHTTPBody:[content dataUsingEncoding:NSUTF8StringEncoding]];

    // リクエストを送信
    NSHTTPURLResponse *response;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request 
                                         returningResponse:&response 
                                                     error:&error];
    if (!error) {
        // 取得したNSDataをNSStringに変換して出力
        NSString *s = [[[NSString alloc] 
                        initWithData:data 
                        encoding:NSUTF8StringEncoding] autorelease];
        NSLog(@"data: %@", s);
        NSLog(@"status code: %d", [response statusCode]);
    } else {
        NSLog(@"error: %@", error);
    }
}

- (void)sendGet {
    /* GET /users/1.xml */
    
    // URLを生成
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/users/1.xml"];
    // リクエストを生成
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // HTTPメソッドをセット
    [request setHTTPMethod:@"GET"];	
    // リクエストを送信
    NSHTTPURLResponse *response;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request 
                                         returningResponse:&response 
                                                     error:&error];
    if (!error) {
        // 取得したNSDataをNSStringに変換して出力
        NSString *s = [[[NSString alloc] 
                        initWithData:data 
                        encoding:NSUTF8StringEncoding] autorelease];
        NSLog(@"data: %@", s);
        NSLog(@"status code: %d", [response statusCode]);
    } else {
        NSLog(@"error: %@", error);
    }
}

- (void)sendGetList {
    /* GET /users.xml */
    
    // URLを生成
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/users.xml"];
    // リクエストを生成
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // HTTPメソッドをセット
    [request setHTTPMethod:@"GET"];	
    // リクエストを送信
    NSHTTPURLResponse *response;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request 
                                         returningResponse:&response 
                                                     error:&error];
    if (!error) {
        // 取得したNSDataをNSStringに変換して出力
        NSString *s = [[[NSString alloc] 
                        initWithData:data 
                        encoding:NSUTF8StringEncoding] autorelease];
        NSLog(@"data: %@", s);
        NSLog(@"status code: %d", [response statusCode]);
    } else {
        NSLog(@"error: %@", error);
    }
}

- (void)sendPut {
    /* PUT /users/1.xml */
    
    // URLを生成
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/users/1.xml"];
    // リクエストを生成
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 「Content-Type」に「application/xml」をセット
    [request setValue:@"application/xml"forHTTPHeaderField:@"Content-Type"];
    // HTTPメソッドをセット
    [request setHTTPMethod:@"PUT"];	
    // 送信するデータをセット
    NSString *content = @"<user><name>PUTさん</name><age>30</age></user>";
    [request setHTTPBody:[content dataUsingEncoding:NSUTF8StringEncoding]];
    // リクエストを送信
    NSHTTPURLResponse *response;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request 
                                         returningResponse:&response 
                                                     error:&error];
    if (!error) {
        NSString *s = [[[NSString alloc] 
                        initWithData:data 
                        encoding:NSUTF8StringEncoding] autorelease];
        NSLog(@"data: %@", s);
        NSLog(@"status code: %d", [response statusCode]);
    } else {
        NSLog(@"error: %@", error);
    }
}

- (void)sendDelete {
    /* DELETE /users/1.xml */
    
    // URLを生成
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/users/1.xml"];
    // リクエストを生成
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // HTTPメソッドをセット
    [request setHTTPMethod:@"DELETE"];
    // リクエストを送信
    NSHTTPURLResponse *response;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request 
                                         returningResponse:&response 
                                                     error:&error];
    if (!error) {
        NSString *s = [[[NSString alloc] 
                        initWithData:data 
                        encoding:NSUTF8StringEncoding] autorelease];
        NSLog(@"data: %@", s);
        NSLog(@"status code: %d", [response statusCode]);
    } else {
        NSLog(@"error: %@", error);
    }    
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self sendPost];
    [self sendGet];
    [self sendGetList];
    [self sendPut];
    [self sendDelete];
    
    // Override point for customization after application launch.
	
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
