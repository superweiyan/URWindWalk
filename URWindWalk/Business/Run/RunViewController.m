//
//  RunViewController.m
//  URWindWalk
//
//  Created by weiyan on 17/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "RunViewController.h"
#import <MapKit/MapKit.h>
#import "URLog.h"
#import "URWWObjectInfo.h"
#import "URMarcoUtil.h"
#import "URWWRunService.h"
#import "URLabel.h"

@interface RunViewController ()<MKMapViewDelegate>

@property (strong, nonatomic) NSMutableArray        *coordinate2DArray;
@property (strong, nonatomic) IBOutlet MKMapView    *mapView;
@property (assign, nonatomic) MKCoordinateSpan      span;
@property (strong, nonatomic) UIButton              *runButton;
@property (strong, nonatomic) URLabel               *distanceLabel;
@end

@implementation RunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    [self initData];
    [self initViews];
    [self initNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.mapView.frame = CGRectMake(self.view.bounds.origin.x,
                                    self.view.bounds.origin.y,
                                    self.view.bounds.size.width,
                                    self.view.bounds.size.height / 2);
    
    self.runButton.frame = CGRectMake(self.view.bounds.origin.x,
                                      CGRectGetMaxY(self.mapView.frame) + 20,
                                      90,
                                      40);
    
    self.distanceLabel.frame = CGRectMake(self.view.bounds.origin.x,
                                          CGRectGetMaxY(self.mapView.frame) + 80,
                                          90,
                                          40);
}

#pragma mark - init

- (void)initData
{
    self.navigationItem.title = @"跑步";
    self.coordinate2DArray = [[NSMutableArray alloc] init];
}

- (void)initViews
{
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    
    self.span = MKCoordinateSpanMake(0.002, 0.002);
    
    [self.view addSubview:self.mapView];
    
    self.runButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.runButton addTarget:self
                       action:@selector(onStartButtonClick)
             forControlEvents:UIControlEventTouchUpInside];
    
    [self.runButton setTitle:@"开始" forState:UIControlStateNormal];
    self.runButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.runButton];
    
    self.distanceLabel = [[URLabel alloc] initWithFrame:CGRectZero];
    self.distanceLabel.textAlignment = NSTextAlignmentCenter;
    self.distanceLabel.text = @(0.0).stringValue;
    [self.view addSubview:self.distanceLabel];
}

- (void)initNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onUpdateRunDistanceNotification:) name:URUpdateRunDistanceNotification object:nil];
}

#pragma mark - MKMapViewDelegate

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [self.mapView setCenterCoordinate:userLocation.coordinate animated:YES];
    
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.coordinate, self.span);
    self.mapView.region = region;
    
    if(![URWWRunService sharedObject].isRunning) {
        return ;
    }
    
    [[URWWRunService sharedObject] updateRunLocation:userLocation.location];

    URWWLocationInfo *locationInfo = [[URWWLocationInfo alloc] init];
    locationInfo.longitude = userLocation.location.coordinate.longitude;
    locationInfo.latitude = userLocation.location.coordinate.latitude;
    [self.coordinate2DArray addObject:locationInfo];
    
    [self drawline:[self.coordinate2DArray copy]];
    
    NSString *locationString = [NSString stringWithFormat:@"%f:%f",
                                locationInfo.longitude,
                                locationInfo.latitude];
    
    URLog(locationString, @"run");
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *ployRenderer = [[MKPolylineRenderer alloc]initWithPolyline:overlay];
    // 设置线段的宽
    ployRenderer.lineWidth = 1;
    // 设置线段的边框颜色
    ployRenderer.strokeColor = [UIColor redColor];
    // 设置填充色
    ployRenderer.fillColor = [UIColor purpleColor];
    
    return ployRenderer;
}

- (void)drawline:(NSArray*)nowRoadArrary
{
    URLog(@"drawline", @"run");
    
    //  将array中的信息点转换成CLLocationCoordinate2D数组
    CLLocationCoordinate2D coords[nowRoadArrary.count];
    
    int i = 0;
    for (URWWLocationInfo *newObj in nowRoadArrary) {
        CLLocationCoordinate2D annotationCoord;
        annotationCoord.latitude = newObj.latitude;
        annotationCoord.longitude = newObj.longitude;
        coords[i] = annotationCoord;
        i++;
    }
    
    //用MKPolyline画线并作为overlay添加进mapView
    MKPolyline *cc = [MKPolyline polylineWithCoordinates:coords count:nowRoadArrary.count];
    [self.mapView addOverlay:cc];
}

- (void)removeOverlay
{
    for (id<MKOverlay> overlayToRemove in self.mapView.overlays)
    {
        if ([overlayToRemove isKindOfClass:[MKPolyline class]])
        {
            [self.mapView removeOverlay:overlayToRemove];
        }
    }
}

#pragma mark - click

- (void)onStartButtonClick
{
    if ([URWWRunService sharedObject].isRunning) {
        [[URWWRunService sharedObject] stopRun];
        [self.runButton setTitle:@"开始" forState:UIControlStateNormal];
        [self.coordinate2DArray removeAllObjects];
    }
    else {
        [self.runButton setTitle:@"结束" forState:UIControlStateNormal];
        [self removeOverlay];
        [[URWWRunService sharedObject] startRun];
        
    }
}

#pragma mark - notification

- (void)onUpdateRunDistanceNotification:(NSNotification *)notification
{
    _distanceLabel.text = [NSString stringWithFormat:@"%.2f", [URWWRunService sharedObject].distance];
}




@end
