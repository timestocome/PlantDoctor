//
//  PlantDoctor.h
//  PlantDoctor
//
//  Created by Linda Cobb on 7/7/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlantDoctor : NSObject
{
    int sun;
    int water;
    int humidity;
    int fertilizer;
    int temperature;
    int bugs;
    
    int selectedSymptomCount;
}

@property (nonatomic, retain) NSNumber *change;
@property (nonatomic, retain) NSNumber *rootRot;
@property (nonatomic, retain) NSNumber *mealy;
@property (nonatomic, retain) NSNumber *fungus;
@property (nonatomic, retain) NSNumber *gnats;
@property (nonatomic, retain) NSNumber *webs;
@property (nonatomic, retain) NSNumber *scale;


@property (nonatomic, retain) NSArray *symptomDescriptionArray;
@property (nonatomic, retain) NSArray *selectedSymptomsArray;
@property (nonatomic, retain) NSArray *segementedControlArray;


@property (nonatomic, retain) NSUserDefaults *defaults;

- (NSArray *)symptomDescriptionArray;
- (NSArray *)segementedControlArray;


- (void)loadSelectedSymptoms;
- (void)scoreSymptoms;

- (void)diagnosePlantSummary;
- (void)diagnosePlantDetailed;

- (NSArray *)getScore;



@end
