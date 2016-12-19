//
//  PlantDoctor.m
//  PlantDoctor
//
//  Created by Linda Cobb on 7/7/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import "PlantDoctor.h"

@implementation PlantDoctor




- (NSArray *)symptomDescriptionArray
{
    NSArray *array = @[@"Leaf edges are white",
                       @"Leaves are light green",
                       @"Leaves are dark green",
                       @"New leaves turn yellow",
                       @"Older leaves turn yellow",
                       @"Brown spots on leaves",
                       @"Leaf tips are brown",
                       @"Leaf edges are brown",
                       @"Plant wilts",
                       @"Plant grows slow",
                       @"Plant doesn't grow",
                       @"Plant bends toward light",
                       @"Elongated growth",
                       @"Leaves curl downward",
                       @"Wrinkled, creased leaves",
                       @"Split or cracked leaves",
                       @"Bumps on leaves",
                       @"Sticky spots on plant",
                       @"Gnats near plant",
                       @"Fine webs on plant",
                       @"Red edges on leaves",
                       @"Rotted areas on plant",
                       @"Oldest leaves drop off",
                       @"Newest leaves drop off",
                       @"Flowering plant, no flowers",
                       @"Flowers are pale",
                       @"Flower buds drop",
                       @"Flowers too small",
                       @"Flowers short lived",
                       @"All leaves drop off plant",
                       @"Cotton white stuff on plant",
                       @"Rust discoloration on plant"
                       ];
    return array;
    
}




- (NSArray *)segementedControlArray
{
    int count = (int)[self.symptomDescriptionArray count];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:count];
    
    for ( int i=0; i<count; i++){
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"No", @"Yes"]];
        [array addObject:segmentedControl];
    }

    return array;
}







- (void)loadSelectedSymptoms
{
    _defaults = [NSUserDefaults standardUserDefaults];
    _selectedSymptomsArray = [self.defaults objectForKey:@"data"];
   
}



- (void)scoreSymptoms
{
    // check to see if any symptoms have been selected
    int count = self.selectedSymptomsArray.count;
    selectedSymptomCount = 0;
    for ( int i=0; i<count; i++){
        if ( [[self.selectedSymptomsArray objectAtIndex:i] intValue] == 1 ){
            selectedSymptomCount++;
        }
    }
    
    NSLog(@"selected symptoms %d", selectedSymptomCount);
}




