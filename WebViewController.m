//
//  WebViewController.m
//  Fitness
//
//  Created by Linda Cobb on 6/27/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    [self.webView setScalesPageToFit:YES];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://timestocomemobile.com/apps/"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:urlRequest];
    
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
