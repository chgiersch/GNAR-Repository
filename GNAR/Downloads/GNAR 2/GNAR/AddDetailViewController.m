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
@synthesize chosenPlist, plistData, detailPointTypes, arrayOfLineWorths, lineworthCount;

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

    
    NSBundle *bundle=[NSBundle mainBundle]; //returns a bundle object of our app
    NSString *plistPath=[bundle pathForResource:chosenPlist ofType:@"plist"]; //retrieve the path of the chosen plist
    NSDictionary *dictionary=[[NSDictionary alloc] initWithContentsOfFile:plistPath]; //loads the contents of the plist file into a dictionary
    //the dictionary uses the continents as the keys and a NSArray with the countries for each item
    plistData=dictionary;
    detailPointTypes = [plistData allKeys];
    self.title=chosenPlist; //sets the title of the controller
   
    if ([chosenPlist isEqualToString:@"Line Worths"] || [chosenPlist isEqualToString:@"Trick Bonuses"])
    {
         arrayOfLineWorths = [[NSMutableArray alloc] init];
        for (int i = 0; i<[detailPointTypes count]; i++)
        {
            plistPath=[bundle pathForResource:[detailPointTypes objectAtIndex:i] ofType:@"plist"]; //retrieve the path of the chosen plist
            dictionary=[[NSDictionary alloc] initWithContentsOfFile:plistPath]; //loads the contents of the plist file into a dictionary
            //the dictionary uses the continents as the keys and a NSArray with the countries for each item
            plistData=dictionary;
            NSArray *temp = [plistData allKeys];
        
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
    
    if ([chosenPlist isEqualToString:@"Line Worths"] || [chosenPlist isEqualToString:@"Trick Bonuses"])
    {
        NSMutableArray* temp = [arrayOfLineWorths objectAtIndex:indexPath.section];
        NSString *tempText = [temp objectAtIndex:indexPath.row];
        cell.textLabel.text = tempText;
        if ([chosenPlist isEqualToString:@"Line Worths"]){cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;}
        
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

/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{


}*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if ([chosenPlist isEqualToString:@"Line Worths"])
    {
        [self performSegueWithIdentifier:@"LoadLineDetail" sender:self];
    }
    else {
        UITableViewCell* theCell = [tableView cellForRowAtIndexPath:indexPath];
        
        //Then you change the properties (label, text, color etc..) in your case, the background color
        theCell.contentView.backgroundColor=[UIColor redColor];
        
        //Deselect the cell so you can see the color change
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}



@end
