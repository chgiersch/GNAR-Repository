//
//  AddViewController.h
//  GNAR
//
//  Created by  on 12/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddDetailViewController.h"

@interface AddViewController : UITableViewController
@property NSMutableArray* pointTypes;
@property NSString* chosenType;
@property AddDetailViewController *addDetailViewController;

@end
