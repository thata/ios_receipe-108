//
//  MoviePlayerSampleViewController.m
//  MoviePlayerSample
//
//  Created by kzsg on 10/09/28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MoviePlayerSampleViewController.h"

@implementation MoviePlayerSampleViewController


// ローカルにある動画を再生する
- (IBAction)playLocalMovie {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"mov"];
	NSURL *url = [NSURL fileURLWithPath:path];
	MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:url];
	[player.view setFrame: [self.view bounds]];
	// 動画再生のビューサイズを任意のものにすることができる
	//[player.view setFrame: CGRectMake(70, 100, 200, 300)];
	player.view.backgroundColor = [UIColor clearColor];
	[self.view addSubview:player.view];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStateChange:) name:MPMoviePlayerLoadStateDidChangeNotification object:player];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishPlayback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerDidExitFullscreenNotification object:player];
	[player play];
}

// インターネット上にある動画をストリーミング再生する
- (IBAction)startStreaming {
	NSURL *url = [NSURL URLWithString:@"http://movies.apple.com/movies/jp/movies/fox/avatar/avatar_trailer_480x231.mov"];
	MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:url];
	[player.view setFrame: [self.view bounds]];
	player.view.backgroundColor = [UIColor clearColor]; 
	[self.view  addSubview:player.view];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadStateChange:) name:MPMoviePlayerLoadStateDidChangeNotification object:player];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(finishPlayback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerDidExitFullscreenNotification object:player];
}

- (void)movieFinishedCallback:(NSNotification*) aNotification {
	MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerDidExitFullscreenNotification object:player];    
    [player stop];
}

- (void)finishPlayback:(NSNotification *) aNotification {
	MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
													name:MPMoviePlayerPlaybackDidFinishNotification object:player];
    [player stop];
}

- (void)loadStateChange:(NSNotification *) aNotification {
	MPMoviePlayerController *player = [aNotification object];
	MPMovieLoadState state = player.loadState;	
	if( state & MPMovieLoadStateUnknown ) {
		NSLog(@"不明な状態.");
	}
	if( state & MPMovieLoadStatePlayable ) {
		NSLog(@"再生可能.");
		[player play];
	} 
	if( state & MPMovieLoadStatePlaythroughOK ) {
		NSLog(@"最後まで途切れることなく再生可能.");
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	} 
	if( state & MPMovieLoadStateStalled ) {
		NSLog(@"読み込みが進まない...");
	} 
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)dealloc {
    [super dealloc];
}

@end
