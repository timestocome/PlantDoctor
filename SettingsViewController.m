//
//  SettingsViewController.m
//  PlantDoctor
//
//  Created by Linda Cobb on 7/7/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import "SettingsViewController.h"



@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];

}

-(IBAction)emailTechSupport:(id)sender
{
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    
    if (mailClass != nil)
    {
        // We must always check whether the current device is configured for sending emails
        if ([mailClass canSendMail])
        {
            // send the email
            MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
            picker.mailComposeDelegate = self;
            
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
                [picker setSubject:[NSString stringWithFormat:@"Plant Doctor V 8.2 iPad Request"]];
            }else{
                [picker setSubject:[NSString stringWithFormat:@"Plant Doctor V 8.2 iPhone Request"]];
            }

            [picker setToRecipients:[NSArray arrayWithObject:@"timestocome@gmail.com"]];
            
            [self presentViewController:picker animated:YES completion:NULL];
            
        }else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mail Failed" message:@"Device unable to send email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mail Failed" message:@"Device unable to send email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}



// Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation.
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}





-(IBAction)gift:(id)sender
{
    NSString *GiftAppURL = [NSString stringWithFormat:@"itms-appss://buy.itunes.apple.com/WebObjects/MZFinance.woa/wa/giftSongsWizard?gift=1&salableAdamId=%d&productType=C&pricingParameter=STDQ&mt=8&ign-mscache=1",306625566];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:GiftAppURL]];
}


-(IBAction)share:(id)sender
{
    NSString *messageString = @"Plant Doctor Link: itms-apps://itunes.apple.com/us/app/fit-test/id306625566?mt=8";
    NSArray *shareItem = @[messageString];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:shareItem applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
    
}


-(IBAction)rate:(id)sender
{
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id306625566"]];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
