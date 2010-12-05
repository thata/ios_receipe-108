//
//  RootViewController.m
//  GetWebContents
//
//  Created by hatakeyama takashi on 10/09/20.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

#pragma mark 同期通信

- (void)sendSynchronousRequest {
    NSLog(@"*** sendSynchronousRequest ***");
    
    // リクエスト生成
    NSURL *url = [NSURL URLWithString:@"http://example.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // リクエスト送信
    NSError *error;
    NSHTTPURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    
    if (data == nil) {
        // データの取得に失敗した場合はエラー情報を表示する
        NSLog(@"error: %@", error);
    } else {
        // 取得したデータをUT-F8文字列へと変換
        NSString *result;
        result = [[NSString alloc] initWithData:data
                                       encoding:NSUTF8StringEncoding];
        NSLog(@"result: %@", result);
        [result release];
    }
}

#pragma mark 非同期通信

- (void)sendAsynchronousRequest {
    NSLog(@"*** sendAsynchronousRequest ***");
    
    // リクエストを生成
    NSURL *url = [NSURL URLWithString:@"http://example.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // リクエストの送信
    [NSURLConnection connectionWithRequest:request delegate:self];
}

// サーバからレスポンスヘッダを受け取ると呼び出される
- (void)connection:(NSURLConnection *)connection 
didReceiveResponse:(NSURLResponse *)response {
    
    // 受信したデータを格納するNSMutableDataを初期化
    receivedData = [[NSMutableData alloc] init];
    
    // 送信されるデータの文字コードを取得
    NSString *encodingName = [response textEncodingName];
    NSLog(@"受信文字コード: %@", encodingName);
    if ([encodingName isEqualToString: @"euc-jp"]) {
        receivedDataEncoding = NSJapaneseEUCStringEncoding;
    } else {
        receivedDataEncoding = NSUTF8StringEncoding;
    }    
}

// サーバからデータを受け取るたびに呼び出される
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // 取得したデータをreceivedDataへ格納する
    NSLog(@"受信データ（バイト数）: %d", [data length]);
    [receivedData appendData:data];
}

// データの取得が終了したときに呼び出される
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *result = [[[NSString alloc] 
                         initWithData:receivedData 
                         encoding:receivedDataEncoding] autorelease];
    NSLog(@"データの受信完了: %@", result);
    
    // 通信が終了したのでNSMutableDataをリリースする
    [receivedData release];
}

#pragma mark ViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    // 同期通信を行う
    [self sendSynchronousRequest];
    // 非同期通信を行う
    [self sendAsynchronousRequest];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
