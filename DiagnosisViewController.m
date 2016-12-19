//
//  DiagnosisViewController.m
//  PlantDoctor
//
//  Created by Linda Cobb on 7/7/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import "DiagnosisViewController.h"


@implementation DiagnosisViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    _plantDoctor = [PlantDoctor new];

}


- (void)viewWillAppear:(BOOL)animated
{
    [self.plantDoctor loadSelectedSymptoms];
    [self.plantDoctor scoreSymptoms];
    
    [self.plantDoctor diagnosePlantSummary];
    [self.plantDoctor diagnosePlantDetailed];
    
    [self loadData];
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        
        [self summaryDiagnosis];
    }
    
}




- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
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
        
        // Present the scene.
        [skView presentScene:self.myScene];
    }
}








- (void)loadData
{
    NSArray *diagnosis = [self.plantDoctor getScore];
    
    // sun, water, temperature, fertilizer, humidity, bugs
    NSMutableString *diagnosisString = [[NSMutableString alloc] initWithString:@"Diagnosis:\n"];
    
    
    int sun = [[diagnosis objectAtIndex:0] intValue];
    int water = [[diagnosis objectAtIndex:1] intValue];
    int temperature = [[diagnosis objectAtIndex:2] intValue];
    int fertilizer = [[diagnosis objectAtIndex:3] intValue];
    int humidity = [[diagnosis objectAtIndex:4] intValue];
    int bugs = [[ diagnosis objectAtIndex:5] intValue];
    
    int score = 0;
    
    
    if ( sun < 0 ){
        [diagnosisString appendString:@"\n\nLack of light is the most common cause for house plant deaths. Try putting your plant in a sunnier window, or placing a fluorescent lamp near the plant. "];
        score++;
    }else if ( sun > 0 ){
        [diagnosisString appendString:@"\n\nThis plant is getting too much light, can up pull it back from the window a little or place in in a less sunny window"];
        score++;
    }else if (sun == 0){
        [diagnosisString appendString:@"\n\nLighting looks good. Plants need blue light for leaves and growth and red for flowering."];
    }
    
    if ( water < 0 ){
        [diagnosisString appendString:@"\n\nThis plant needs to be watered more often and deeper. Sometimes a larger pot will help keep the soil moist."];
        score++;
    }else if ( water > 0 ){
        [diagnosisString appendString:@"\n\nWater less frequently or try potting this plant in a smaller pot so the soil can dry out."];
        score++;
    }else if ( water == 0 ){
    }
    
    if ( temperature < 0 ){
        [diagnosisString appendString:@"\n\nWarmer temperatures needed, most house plants are tropical and used to temperatures between 65'F and 85'F"];
        score++;
    }else if ( temperature > 0 ){
        [diagnosisString appendString:@"\n\nCooler temperatures neeeded, this is especially true for flowering plants that often need cooler temperatures to signal the plant to bloom. A drafty window will usually do the trick."];
        score++;
    }else if (temperature == 0){
    }
    
    if ( fertilizer < 0 ){
        [diagnosisString appendString:@"\n\nThis plant needs more vitamins, try fertilizing with a good fertilizer that contains micro-nutrients as well as nitrogen, phosphorus and potassium."];
        score++;
    }else if ( fertilizer > 0 ){
        [diagnosisString appendString:@"\n\nFertilize with a lower dose or less often. Most houseplant soils now come pre-fertilized."];
        score++;
    }else if (fertilizer == 0){
    }
    
    if ( humidity > 0 ){
        [diagnosisString appendString:@"\n\nRaise humidity levels, often a drafty window will do it or a location in a bathroom where showers are taken."];
        score++;
    }else if ( humidity < 0 ){
        [diagnosisString appendString:@"\n\nLower the humidity around this plant"];
        if ( self.plantDoctor.fungus.intValue ){
            [diagnosisString appendString:@"\n Try a copper based fungus spray to kill off the rust."];
        }
        score++;
    }else if ( humidity == 0 ){
    }
    
    if ( bugs > 0 ){
        [diagnosisString appendString:@"\n\nSigns of insects:\n"];
        int bugs = 0;
        if ( self.plantDoctor.mealy.intValue ){
            [diagnosisString appendString:@"\n Mealy bugs can come in from anywhere. Washing the plant with liquid dish soap and water or spraying with an insecticidal oil"];
            bugs++;
        }
        
        if ( self.plantDoctor.gnats.intValue){
            [diagnosisString appendString:@"\nGnats are a sign of over watering or too little light. Repot in a smaller pot with fresh soil."];
            bugs++;
        }
        
        if ( self.plantDoctor.webs.intValue ){
            [diagnosisString appendString:@"\nSpider mites usually appear in dry homes. Washing the plant with liquid dish soap and water should remove them."];
            bugs++;
        }
        
        if ( self.plantDoctor.scale.intValue ){
            [diagnosisString appendString:@"\nScale comes in from anywhere. gently scraping them off and treating with an insecticidal oil usually works well."];
            bugs++;
        }
        
        if ( bugs == 0 ){
            [diagnosisString appendString:@"Stickiness is mostly likely aphids or some other sap sucking insect. Spray the plant with liquid dish soap mixed with water until the stickiness is gone."];
        }
        
        score++;
    }else if ( bugs < 0 ){
    }else if (bugs == 0 ){
    }
    
    
    if ( score == 0 )   {
        diagnosisString = [[NSMutableString alloc] initWithString:@"Select the symptoms your plant is experiencing and I'll help you doctor your plant."];
    }
    
    [self.textView setText:diagnosisString];
    
}




///  iPad only stuff

-(IBAction)resetSymptoms:(id)sender
{
    NSArray *a = @[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                   @0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                   @0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                   @0, @0];
    
    [self.defaults setObject:a forKey:@"data"];
    [self.defaults synchronize];
}



- (void)summaryDiagnosis
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




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
