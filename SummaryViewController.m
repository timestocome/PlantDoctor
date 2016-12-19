//
//  SummaryViewController.m
//  PlantDoctor
//
//  Created by Linda Cobb on 7/7/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import "SummaryViewController.h"



@implementation SummaryViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    return self;
}




- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    NSLog(@"set up plant doctor");
    // set up plant doctor
    _defaults = [NSUserDefaults standardUserDefaults];
    self.plantDoctor = nil;
    _plantDoctor = [PlantDoctor new];
    [self viewWillAppear:YES];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    
    if ( ! skView.scene ){
        
        // Create and configure the scene.
        CGSize tabSize = CGSizeMake(skView.bounds.size.width, skView.bounds.size.height - 70);
        SKScene* scene = [MyScene sceneWithSize:tabSize];
        
        scene.scaleMode = SKSceneScaleModeAspectFill;
        _myScene = (MyScene *)scene;
        self.myScene.viewController = self;
        
        // Present the scene.
        [skView presentScene:self.myScene];
    }
}


/*
- (void)viewDidLoad
{
    [super viewDidLoad];
    _defaults = [NSUserDefaults standardUserDefaults];
    
    self.plantDoctor = nil;
    _plantDoctor = [PlantDoctor new];
}
*/


- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"view will appear");
    [self.plantDoctor loadSelectedSymptoms];
    [self.plantDoctor scoreSymptoms];
    [self.plantDoctor diagnosePlantSummary];
    
    [self loadData];
}

    
- (void)loadData
{
    
    NSArray *diagnosis = [self.plantDoctor getScore];
    
    int sun = [[diagnosis objectAtIndex:0] intValue];
    int water = [[diagnosis objectAtIndex:1] intValue];
    int temperature = [[diagnosis objectAtIndex:2] intValue];
    int fertilizer = [[diagnosis objectAtIndex:3] intValue];
    int humidity = [[diagnosis objectAtIndex:4] intValue];
    int bugs = [[ diagnosis objectAtIndex:5] intValue];
    
    int score = 0;
    
    if ( sun < 0 ){
        [self.lightLabel setText:@"More light is needed"];
        score++;
    }else if ( sun > 0 ){
        [self.lightLabel setText:@"Less light is needed"];
        score++;
    }else if (sun == 0){
        [self.lightLabel setText:@"Lighting is okay"];
    }
    
    if ( water < 0 ){
        [self.waterLabel setText:@"Water deeper and more often"];
        score++;
    }else if ( water > 0 ){
        [self.waterLabel setText:@"Water less often"];
        score++;
    }else if ( water == 0 ){
        [self.waterLabel setText:@"Watering is okay"];
    }
    
    if ( temperature < 0 ){
        [self.temperatureLabel setText:@"Warmer temperatures needed"];
        score++;
    }else if ( temperature > 0 ){
        [self.temperatureLabel setText:@"Cooler temperatures neeeded"];
        score++;
    }else if (temperature == 0){
        [self.temperatureLabel setText:@"Temperature is okay"];
    }
    
    if ( fertilizer < 0 ){
        [self.fertilizerLabel setText:@"Fertilize more frequently"];
        score++;
    }else if ( fertilizer > 0 ){
        [self.fertilizerLabel setText:@"Fertilize with a lower dose"];
        score++;
    }else if (fertilizer == 0){
        [self.fertilizerLabel setText:@"Fertilizer is okay"];
    }
    
    if ( humidity > 0 ){
        [self.humidityLabel setText:@"Raise humidity levels"];
        score++;
    }else if ( humidity < 0 ){
        [self.humidityLabel setText:@"Lower humidity levels"];
        score++;
    }else if ( humidity == 0 ){
        [self.humidityLabel setText:@"Humidity is okay"];
    }
    
    if ( bugs > 0 ){
        [self.insectsLabel setText:@"Insect invasion"];
        score++;
    }else if ( bugs < 0 ){
        [self.insectsLabel setText:@"No sign of insects"];
    }else if (bugs == 0 ){
        [self.insectsLabel setText:@"No sign of insects"];
    }


    if ( score == 0 ){
        [self.lightLabel setText:@"select plant symptoms"];
        [self.waterLabel setText:@"for a diagnosis"];
        [self.temperatureLabel setText:@""];
        [self.fertilizerLabel setText:@""];
        [self.humidityLabel setText:@""];
        [self.insectsLabel setText:@""];
    }
    
}



-(IBAction)resetSymptoms:(id)sender
{
    NSArray *a = @[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                   @0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                   @0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                   @0, @0];
    
    [self.defaults setObject:a forKey:@"data"];
    [self.defaults synchronize];
}




- (BOOL)shouldAutorotate { return YES; }


- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
