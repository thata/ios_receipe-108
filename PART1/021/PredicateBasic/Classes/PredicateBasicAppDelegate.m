//
//  PredicateBasicAppDelegate.m
//  PredicateBasic
//
//  Created by hatakeyama takashi on 10/09/23.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PredicateBasicAppDelegate.h"

@implementation User

@synthesize name;
@synthesize age;

- (id)initWithName:(NSString *)newName age:(NSInteger)newAge {
    self = [super init];
    if (self) {
        self.name = newName;
        self.age = newAge;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<User: { name: %@, age: %d }>", 
            self.name, 
            self.age];
}

@end

@implementation PredicateBasicAppDelegate

@synthesize window;

- (void)predicateBasic {
    // テストの点数
    NSArray *scores = [NSArray arrayWithObjects:
                       [NSNumber numberWithInt:73],
                       [NSNumber numberWithInt:26],
                       [NSNumber numberWithInt:55],
                       [NSNumber numberWithInt:38],
                       [NSNumber numberWithInt:100],
                       [NSNumber numberWithInt:81], nil];

    NSArray *result;

    // 40点未満のものを抜き出す
    NSPredicate *lessThan40 = [NSPredicate predicateWithFormat:@"SELF < 40"];
    result = [scores filteredArrayUsingPredicate:lessThan40];
    NSLog(@"%@", result); //=> (26, 38)

    // 100点のものを抜き出す
    NSPredicate *equalTo100 = [NSPredicate predicateWithFormat:@"SELF = 100"];
    result = [scores filteredArrayUsingPredicate:equalTo100];
    NSLog(@"%@", result); //=> (100)

    // 100点ではないものを抜き出す
    NSPredicate *notEqualTo100 = [NSPredicate predicateWithFormat:@"NOT SELF = 100"];
    result = [scores filteredArrayUsingPredicate:notEqualTo100];
    NSLog(@"%@", result); //=> (73, 26, 55, 38, 81)

    // 40点以上かつ80点未満のものを抜き出す(AND)
    NSPredicate *gte40AndLt80 = 
    [NSPredicate predicateWithFormat:@"SELF >= 40 AND SELF < 80"];
    result = [scores filteredArrayUsingPredicate:gte40AndLt80];
    NSLog(@"%@", result); //=> (73, 55)

    // 40点未満または80点以上のものを抜き出す(OR)
    NSPredicate *lt40OrGte80 = 
    [NSPredicate predicateWithFormat:@"SELF < 40 OR SELF >= 80"];
    result = [scores filteredArrayUsingPredicate:lt40OrGte80];
    NSLog(@"%@", result); //=> (26, 38, 81, 100)
}

- (void)predicateWithKeyValueCoding {
    NSMutableArray *users = [NSMutableArray array];
    [users addObject:[[User alloc] initWithName:@"篠田" age:24]];
    [users addObject:[[User alloc] initWithName:@"前田" age:19]];
    [users addObject:[[User alloc] initWithName:@"大島" age:21]];

    NSArray *result;

    // 20歳以上のユーザを取得する
    NSPredicate *greaterThan20 = [NSPredicate predicateWithFormat:@"age >= 20"];
    result = [users filteredArrayUsingPredicate:greaterThan20];
    NSLog(@"%@", [result objectAtIndex:0]); //=> 篠田
    NSLog(@"%@", [result objectAtIndex:1]); //=> 大島
    
    // 名前に「田」が含まれるユーザを取得する
    NSPredicate *nameContainsDa = [NSPredicate predicateWithFormat:
                                   @"name CONTAINS '田'"];
    result = [users filteredArrayUsingPredicate:nameContainsDa];
    NSLog(@"%@", [result objectAtIndex:0]); //=> 篠田
    NSLog(@"%@", [result objectAtIndex:1]); //=> 前田
}

