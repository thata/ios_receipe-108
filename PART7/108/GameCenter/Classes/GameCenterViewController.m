//
//  GameCenterViewController.m
//  GameCenter
//
//  Created by 森田秀幸 on 10/09/24.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameCenterViewController.h"

@implementation GameCenterViewController

@synthesize match;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GKLocalPlayer localPlayer] authenticateWithCompletionHandler:^(NSError *error) {
        if (error == nil) {
            // 認証成功時の処理
        } else {
            // 認証失敗時の処理
        }
    }];
    
    [GKMatchmaker sharedMatchmaker].inviteHandler = ^(GKInvite *acceptedInvite, NSArray *playersToInvite) {
        if (acceptedInvite) {
            GKMatchmakerViewController *matchMaker = [[[GKMatchmakerViewController alloc] initWithInvite:acceptedInvite] autorelease];
            matchMaker.matchmakerDelegate = self;
            [self presentModalViewController:matchMaker animated:YES];
        }
    };    
    
}

- (IBAction)startMatching:(id)sender {
    GKMatchRequest *request = [[[GKMatchRequest alloc] init] autorelease];
    request.minPlayers = 2;
    request.maxPlayers = 2;
    
    GKMatchmakerViewController *matchMaker = [[[GKMatchmakerViewController alloc] initWithMatchRequest:request] autorelease];
    matchMaker.matchmakerDelegate = self;
    
    [self presentModalViewController:matchMaker animated:YES];
}

- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFindMatch:(GKMatch *)aMatch {
    // GKMatchmakerViewControllerを閉じる
    [self dismissModalViewControllerAnimated:YES];
    self.match = aMatch;
    self.match.delegate = self;
}

// GKMatchmakerViewControllerでマッチングに失敗した場合
- (void)matchmakerViewController:(GKMatchmakerViewController *)viewController didFailWithError:(NSError *)error {
    // GKMatchmakerViewControllerを閉じる
    [self dismissModalViewControllerAnimated:YES];
}

// GKMatchmakerViewControllerでキャンセルされた場合
- (void)matchmakerViewControllerWasCancelled:(GKMatchmakerViewController *)viewController {
    // GKMatchmakerViewControllerを閉じる
    [self dismissModalViewControllerAnimated:YES];
}

- (void)battleCheck {
    if (localAttackValue > 0) {
        localAttack.text = [NSString stringWithFormat:@"%d", localAttackValue];
    }
    
    if (remoteAttackValue > 0) {
        remoteAttack.text = [NSString stringWithFormat:@"%d", remoteAttackValue];
    }
    
    if (localAttackValue > 0 && remoteAttackValue > 0) {
        if (localAttackValue == remoteAttackValue) {
            result.text = @"引き分けです";
        } else if (localAttackValue > remoteAttackValue) {
            result.text = @"あなたの勝ちです";
        } else {
            result.text = @"あなたの負けです";
        }
    }
}

- (IBAction)attack:(id)sender {
    srand(time(NULL));  
    localAttackValue = rand() % 100;
    NSData *data = [NSData dataWithBytes:&localAttackValue length:sizeof(localAttackValue)];
    NSError *error = nil;

    if ([match sendDataToAllPlayers:data withDataMode:GKMatchSendDataReliable error:&error]) {
        [self battleCheck];
    } else {
        // 送信エラー処理
    }
}

- (void)match:(GKMatch *)aMatch player:(NSString *)playerID didChangeState:(GKPlayerConnectionState)state {
    if (aMatch.expectedPlayerCount == 0) {
        localAttackValue = 0;
        remoteAttackValue = 0;
    }
}

- (void)match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID {
    remoteAttackValue = *((NSInteger *)[data bytes]);
    [self battleCheck];
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [match release];
    [super dealloc];
}

@end
