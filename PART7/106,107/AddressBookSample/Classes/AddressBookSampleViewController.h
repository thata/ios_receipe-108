//
//  AddressBookSampleViewController.h
//  AddressBookSample
//
//  Created by kzsg on 10/08/24.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface AddressBookSampleViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate> {

	IBOutlet UITextField *firstNameField;
	IBOutlet UITextField *lastNameField;
}

- (IBAction)showPicker:(id)sender;

@end

