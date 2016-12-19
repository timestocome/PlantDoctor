//
//  SymptomsViewController.h
//  PlantDoctor
//
//  Created by Linda Cobb on 7/7/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlantDoctor.h"

@interface SymptomsViewController : UIViewController
{
    float viewFrameWidth;
    float segmentedControlWidth;
    float textWidth;
    float textHeight;
    float rowHeight;
    int   numberOfSymptoms;
}

@property (nonatomic, strong) PlantDoctor *plantDoctor;

@property (nonatomic, strong) NSMutableArray *symptoms;
@property (nonatomic, strong) NSMutableArray *selectedSymptoms;
@property (nonatomic, strong) NSMutableArray *segmentedControlArray;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSUserDefaults *defaults;

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;


@end
