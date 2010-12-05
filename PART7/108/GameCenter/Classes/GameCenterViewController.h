//
//  GameCenterViewController.h
//  GameCenter
//
//  Created by 森田秀幸 on 10/09/24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameCenterViewController : UIViewController <GKMatchmakerViewControllerDelegate, GKMatchDelegate> {
    NSInteger localAttackValue;
    NSInteger remoteAttackValue;

    GKMatch *match;
    
    IBOutlet UITextField *localAttack;
    IBOutlet UITextField *remoteAttack;
    IBOutlet UITextField *result;
}

@property(retain) GKMatch *match;

- (IBAction)startMatching:(id)sender;
- (IBAction)attack:(id)sender;


@end