- (void)diagnosePlantDetailed
{
    
    if ( selectedSymptomCount > 0 ){
        
        // init
        _change = [NSNumber numberWithInt:0];
        _rootRot = [NSNumber numberWithInt:0];
        _mealy = [NSNumber numberWithInt:0];
        _fungus = [NSNumber numberWithInt:0];
        _gnats = [NSNumber numberWithInt:0];
        _webs = [NSNumber numberWithInt:0];
        _scale = [NSNumber numberWithInt:0];

        
        // symptoms we collect from user
        int leafEdgesWhite = 0;
        int paleLeaf = 0;
        int darkLeaf = 0;
        int newYellow = 0;
        int oldYellow = 0;
        int brownSpots = 0;
        int brownTips = 0;
        int brownEdges = 0;
        int wilts = 0;
        int slowGrowth = 0;
        int noGrowth = 0;
        int bends = 0;
        int elongated = 0;
        int curlDown = 0;
        int wrinkled = 0;
        int splits = 0;
        int bumps = 0;
        int sticky = 0;
        int gnats = 0;
        int webs = 0;
        int rededges = 0;
        int rotted = 0;
        int oldestLeavesDrop = 0;
        int newestLeavesDrop = 0;
        int noFlowers = 0;
        int paleFlowers = 0;
        int budDrop = 0;
        int smallFlowers = 0;
        int shortLived = 0;
        int leafDrop = 0;
        int cotton = 0;
        int rust = 0;
        
        
               
        // add up symptoms
        if( [[self.selectedSymptomsArray objectAtIndex:0] intValue] == 1 ){ leafEdgesWhite++; }
        if( [[self.selectedSymptomsArray objectAtIndex:1] intValue] == 1 ){ paleLeaf++; }
        if( [[self.selectedSymptomsArray objectAtIndex:2] intValue] == 1 ){ darkLeaf++;	}
        if( [[self.selectedSymptomsArray objectAtIndex:3] intValue] == 1 ){ newYellow++; }
        if( [[self.selectedSymptomsArray objectAtIndex:4] intValue] == 1 ){ oldYellow++; }
        if( [[self.selectedSymptomsArray objectAtIndex:5] intValue] == 1 ){ brownSpots++; }
        if( [[self.selectedSymptomsArray objectAtIndex:6] intValue] == 1 ){ brownTips++; }
        if( [[self.selectedSymptomsArray objectAtIndex:7] intValue] == 1 ){ brownEdges++; }
        if( [[self.selectedSymptomsArray objectAtIndex:8] intValue] == 1 ){ wilts++; }
        if( [[self.selectedSymptomsArray objectAtIndex:9] intValue] == 1 ){ slowGrowth++; }
        if( [[self.selectedSymptomsArray objectAtIndex:10] intValue] == 1 ){ noGrowth++; }
        if( [[self.selectedSymptomsArray objectAtIndex:11] intValue] == 1 ){ bends++; }
        if( [[self.selectedSymptomsArray objectAtIndex:12] intValue] == 1 ){ elongated++; }
        if( [[self.selectedSymptomsArray objectAtIndex:13] intValue] == 1 ){ curlDown++; }
        if( [[self.selectedSymptomsArray objectAtIndex:14] intValue] == 1 ){ wrinkled++; }
        if( [[self.selectedSymptomsArray objectAtIndex:15] intValue] == 1 ){ splits++; }
        if( [[self.selectedSymptomsArray objectAtIndex:16] intValue] == 1 ){ bumps++; }
        if( [[self.selectedSymptomsArray objectAtIndex:17] intValue] == 1 ){ sticky++; }
        if( [[self.selectedSymptomsArray objectAtIndex:18] intValue] == 1 ){ gnats++; }
        if( [[self.selectedSymptomsArray objectAtIndex:19] intValue] == 1 ){ webs++; }
        if( [[self.selectedSymptomsArray objectAtIndex:20] intValue] == 1 ){ rededges++; }
        if( [[self.selectedSymptomsArray objectAtIndex:21] intValue] == 1 ){ rotted++; }
        if( [[self.selectedSymptomsArray objectAtIndex:22] intValue] == 1 ){ oldestLeavesDrop++; }
        if( [[self.selectedSymptomsArray objectAtIndex:23] intValue] == 1 ){ newestLeavesDrop++; }
        if( [[self.selectedSymptomsArray objectAtIndex:24] intValue] == 1 ){ noFlowers++; }
        if( [[self.selectedSymptomsArray objectAtIndex:25] intValue] == 1 ){ paleFlowers++; }
        if( [[self.selectedSymptomsArray objectAtIndex:26] intValue] == 1 ){ budDrop++; }
        if( [[self.selectedSymptomsArray objectAtIndex:27] intValue] == 1 ){ smallFlowers++; }
        if( [[self.selectedSymptomsArray objectAtIndex:28] intValue] == 1 ){ shortLived++;	}
        if( [[self.selectedSymptomsArray objectAtIndex:29] intValue] == 1 ){ leafDrop++; }
        if( [[self.selectedSymptomsArray objectAtIndex:30] intValue] == 1 ){ cotton++; }
        if( [[self.selectedSymptomsArray objectAtIndex:31] intValue] == 1 ){ rust++; }
        
        
        // init var possible problems
        double tooMuchWater = 0;
        double tooLittleWater =  0;
        double tooMuchSun = 0;
        double tooLittleSun = 0;
        double tooMuchHumidity = 0;
        double tooLittleHumidity = 0;
        double tooMuchFertilizer = 0;
        double tooLittleFertilizer = 0;
        double tooMuchHeat = 0;
        double tooLittleHeat = 0;
        double insects = 0;
        double change = 0;
        double chemicals = 0;
        double rootrot = 0;
        double mealy = 0;
        double fungus = 0;
    
        // score symptoms
        if ( leafEdgesWhite ){ tooMuchSun++; }
        if ( paleLeaf ){ tooMuchSun++; tooLittleWater++;}
        if ( darkLeaf ){ tooLittleSun++; }
        if ( newYellow ){ tooMuchSun++; tooLittleFertilizer++; tooMuchFertilizer++; tooMuchHeat++; chemicals++; }
        if ( oldYellow ){ tooLittleSun++; tooLittleHumidity++; tooLittleFertilizer++; }
        if ( brownSpots ){ tooMuchWater++; tooLittleWater++; tooLittleHeat++; insects++; }
        if ( brownTips ){  tooLittleWater++; tooMuchWater++; tooLittleHumidity++; tooLittleFertilizer++; tooMuchFertilizer++; tooLittleHeat++; chemicals++; }
        if ( brownEdges ){ tooMuchWater++; tooMuchSun++; tooLittleHumidity++;  }
        if ( wilts ){ tooMuchWater++; tooLittleWater++; tooMuchSun++; tooLittleHumidity++; tooMuchFertilizer++; tooLittleHeat++; tooMuchHeat++; }
        if ( slowGrowth ){ tooLittleSun++; tooLittleFertilizer++; }
        if ( noGrowth ){ tooMuchWater++; tooLittleWater++; tooLittleSun++; tooMuchFertilizer++; tooLittleFertilizer++; tooLittleHeat++; tooMuchHeat++; }
        if ( bends ){ tooLittleSun++; }
        if ( elongated ){ tooLittleSun++;}
        if ( curlDown ){ tooLittleWater++; tooLittleFertilizer++; tooLittleHeat++; }
        if ( wrinkled ){ tooLittleWater++; }
        if ( splits ){ tooLittleWater++; }
        if ( bumps ){ insects++; }
        if ( sticky ){ insects++; }
        if ( gnats ){ insects++; }
        if ( webs ){ insects++; }
        if ( rededges ){ tooLittleSun++; }
        if ( rotted ){ tooLittleSun++; tooMuchWater++; tooMuchHumidity++; }
        if ( oldestLeavesDrop ){ tooMuchWater++; tooLittleWater++; tooLittleSun++; tooLittleHumidity++; tooLittleFertilizer++; tooLittleHeat++; tooMuchHeat++;}
        if ( newestLeavesDrop ){ rootrot++; }
        if ( noFlowers ){ tooLittleSun++; tooMuchHeat++; tooLittleHeat++; }
        if ( paleFlowers ){ tooLittleSun++; tooMuchHeat++; }
        if ( budDrop ){ tooLittleSun++; tooMuchFertilizer++; tooLittleHeat++; tooMuchHeat++; }
        if ( smallFlowers ){ tooLittleSun++; }
        if ( shortLived ){  tooMuchSun++; tooLittleHeat++; tooMuchHeat++;}
        if ( leafDrop ){ change++; tooLittleHumidity++; tooMuchHeat++; }
        if ( cotton ){ mealy++; fungus++; rust++; }
        if ( rust ){ fungus++; tooMuchHumidity++; }
        
        
        if (change){ self.change = [NSNumber numberWithInt:1]; }
        if ( rotted ){self.rootRot = [NSNumber numberWithInt:1]; }
        if ( mealy ){ self.mealy = [NSNumber numberWithInt:1]; }
        if ( rust ){ self.fungus  = [NSNumber numberWithInt:1]; }
        if ( gnats ){self.gnats  = [NSNumber numberWithInt:1]; }
        if ( webs ){self.webs =  [NSNumber numberWithInt:1]; }
        if ( bumps ){ self.scale  = [NSNumber numberWithInt:1]; }
        
       
    }
}






