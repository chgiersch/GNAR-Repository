//
//  MADFirstViewController.h
//  GNAR
//
//  Created by  on 12/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabController.h"
#import "GnarScore.h"


@interface MADFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *gnarFactorLabel;
@property int totalScore;

-(void)calcScore;

@end
