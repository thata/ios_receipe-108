//
//  imagepickerViewController.h
//  imagepicker
//
//  Created by kzsg on 10/10/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface imagepickerViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {

}

- (IBAction)takePhoto;
- (IBAction)takeMovie;
@end