- (void)diagnosePlantSummary
{
    if ( selectedSymptomCount > 0 ){

        // init summary problems
        sun = 0;
        water = 0;
        temperature = 0;
        fertilizer = 0;
        humidity = 0;
        bugs = 0;
       
    
        if( [[self.selectedSymptomsArray objectAtIndex:0] intValue] == 1 ){ sun++; }
        if( [[self.selectedSymptomsArray objectAtIndex:1] intValue] == 1 ){ sun++; water++; }
        if( [[self.selectedSymptomsArray objectAtIndex:2] intValue] == 1 ){ sun--;	}
        if( [[self.selectedSymptomsArray objectAtIndex:3] intValue] == 1 ){ sun++; temperature++; }
        if( [[self.selectedSymptomsArray objectAtIndex:4] intValue] == 1 ){ sun--; fertilizer--; humidity--; }
        if( [[self.selectedSymptomsArray objectAtIndex:5] intValue] == 1 ){ temperature--; }
        if( [[self.selectedSymptomsArray objectAtIndex:6] intValue] == 1 ){ humidity--; temperature--; }
        if( [[self.selectedSymptomsArray objectAtIndex:7] intValue] == 1 ){ water++; sun++; humidity++; }
        if( [[self.selectedSymptomsArray objectAtIndex:8] intValue] == 1 ){ sun++; humidity--; fertilizer++;}
        if( [[self.selectedSymptomsArray objectAtIndex:9] intValue] == 1 ){ sun--; fertilizer--; }
        if( [[self.selectedSymptomsArray objectAtIndex:10] intValue] == 1 ){ sun--; }
        if( [[self.selectedSymptomsArray objectAtIndex:11] intValue] == 1 ){ sun--; }
        if( [[self.selectedSymptomsArray objectAtIndex:12] intValue] == 1 ){ sun--; }
        if( [[self.selectedSymptomsArray objectAtIndex:13] intValue] == 1 ){ water--; temperature--; fertilizer--; }
        if( [[self.selectedSymptomsArray objectAtIndex:14] intValue] == 1 ){ water--; }
        if( [[self.selectedSymptomsArray objectAtIndex:15] intValue] == 1 ){ water--; }
        if( [[self.selectedSymptomsArray objectAtIndex:16] intValue] == 1 ){ bugs++; }
        if( [[self.selectedSymptomsArray objectAtIndex:17] intValue] == 1 ){ bugs++; }
        if( [[self.selectedSymptomsArray objectAtIndex:18] intValue] == 1 ){ bugs++; water++; }
        if( [[self.selectedSymptomsArray objectAtIndex:19] intValue] == 1 ){ bugs++;	}
        if( [[self.selectedSymptomsArray objectAtIndex:20] intValue] == 1 ){ sun++; }
        if( [[self.selectedSymptomsArray objectAtIndex:21] intValue] == 1 ){ sun--; water++; }
        if( [[self.selectedSymptomsArray objectAtIndex:22] intValue] == 1 ){ sun--; humidity--; fertilizer--; }
        if( [[self.selectedSymptomsArray objectAtIndex:23] intValue] == 1 ){ sun--; water++; }
        if( [[self.selectedSymptomsArray objectAtIndex:24] intValue] == 1 ){ sun--; }
        if( [[self.selectedSymptomsArray objectAtIndex:25] intValue] == 1 ){ sun--; temperature++; }
        if( [[self.selectedSymptomsArray objectAtIndex:26] intValue] == 1 ){ sun--; fertilizer++; 	}
        if( [[self.selectedSymptomsArray objectAtIndex:27] intValue] == 1 ){ sun--; }
        if( [[self.selectedSymptomsArray objectAtIndex:28] intValue] == 1 ){ sun++; temperature++;	}
        if( [[self.selectedSymptomsArray objectAtIndex:29] intValue] == 1 ){ temperature++; humidity--; }
        if( [[self.selectedSymptomsArray objectAtIndex:30] intValue] == 1 ){ bugs++; humidity++; }
        if( [[self.selectedSymptomsArray objectAtIndex:31] intValue] == 1 ){ humidity++; }
    }

    NSLog(@"Sun %d Water %d Temperature %d Fertilizer %d Humidity %d Bugs %d", sun, water, temperature, fertilizer, humidity, bugs);
    
}


- (NSArray *)getScore
{
    return [NSArray arrayWithObjects:
            [NSNumber numberWithInt:sun],
            [NSNumber numberWithInt:water],
            [NSNumber numberWithInt:temperature],
            [NSNumber numberWithInt:fertilizer],
            [NSNumber numberWithInt:humidity],
            [NSNumber numberWithInt:bugs], nil
            ];
}



@end
