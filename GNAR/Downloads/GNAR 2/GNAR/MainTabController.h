//
//  MainTabController.h
//  GNAR
//
//  Created by  on 12/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface MainTabController : UITabBarController
@property (strong, nonatomic) Game* myGame;
@end
