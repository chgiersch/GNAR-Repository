//
//  MapViewController.m
//  GNAR
//
//  Created by  on 12/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;
@synthesize toolBar, didViewDidLoad;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mapView.mapType = MKMapTypeHybrid;
    UIBarButtonItem *typeButton = [[UIBarButtonItem alloc]initWithTitle: @"Toggle Views" style:UIBarButtonItemStyleBordered target: self action:@selector(changeMapType:)];
    UIBarButtonItem *typeButton4 = [[UIBarButtonItem alloc]initWithTitle: @"Find Me!" style:UIBarButtonItemStyleBordered target: self action:@selector(snapToMe:)];
    NSArray *buttons = [[NSArray alloc] initWithObjects:typeButton, typeButton4, nil];
    toolBar.items = buttons;
    mapView.delegate = self;
    mapView.showsUserLocation = NO;
    didViewDidLoad = 0;
    mapView.showsUserLocation = YES;
   
}

- (void)mapView:(MKMapView *)mapView2 didUpdateUserLocation:(MKUserLocation *)userLocation
{
    if(didViewDidLoad != 1)
    {
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([userLocation coordinate], 200, 200);
        [mapView setRegion:region animated:YES];
        didViewDidLoad = 1;
    }
    
}

- (void) changeMapType: (id)sender
{
    if(mapView.mapType == MKMapTypeSatellite)
        mapView.mapType = MKMapTypeHybrid;
    else if(mapView.mapType == MKMapTypeHybrid)
        mapView.mapType = MKMapTypeStandard;
    else
        mapView.mapType = MKMapTypeSatellite;
}


-(void) snapToMe: (id)sender
{
    mapView.showsUserLocation = NO;
    didViewDidLoad = 0;
    mapView.showsUserLocation = YES;
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [self setToolBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
