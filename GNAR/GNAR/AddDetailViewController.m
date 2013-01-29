//
//  AddDetailViewController.m
//  GNAR
//
//  Created by  on 12/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddDetailViewController.h"

@interface AddDetailViewController ()

@end

@implementation AddDetailViewController
@synthesize chosenPlist, plistData, detailPointTypes, arrayOfLineWorths, lineworthCount, pointsDictionary, currentItem, trickPointsToSend, arrayOfDictionaries;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    trickPointsToSend = -999999;
    NSBundle *bundle=[NSBundle mainBundle]; //returns a bundle object of our app
    NSString *plistPath=[bundle pathForResource:chosenPlist ofType:@"plist"]; //retrieve the path of the chosen plist
    NSMutableDictionary *dictionary=[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath]; //loads the contents of the plist file into a dictionary
    //the dictionary uses the continents as the keys and a NSArray with the countries for each item
    plistData=dictionary;
    detailPointTypes = [plistData allKeys];

    
    
    
    
    self.title=chosenPlist; //sets the title of the controller
   
    if ([chosenPlist isEqualToString:@"Line Worths"] || [chosenPlist isEqualToString:@"Trick Bonuses"])
    {
        arrayOfLineWorths = [[NSMutableArray alloc] init];
        arrayOfDictionaries = [[NSMutableArray alloc] init];
        for (int i = 0; i<[detailPointTypes count]; i++)
        {
            plistPath=[bundle pathForResource:[detailPointTypes objectAtIndex:i] ofType:@"plist"]; //retrieve the path of the chosen plist
            dictionary=[[NSMutableDictionary alloc] initWithContentsOfFile:plistPath]; //loads the contents of the plist file into a dictionary
            //the dictionary uses the continents as the keys and a NSArray with the countries for each item
            plistData=dictionary;
            NSArray *temp = [plistData allKeys];
            [arrayOfDictionaries addObject:plistData];
            [arrayOfLineWorths addObject:temp];
        }
        lineworthCount = [arrayOfLineWorths count];
    }
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    if ([chosenPlist isEqualToString:@"Line Worths"] || [chosenPlist isEqualToString:@"Trick Bonuses"])
    {
        return lineworthCount;
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     if ([chosenPlist isEqualToString:@"Line Worths"] || [chosenPlist isEqualToString:@"Trick Bonuses"])
         {
             return [[arrayOfLineWorths objectAtIndex:section]count];
         }
    
    return [detailPointTypes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if ([chosenPlist isEqualToString:@"Line Worths"] || [chosenPlist isEqualToString:@"Trick Bonuses"])
    {
        NSMutableArray* temp = [arrayOfLineWorths objectAtIndex:indexPath.section];
        NSString *tempText = [temp objectAtIndex:indexPath.row];
        cell.textLabel.text = tempText;
       
        
    }
    
    else
    {
        cell.textLabel.text = [detailPointTypes objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
       if ([chosenPlist isEqualToString:@"Line Worths"] || [chosenPlist isEqualToString:@"Trick Bonuses"])
       {
           return [detailPointTypes objectAtIndex:section];
       }
    return chosenPlist;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([chosenPlist isEqualToString:@"Line Worths"])
    {
        NSArray* a = [arrayOfLineWorths objectAtIndex:indexPath.section];
        currentItem = [a objectAtIndex:indexPath.row];
        NSMutableDictionary* d = [arrayOfDictionaries objectAtIndex:indexPath.section];
        pointsDictionary = [d objectForKey:currentItem];
        [self performSegueWithIdentifier:@"LoadLineDetail" sender:self];
    }
    else if ([chosenPlist isEqualToString:@"Trick Bonuses"])
    {
        NSArray* a = [arrayOfLineWorths objectAtIndex:indexPath.section];
        NSMutableDictionary* d = [arrayOfDictionaries objectAtIndex:indexPath.section];
        currentItem = [a objectAtIndex:indexPath.row];

        trickPointsToSend = [[d objectForKey:currentItem] intValue];
        NSLog(@"%i", trickPointsToSend);
       [self performSegueWithIdentifier:@"LoadECP" sender:self];
    }
    else {
        currentItem = [detailPointTypes objectAtIndex:indexPath.row];
        pointsDictionary = [plistData objectForKey:currentItem];
        [self performSegueWithIdentifier:@"LoadECP" sender:self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{ 
    
    if ([segue.identifier isEqualToString:@"LoadECP"])
    {
        ECPDetailViewController* vc = (ECPDetailViewController*)segue.destinationViewController;
      if (trickPointsToSend == -999999)
      {
        vc.pointsDictionary = pointsDictionary;
      }
      else 
      {
          vc.points = trickPointsToSend;
      }
        
        vc.title = currentItem;
    }
    else if ([segue.identifier isEqualToString:@"LoadLineDetail"])
    {

        LinesDetailViewController* vc = (LinesDetailViewController*)segue.destinationViewController;
        vc.pointsDictionary = pointsDictionary;
        vc.title = currentItem;
    }
}



@end