- (void)predicateWithIn {
    /* 複数の指定値のいずれかにマッチする要素のみを抜き出したい(IN) */
    NSMutableArray *users;
    users = [NSMutableArray array];
    [users addObject:[[[User alloc] initWithName:@"大泉" age:25] autorelease]];
    [users addObject:[[[User alloc] initWithName:@"藤村" age:30] autorelease]];
    [users addObject:[[[User alloc] initWithName:@"鈴井" age:40] autorelease]];
    [users addObject:[[[User alloc] initWithName:@"嬉野" age:42] autorelease]];

    NSPredicate *yakudoshiPredicate1 = [NSPredicate predicateWithFormat:
                                        @"age IN { 25, 42, 61 }"];
    NSArray *result;
    result = [users filteredArrayUsingPredicate:yakudoshiPredicate1];
    NSLog(@"%@", [result objectAtIndex:0]); //=> 大泉
    NSLog(@"%@", [result objectAtIndex:1]); //=> 嬉野

    // INの対象を配列で渡すこともできます
    NSArray *yakudoshi = [NSArray arrayWithObjects:
                          [NSNumber numberWithInt:25],
                          [NSNumber numberWithInt:42],
                          [NSNumber numberWithInt:61],
                          nil];
    NSPredicate *yakudoshiPredicate2 = [NSPredicate predicateWithFormat:
                                        @"age IN %@", yakudoshi];
    result = [users filteredArrayUsingPredicate:yakudoshiPredicate2];
    NSLog(@"%@", [result objectAtIndex:0]); //=> 大泉
    NSLog(@"%@", [result objectAtIndex:1]); //=> 嬉野
}

- (void)predicateWithBetween {
    /* ある範囲内に値が含まれる要素のみを抜き出したい(BETWEEN) */
    NSArray *scores = [NSArray arrayWithObjects:
                       [NSNumber numberWithInt:73],
                       [NSNumber numberWithInt:26],
                       [NSNumber numberWithInt:55],
                       [NSNumber numberWithInt:38],
                       [NSNumber numberWithInt:100],
                       [NSNumber numberWithInt:81], nil];	
    
    NSArray *result;

    // 40点から80点までのものを抜き出す
    NSPredicate *between40And80 = [NSPredicate predicateWithFormat:
                                   @"SELF  BETWEEN {40, 80}"];
    result = [scores filteredArrayUsingPredicate:between40And80];
    NSLog(@"%@", result); //=> (55, 73)

    // 80点から100点までのものを抜き出す
    // BETWEENの対象を配列で渡すこともできます
    NSNumber *eighty = [NSNumber numberWithInt:80];
    NSNumber *oneHundred = [NSNumber numberWithInt:100];
    NSPredicate *between80And100 = [NSPredicate predicateWithFormat:
                                    @"SELF BETWEEN %@",
                                    [NSArray arrayWithObjects:
                                     eighty, 
                                     oneHundred,
                                     nil]];
    result = [scores filteredArrayUsingPredicate:between80And100];
    NSLog(@"%@", result); //=> (81, 100)
}

- (void)predicateWithNil {
    NSMutableDictionary *bank;
    NSMutableArray *banks = [NSMutableArray array];

    // 銀行コードが1
    bank = [NSMutableDictionary dictionary];
    [bank setObject:@"みずほ銀行" forKey:@"name"];
    [bank setObject:[NSNumber numberWithInt:1] forKey:@"code"];
    [banks addObject:bank];

    // 銀行コードが5
    bank = [NSMutableDictionary dictionary];
    [bank setObject:@"東京三菱UFJ銀行" forKey:@"name"];
    [bank setObject:[NSNumber numberWithInt:5] forKey:@"code"];
    [banks addObject:bank];

    // 銀行コードがnull
    bank = [NSMutableDictionary dictionary];
    [bank setObject:@"こども銀行" forKey:@"name"];
    [bank setObject:[NSNull null] forKey:@"code"];
    [banks addObject:bank];

    NSPredicate *pred;
    NSArray *result;

    // コードがnullの銀行を取り出す
    pred = [NSPredicate predicateWithFormat:@"code = null"];
    result = [banks filteredArrayUsingPredicate:pred];
    NSLog(@"%@", result); //=> (こども銀行)

    // コードがnullでない銀行を取り出す
    pred = [NSPredicate predicateWithFormat:@"code != null"];
    result = [banks filteredArrayUsingPredicate:pred];
    NSLog(@"%@", result); //=> (みずほ銀行, 東京三菱UFJ銀行)
}

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    [self predicateBasic];
    [self predicateWithKeyValueCoding];
    [self predicateWithIn];
    [self predicateWithBetween];
    [self predicateWithNil];
    
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
