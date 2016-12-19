//
//  SettingsViewController.h
//  PlantDoctor
//
//  Created by Linda Cobb on 7/7/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface SettingsViewController : UIViewController <MFMailComposeViewControllerDelegate>


- (IBAction)emailTechSupport:(id)sender;


-(IBAction)gift:(id)sender;
-(IBAction)share:(id)sender;
-(IBAction)rate:(id)sender;


@end
