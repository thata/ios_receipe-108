//
//  PlayBGMViewController.h
//  PlayBGM
//
//  Created by 森田秀幸 on 10/08/17.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayBGMViewController : UIViewController {
    AVAudioPlayer *player;
}

- (IBAction)playBGM:(id)sender;

@end

