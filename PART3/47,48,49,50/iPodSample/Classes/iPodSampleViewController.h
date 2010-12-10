//
//  iPodSampleViewController.h
//  iPodSample
//
//  Created by kzsg on 10/09/01.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface iPodSampleViewController : UIViewController <MPMediaPickerControllerDelegate>{
	MPMusicPlayerController* player;
	MPMediaItemCollection* userMediaItemCollection;
	IBOutlet UITextField *itemNameField;
}

@property(nonatomic, retain)MPMusicPlayerController* player;
@property(nonatomic, retain)MPMediaItemCollection* userMediaItemCollection;

- (IBAction)showMediaPicker; 
- (IBAction)pause;
- (IBAction)stop;
- (IBAction)play;
- (IBAction)skipToNextItem;
- (IBAction)skipToPreviousItem;
- (void)initializeMusicPlayer;
- (void)cleanUpNotifications;
@end

