//
//  iPodSampleViewController.m
//  iPodSample
//
//  Created by kzsg on 10/09/01.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "iPodSampleViewController.h"

////
//// このサンプルは、iPodが使用できないiOSシミュレータ上では動作しません.
//// 必ず実機にインストールしてください.
////
@implementation iPodSampleViewController

@synthesize userMediaItemCollection, player;

- (void)dealloc {
	[self cleanUpNotifications];
	self.player = nil;
	self.userMediaItemCollection = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initializeMusicPlayer];
}

// iPodPalyerを準備する
- (void)initializeMusicPlayer {
	self.player = [MPMusicPlayerController applicationMusicPlayer];
	player.repeatMode = MPMusicRepeatModeAll;
	player.shuffleMode = MPMusicShuffleModeOff;
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
	[notificationCenter addObserver:self
						   selector:@selector(handle_NowPlayingItemChanged:)
							   name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
							 object:player];
	[notificationCenter addObserver:self
						   selector:@selector(handle_PlaybackStateChanged:)
							   name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
							 object:player];
	[player beginGeneratingPlaybackNotifications];
	
	// 最初のプレイリストは検索で探す
	MPMediaQuery *myArtistQuery = [[[MPMediaQuery alloc] init] autorelease];
	if ([MPMediaItem canFilterByProperty:MPMediaItemPropertyTitle]) {
		MPMediaPropertyPredicate *titleNamePredicate = 
		[MPMediaPropertyPredicate predicateWithValue: @"My song"
										 forProperty: MPMediaItemPropertyTitle];
		[myArtistQuery addFilterPredicate: titleNamePredicate];
	}
	if ([MPMediaItem canFilterByProperty:MPMediaItemPropertyArtist]) {
		MPMediaPropertyPredicate *artistNamePredicate = 
		[MPMediaPropertyPredicate predicateWithValue: @"Taro Yamada"
										 forProperty: MPMediaItemPropertyArtist];
		[myArtistQuery addFilterPredicate: artistNamePredicate];
	}
	
	NSArray *items = [myArtistQuery items];
	
	if (items && [items count] > 0) {
		for (MPMediaItem *item in items) {
			NSLog(@"title: %@", [item valueForProperty:MPMediaItemPropertyTitle]);
		}
		
		MPMediaItemCollection *collection = [MPMediaItemCollection collectionWithItems:items];
		[player setQueueWithItemCollection:collection];
	}

}

// Notificationの登録を解除する
- (void)cleanUpNotifications {
	[[NSNotificationCenter defaultCenter] 
	 removeObserver:self
	 name:MPMusicPlayerControllerNowPlayingItemDidChangeNotification
	 object:player];
	[[NSNotificationCenter defaultCenter] 
	 removeObserver:self 
	 name:MPMusicPlayerControllerPlaybackStateDidChangeNotification
	 object:player];
	[player endGeneratingPlaybackNotifications];
}

- (IBAction)showMediaPicker {
	MPMediaPickerController *picker = [[[MPMediaPickerController alloc] 
										initWithMediaTypes:MPMediaTypeAnyAudio] 
									   autorelease];
	picker.delegate = self;
	picker.allowsPickingMultipleItems = YES;
	picker.prompt = @"曲を選択してください";
	[self presentModalViewController:picker animated:YES];
}

- (void)mediaPicker: (MPMediaPickerController *)mediaPicker 
  didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
	[self dismissModalViewControllerAnimated:YES];
	
	
	for (MPMediaItem *item in mediaItemCollection.items) {
		NSLog(@"title: %@", [item valueForProperty:MPMediaItemPropertyTitle]);
	}
	
	if (!mediaItemCollection) {
		NSLog(@"selectedItems is empty.");
		return;
	}
	
	if (userMediaItemCollection == nil) {
		self.userMediaItemCollection = mediaItemCollection;
		[player setQueueWithItemCollection:userMediaItemCollection];
		[player play];
	} else {
		NSMutableArray *combinedMediaItems = [userMediaItemCollection.items mutableCopy];
		NSArray *newItems = mediaItemCollection.items;
		[combinedMediaItems addObjectsFromArray:newItems];
		self.userMediaItemCollection = [MPMediaItemCollection collectionWithItems:combinedMediaItems];
		[player setQueueWithItemCollection:userMediaItemCollection];
		NSLog(@"add collection. count");
	}
}

/** Notification **/

- (void)handle_NowPlayingItemChanged:(id)notification {
	NSString *title = [player.nowPlayingItem valueForProperty:MPMediaItemPropertyTitle];
	NSLog(@"再生中の曲は %@ です。", title);
	itemNameField.text = title;
}

- (void)handle_PlaybackStateChanged:(id)notification {
	NSLog(@"現在 %f 秒のところを再生しています。", player.currentPlaybackTime);
}

/** IBAction **/

- (IBAction)pause {
	[player pause];
}

- (IBAction)stop {
	[player stop];

}

- (IBAction)play {	
	[player play];
}

- (IBAction)skipToNextItem {
	[player skipToNextItem];
}

- (IBAction)skipToPreviousItem {
	[player skipToPreviousItem];
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}




@end
