//
//  LinesDetailViewController.m
//  GNAR
//
//  Created by  on 12/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LinesDetailViewController.h"

@interface LinesDetailViewController ()

@end

@implementation LinesDetailViewController
@synthesize pointsLabel;
@synthesize segButton;
@synthesize textView;
@synthesize difficultyField;
@synthesize funField;
@synthesize heroField;
@synthesize points, scoreName, pointToAdd, pointsDictionary, lowScore, medScore, highScore;

- (void)viewDidLoad
{
    [super viewDidLoad];
    lowScore = [[pointsDictionary objectForKey:@"Lo"] intValue];
    medScore = [[pointsDictionary objectForKey:@"Med"] intValue];
    highScore = [[pointsDictionary objectForKey:@"Hi"] intValue];
    points = medScore;
    pointsLabel.text = [[NSString alloc] initWithFormat:@"%i", medScore];
    if([pointsDictionary objectForKey:@"Description"] != 0)
    {
        textView.text = [pointsDictionary objectForKey:@"Description"];
    }
    if([pointsDictionary objectForKey:@"Difficulty"] != 0)
    {
        difficultyField.text = [pointsDictionary objectForKey:@"Difficulty"];
    }
    if([pointsDictionary objectForKey:@"Hero"] != 0)
    {
        heroField.text = [pointsDictionary objectForKey:@"Hero"];
    }
    if([pointsDictionary objectForKey:@"Fun"] != 0)
    {
        funField.text = [pointsDictionary objectForKey:@"Fun"];
    }

}

- (void)viewDidUnload
{
    [self setSegButton:nil];
    [self setTextView:nil];
    [self setDifficultyField:nil];
    [self setFunField:nil];
    [self setHeroField:nil];
    [self setPointsLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)segValueChanged:(UISegmentedControl *)sender 
{
    switch (self.segButton.selectedSegmentIndex) {
        case 0:
            if (lowScore == 0)
            {
                self.pointsLabel.text = @"Not Recommended";
            }
            else {
                self.pointsLabel.text =[[NSString alloc] initWithFormat:@"%i", lowScore];
                points = lowScore;
            }
            break;
        case 1:
            if (medScore == 0)
            {
                self.pointsLabel.text = @"Not Recommended";
            }
            else {
                self.pointsLabel.text =[[NSString alloc] initWithFormat:@"%i", medScore];
                points = medScore;
            }
            break;
        case 2:
            if (highScore == 0)
            {
                self.pointsLabel.text = @"Not Recommended";
            }
            else {
                self.pointsLabel.text =[[NSString alloc] initWithFormat:@"%i", highScore];
                points = highScore;
            }
            break;
            
        default:
            break;
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{ 
    
    if ([segue.identifier isEqualToString:@"LoadScoresList"])
    {
        pointToAdd = [[LineWorth alloc] init];
        pointToAdd.name = self.title;
        pointToAdd.date = [NSDate date];
        pointToAdd.score = points;
        pointToAdd.scoreID = 1;
        pointToAdd.scoreType = @"";
        [self addToScores:pointToAdd];
    }
}
-(void) addToScores:(ExtraPoints*)newPoint
{
    MainTabController* main = (MainTabController*)self.tabBarController;
    [main.myGame.gnarScores addObject: newPoint];
    NSLog(@"%d", [main.myGame.gnarScores count]);
}

@end
