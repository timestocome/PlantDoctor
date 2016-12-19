//
//  SymptomsViewController.m
//  PlantDoctor
//
//  Created by Linda Cobb on 7/7/13.
//  Copyright (c) 2013 TimesToCome Mobile. All rights reserved.
//

#import "SymptomsViewController.h"



@implementation SymptomsViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {}
    
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    _defaults = [NSUserDefaults standardUserDefaults];
}


- (void)loadData
{
    // remove old stuff before redrawing
	int viewCount = (int)[[self.scrollView subviews] count];
	UIView *oldView;
	
    
	for ( int i=0; i<viewCount; i++){
		oldView = [[self.scrollView subviews] objectAtIndex:0];
		[oldView removeFromSuperview];
		oldView = nil;
	}

    
    
    _plantDoctor = [PlantDoctor new];
    _symptoms = [NSMutableArray arrayWithArray:[self.plantDoctor symptomDescriptionArray]];
    
    numberOfSymptoms = (int)self.symptoms.count;
    _dataArray = [NSMutableArray arrayWithCapacity:numberOfSymptoms];
    self.dataArray = [NSMutableArray arrayWithArray:[self.defaults objectForKey:@"data"]];
    
    
    
    // get device width
    viewFrameWidth = self.view.frame.size.width;
    
    // size of margin for control
    segmentedControlWidth = 80.0;
    
    // text area
    textWidth = viewFrameWidth - segmentedControlWidth;
    textHeight = 50.0;
    
    // row height
    rowHeight = 60.0;
    
    // create true/false switch array	
	NSArray *options = @[ @"No", @"Yes"];
	_segmentedControlArray = [[NSMutableArray alloc] initWithCapacity:numberOfSymptoms];
	
	   
    if (self.dataArray.count <= 0  ){
        // set up empty data array for first run, over write with stored array later if exits
        NSArray *a = @[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                       @0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                       @0, @0, @0, @0, @0, @0, @0, @0, @0, @0,
                       @0, @0];
        self.dataArray = [NSMutableArray arrayWithArray:a];
    }

    
	for (int i=0; i<numberOfSymptoms; i++){
        
		UISegmentedControl *s = [[UISegmentedControl alloc] initWithItems:options];
		
        // restore previous values here
        [s setSelectedSegmentIndex:[[self.dataArray objectAtIndex:i]intValue]];
        
		[s addTarget:self action:@selector(action:) forControlEvents:UIControlEventValueChanged];
		[self.segmentedControlArray addObject:s];
	}
    
    
	CGRect textPosition;
	CGRect vFrame;
	UIView *v;
    UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    
    
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        
		textPosition = CGRectMake( segmentedControlWidth, -5, viewFrameWidth, textHeight);
		vFrame = CGRectMake(segmentedControlWidth, 0, textWidth, textHeight);
        
	}else{
		textPosition = CGRectMake( segmentedControlWidth, -5, viewFrameWidth, textHeight);
		vFrame = CGRectMake(0, 0, textWidth, textHeight);
	}
    
    
	// create a view for each symptom
	for ( int i=0; i<numberOfSymptoms; i++){
        
        v = [[UIView alloc] initWithFrame:vFrame];
		[v addSubview:[self.segmentedControlArray objectAtIndex:i]];
		
		
		UITextView *symptomTextView = [[UITextView alloc] initWithFrame:textPosition];
		[symptomTextView setBackgroundColor:[UIColor clearColor]];
        [symptomTextView setFont:font];
		[symptomTextView setEditable:NO];
		[symptomTextView setScrollEnabled:NO];
		[symptomTextView drawRect:textPosition];
		
		NSString *txt = [self.symptoms objectAtIndex:i];
		[symptomTextView setText:txt];
		[v addSubview:symptomTextView];
		
		[self.scrollView addSubview:v];
		
	}
	
	
	// line up images in scrollView
	UITextView *view = nil;
	NSArray *subviews = [self.scrollView subviews];
    
	
	CGFloat y = 20;
	for ( view in subviews ){
		CGRect frame = view.frame;
		frame.origin = CGPointMake( 10, y );
		view.frame = frame;
		y += 60;
	}
	
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
		[self.scrollView setContentSize:CGSizeMake(viewFrameWidth, y)];
	}else {
		[self.scrollView setContentSize:CGSizeMake(viewFrameWidth, y)];
    }
    
	self.scrollView.backgroundColor = [UIColor clearColor];
    
}



- (void)viewWillAppear:(BOOL)animated
{
    [self loadData];
}



// every time a switch was flipped
- (void)action:(id)sender
{
       
        // update data
    int s;
	for ( int i=0; i<numberOfSymptoms; i++){
        s = (int)[[self.segmentedControlArray objectAtIndex:i] selectedSegmentIndex];
       if ( s == 0 ){
			[self.dataArray replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:0]];
		}else{
			[self.dataArray replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:1]];
		}
	}
    
    [self.defaults setObject:self.dataArray forKey:@"data"];
    [self.defaults synchronize];

}



- (void)viewWillDisappear:(BOOL)animated
{
    [self.defaults setObject:self.dataArray forKey:@"data"];
    [self.defaults synchronize];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
