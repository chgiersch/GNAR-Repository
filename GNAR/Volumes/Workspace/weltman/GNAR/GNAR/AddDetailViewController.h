//
//  AddDetailViewController.h
//  GNAR
//
//  Created by  on 12/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddDetailViewController : UITableViewController
@property (strong, nonatomic) NSArray* detailPointTypes;
@property (strong, nonatomic) NSString* chosenPlist;
@property (strong, nonatomic) NSDictionary* plistData;


//these arrays are used only if it's the TV for line worths
@property (strong, nonatomic) NSMutableArray* arrayOfLineWorths;
@property int lineworthCount;


@end
