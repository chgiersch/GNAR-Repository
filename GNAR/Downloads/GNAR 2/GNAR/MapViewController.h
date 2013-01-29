//
//  MapViewController.h
//  GNAR
//
//  Created by  on 12/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property int didViewDidLoad;
- (void)stopUpdatingLocation:(NSString *)state;
- (void)displayMap;
- (void)reset;
- (void) changeMapType: (id)sender : (int)bit;



@end
