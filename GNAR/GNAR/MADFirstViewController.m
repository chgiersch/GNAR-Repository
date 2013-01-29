//
//  MADFirstViewController.m
//  GNAR
//
//  Created by  on 12/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MADFirstViewController.h"

@interface MADFirstViewController ()

@end

@implementation MADFirstViewController
@synthesize gnarFactorLabel, totalScore;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self calcScore];
    
	
}
-(void)viewDidAppear
{    
    [super viewDidAppear:(true)];
}

- (void)viewDidUnload
{
    [self setGnarFactorLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)calcScore
{
    MainTabController* main = (MainTabController*)self.tabBarController;
    int points = 0;
    for (int i = 0; i < [main.myGame.gnarScores count]; i++)
    {
        GnarScore* g = [main.myGame.gnarScores objectAtIndex:i];
        points = points + g.score;
    }
    gnarFactorLabel.text = [[NSString alloc] initWithFormat:@"%i", points];
}


@end
