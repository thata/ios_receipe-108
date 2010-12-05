//
//  imagepickerViewController.m
//  imagepicker
//
//  Created by kzsg on 10/10/02.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "imagepickerViewController.h"

@implementation imagepickerViewController

- (void)dealloc {
    [super dealloc];
}

- (IBAction)takePhoto {
	UIImagePickerController *picker = [[[UIImagePickerController alloc] init] autorelease];
	UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
	if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
		picker.delegate = self;
		picker.sourceType = sourceType;
		[self presentModalViewController:picker animated:YES];
	} else {
		NSLog(@"カメラが使えない.");
	}
	
}

- (IBAction)takeMovie {
	UIImagePickerController *picker = [[[UIImagePickerController alloc] init] autorelease];
	
	UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
	if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
		picker.delegate = self;
		picker.sourceType = sourceType;
		NSArray *types = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
		if ([types containsObject:(NSString *)kUTTypeMovie]) {
			picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
			picker.videoMaximumDuration = 1200;
			picker.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeMovie, (NSString *)kUTTypeImage, nil];
			[self presentModalViewController:picker animated:YES];
		} else{
			NSLog(@"デバイスが %@ に対応していない.", kUTTypeMovie);
		}
	} else {
		NSLog(@"UIImagePickerControllerSourceTypeCamera に対応していない.");
	}
	
}

- (void)imagePickerController:(UIImagePickerController *)picker 
didFinishPickingMediaWithInfo:(NSDictionary *)info {
	
	NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
	if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
		NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
		NSString* path = [url path];
		
		if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(path)) {
			UISaveVideoAtPathToSavedPhotosAlbum(path, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
		}
	} else {
		UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
		UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
	}
	
	[self dismissModalViewControllerAnimated:YES];
	
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo {
	if (error) {
		NSLog([error description]);
	}
	
	NSLog(@"save finish.");
}

- (void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo {
	if (error) {
		NSLog([error description]);
	}
	
	NSLog(@"save finish.");
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
