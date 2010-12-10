//
//  AddressBookSampleViewController.m
//  AddressBookSample
//
//  Created by kzsg on 10/08/24.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AddressBookSampleViewController.h"

@implementation AddressBookSampleViewController


- (void)dealloc {
    [super dealloc];
}

- (IBAction)showPicker:(id)sender {
    ABPeoplePickerNavigationController *picker =
	[[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
	
    [self presentModalViewController:picker animated:YES];
    [picker release];
}

- (void)peoplePickerNavigationControllerDidCancel:
(ABPeoplePickerNavigationController *)peoplePicker {
    [self dismissModalViewControllerAnimated:YES];
}


- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person {
	
	NSString *firstname = (NSString *)ABRecordCopyValue(person,
														kABPersonFirstNameProperty);
	NSLog(@"first name : %@", firstname);
	firstNameField.text = firstname;
	[firstname release];
	
	NSString *lastname = (NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
	NSLog(@"last name : %@", lastname);
	lastNameField.text = lastname;
	[lastname release];
	
	NSString *fullname = (NSString *)ABRecordCopyCompositeName(person);
	NSLog(@"First name, and Last name : %@", fullname);
	[fullname release];
	
    //[self dismissModalViewControllerAnimated:YES];
	
    return YES;
}

- (BOOL)peoplePickerNavigationController:
(ABPeoplePickerNavigationController *)peoplePicker
      shouldContinueAfterSelectingPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier{
	
	NSLog(@"property=%d , identifier=%d", property, identifier);
	
	ABMultiValueRef multiValue;
	if (kABPersonAddressProperty == property) {
		multiValue = ABRecordCopyValue(person, kABPersonAddressProperty);
		CFDictionaryRef address = ABMultiValueCopyValueAtIndex(multiValue, 0);
		CFStringRef country = CFDictionaryGetValue(address, kABPersonAddressCountryKey);
		CFStringRef countryCode = CFDictionaryGetValue(address, kABPersonAddressCountryCodeKey);
		CFStringRef state = CFDictionaryGetValue(address, kABPersonAddressStateKey);
		CFStringRef city = CFDictionaryGetValue(address, kABPersonAddressCityKey);
		CFStringRef streat = CFDictionaryGetValue(address, kABPersonAddressStreetKey);
		CFStringRef zipCode = CFDictionaryGetValue(address, kABPersonAddressZIPKey);
		NSLog(@"address = %@ %@ %@ %@ %@ %@", country, countryCode, state, city, streat, zipCode);
		CFRelease(address);
	} else {
		multiValue = ABRecordCopyValue(person, property);
		CFIndex index = ABMultiValueGetIndexForIdentifier(multiValue, identifier);
		NSString *value = (NSString*)ABMultiValueCopyValueAtIndex(multiValue,index);
		NSLog(@"%@", value);
	}
 
	CFRelease(multiValue);
	
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// アドレスブックにレコードを追加する
	
	// アドレスブックオブジェクトの作成
	ABAddressBookRef addressBook = ABAddressBookCreate();
	CFErrorRef error = NULL;
	
	{ // Personレコードを追加する例
		ABRecordRef person = ABPersonCreate();
		
		// 姓名の追加
		ABRecordSetValue(person, kABPersonLastNameProperty, CFSTR("たろう"), &error);
		ABRecordSetValue(person, kABPersonFirstNameProperty, CFSTR("やまだ"), &error);

		// 住所の追加
		ABMutableMultiValueRef multiAddress = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
		NSMutableDictionary *addressDictionary = [[[NSMutableDictionary alloc] init] autorelease];
		[addressDictionary setObject:@"jp" forKey:(NSString *)kABPersonAddressCountryCodeKey];
		[addressDictionary setObject:@"日本" forKey:(NSString *)kABPersonAddressCountryKey];
		[addressDictionary setObject:@"110-0005" forKey:(NSString *)kABPersonAddressZIPKey];
		[addressDictionary setObject:@"東京都" forKey:(NSString *)kABPersonAddressStateKey];
		[addressDictionary setObject:@"台東区" forKey:(NSString *)kABPersonAddressCityKey];
		[addressDictionary setObject:@"上野2-7-7" forKey:(NSString *)kABPersonAddressStreetKey];
		ABMultiValueAddValueAndLabel(multiAddress, addressDictionary, kABWorkLabel, NULL);
		ABRecordSetValue(person, kABPersonAddressProperty, multiAddress, &error);
		// ニックネームの追加
		ABRecordSetValue(person, kABPersonNicknameProperty, CFSTR("たろすけ"), &error);
		
		// メールアドレスの追加
		ABMultiValueRef email = ABMultiValueCreateMutable(kABMultiStringPropertyType);
		ABMultiValueAddValueAndLabel(email, @"tarosuke@iphone.esm.co.jp", kABOtherLabel, NULL);
		ABRecordSetValue(person, kABPersonEmailProperty, email, &error);
		
		// 記念日
		ABMutableMultiValueRef multiDate = ABMultiValueCreateMutable(kABMultiDateTimePropertyType);
		NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
		[dateFormatter setDateStyle:NSDateFormatterShortStyle];
		NSDate *date = [dateFormatter dateFromString:@"10/14/79"];
		ABMultiValueAddValueAndLabel(multiDate, date, kABPersonAnniversaryLabel, NULL);
		ABRecordSetValue(person, kABPersonDateProperty, multiDate, &error);
		
		// 電話番号
		ABMutableMultiValueRef multiNum = ABMultiValueCreateMutable(kABMultiStringPropertyType);
		ABMultiValueAddValueAndLabel(multiNum, @"0312345678", kABPersonPhoneIPhoneLabel, NULL);
		ABRecordSetValue(person, kABPersonPhoneProperty, multiNum, &error);
		
		
		// IM
		ABMutableMultiValueRef multiIM = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
		NSMutableDictionary *dict = [NSMutableDictionary dictionary];
		[dict setValue:(void *)kABPersonInstantMessageServiceAIM forKey:(void *)kABPersonInstantMessageServiceKey];
		[dict setValue:@"userId" forKey:(NSString *)kABPersonInstantMessageUsernameKey];
		ABMultiValueAddValueAndLabel(multiIM, dict, kABHomeLabel, NULL);
		ABRecordSetValue(person, kABPersonInstantMessageProperty, multiIM, &error);
		
		// URL
		ABMutableMultiValueRef multiURL = ABMultiValueCreateMutable(kABMultiStringPropertyType);
		ABMultiValueAddValueAndLabel(multiURL, @"http://www.esm.co.jp/", kABPersonHomePageLabel, NULL);
		ABRecordSetValue(person, kABPersonURLProperty, multiURL, &error);
		
		// レコードをアドレスブックに追加する
		ABAddressBookAddRecord(addressBook, person, &error);
		
		// 保存(save)前のアドレスブックはもとに戻すことができる
		// ABAddressBookRevert(addressBook);

		// アドレスブックを保存する
		
		ABAddressBookSave(addressBook, &error);
		
		CFRelease(multiAddress);
		CFRelease(person);
		
	}
	
	{ // Personレコードを読み込む例
		// レコードを"やまだ"という名前で検索する
		CFArrayRef people = ABAddressBookCopyPeopleWithName(addressBook, CFSTR("やまだ"));
		ABRecordRef person = CFArrayGetValueAtIndex(people, 0);
		CFStringRef nickname = ABRecordCopyValue(person, kABPersonNicknameProperty);
		NSLog(@"ニックネーム： %@", nickname);
		
		ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
		CFStringRef email = ABMultiValueCopyValueAtIndex(emails, 0);
		NSLog(@"メールアドレス： %@", email);
		
		NSString *fullname = (NSString *)ABRecordCopyCompositeName(person);
		NSLog(@"First name, and Last name : %@", fullname);
		
		
		CFRelease(people);
		CFRelease(nickname);
		CFRelease(emails);
		CFRelease(email);
		CFRelease(fullname);
	}
	
	
	/*
	{
		ABRecordRef person = ABPersonCreate();
		// Single property
		ABRecordSetValue(person, kABPersonLastNameProperty, CFSTR("はなこ"), &error);
		ABRecordSetValue(person, kABPersonFirstNameProperty, CFSTR("たなか"), &error);
		
		// Multi property
		// Date
		ABMutableMultiValueRef multiDate = ABMultiValueCreateMutable(kABMultiDateTimePropertyType);
		NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
		[dateFormatter setDateStyle:NSDateFormatterShortStyle];
		NSDate *date = [dateFormatter dateFromString:@"10/14/79"];
		ABMultiValueAddValueAndLabel(multiDate, date, kABPersonAnniversaryLabel, NULL);
		ABRecordSetValue(person, kABPersonDateProperty, multiDate, &error);
		
		// PhoneNumber
		ABMutableMultiValueRef multiNum = ABMultiValueCreateMutable(kABMultiStringPropertyType);
		ABMultiValueAddValueAndLabel(multiNum, @"0312345678", kABPersonPhoneIPhoneLabel, NULL);
		ABRecordSetValue(person, kABPersonPhoneProperty, multiNum, &error);
		
		// IM
		ABMutableMultiValueRef multiIM = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
		NSMutableDictionary *dict = [NSMutableDictionary dictionary];
		CFDictionaryAddValue(dict, kABPersonInstantMessageServiceKey, kABPersonInstantMessageServiceAIM);
		CFDictionaryAddValue(dict, kABPersonInstantMessageUsernameKey, @"username");
		ABMultiValueAddValueAndLabel(multiIM, dict, kABHomeLabel, NULL);
		ABRecordSetValue(person, kABPersonInstantMessageProperty, multiIM, &error);
		
		// URL
		ABMutableMultiValueRef multiURL = ABMultiValueCreateMutable(kABMultiStringPropertyType);
		ABMultiValueAddValueAndLabel(multiURL, @"http://www.esm.co.jp/", kABPersonHomePageLabel, NULL);
		ABRecordSetValue(person, kABPersonURLProperty, multiURL, &error);
		
		
		ABAddressBookAddRecord(addressBook, person, &error);
		ABAddressBookSave(addressBook, &error);

		CFArrayRef people = ABAddressBookCopyPeopleWithName(addressBook, CFSTR("John"));
		ABRecordRef john = CFArrayGetValueAtIndex(people, 0);
		ABMultiValueRef anniversaries = ABRecordCopyValue(john, kABPersonDateProperty);
		CFDateRef anniversary = ABMultiValueCopyValueAtIndex(anniversaries, 0);
		NSLog(@"%@", [anniversary description]);
	}
	*/
	
	
	
	/*{
		CFErrorRef error = NULL;
		ABRecordRef person = ABPersonCreate();
		ABMutableMultiValueRef multiAddress = ABMultiValueCreateMutable(kABMultiDictionaryPropertyType);
		NSMutableDictionary *addressDictionary = [[[NSMutableDictionary alloc] init] autorelease];
		[addressDictionary setObject:@"110-0005" forKey:(NSString *)kABPersonAddressZIPKey];
		[addressDictionary setObject:@"東京都" forKey:(NSString *)kABPersonAddressStateKey];
		[addressDictionary setObject:@"台東区" forKey:(NSString *)kABPersonAddressCityKey];
		[addressDictionary setObject:@"上野2-7-7" forKey:(NSString *) kABPersonAddressStreetKey];
		ABMultiValueAddValueAndLabel(multiAddress, addressDictionary, kABWorkLabel, NULL);
		ABRecordSetValue(person, kABPersonAddressProperty, multiAddress, &error);
		CFRelease(multiAddress);
	}*/
	
	
	// 全てのアドレスを取得
	/*
	CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(addressBook);
	NSLog(@"address.count = %d", CFArrayGetCount(people));
	
	for (int index = 0; index < CFArrayGetCount(people);index++) {
		ABRecordRef ref = CFArrayGetValueAtIndex(people, index);
		NSLog((NSString *)ABRecordCopyValue(ref, kABPersonFirstNameProperty));
	}
	*/
	/*
	CFArrayRef people = ABAddressBookCopyPeopleWithName(addressBook, CFSTR("遠藤"));
	ABRecordRef person = CFArrayGetValueAtIndex(people, 0);
	NSString *name = (NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
	NSLog(@"%@", name);
	*/
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
