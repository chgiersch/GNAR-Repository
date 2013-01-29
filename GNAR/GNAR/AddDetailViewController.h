//
//  AddDetailViewController.h
//  GNAR
//
//  Created by  on 12/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECPDetailViewController.h"
#import "LinesDetailViewController.h"


@interface AddDetailViewController : UITableViewController
@property (strong, nonatomic) NSArray* detailPointTypes;
@property (strong, nonatomic) NSString* chosenPlist;
@property (strong, nonatomic) NSDictionary* plistData;
@property (strong, nonatomic) NSMutableDictionary* pointsDictionary;
@property (strong, nonatomic) NSString* currentItem;
@property int trickPointsToSend;
@property (strong, nonatomic) NSMutableArray* arrayOfDictionaries;


//these arrays are used only if it's the TV for line worths
@property (strong, nonatomic) NSMutableArray* arrayOfLineWorths;
@property int lineworthCount;


@end
