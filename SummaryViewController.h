//
//  SummaryViewController.h
//  PlantDoctor
//
//  Created by Linda Cobb on 7/7/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

#import "PlantDoctor.h"
#import "MyScene.h"


@interface SummaryViewController : UIViewController


@property (nonatomic, retain) PlantDoctor *plantDoctor;
@property (nonatomic, retain) NSUserDefaults *defaults;

@property (nonatomic, retain) IBOutlet UILabel *lightLabel;
@property (nonatomic, retain) IBOutlet UILabel *waterLabel;
@property (nonatomic, retain) IBOutlet UILabel *fertilizerLabel;
@property (nonatomic, retain) IBOutlet UILabel *temperatureLabel;
@property (nonatomic, retain) IBOutlet UILabel *humidityLabel;
@property (nonatomic, retain) IBOutlet UILabel *insectsLabel;

@property (nonatomic, retain) MyScene* myScene;


-(IBAction)resetSymptoms:(id)sender;



@end
