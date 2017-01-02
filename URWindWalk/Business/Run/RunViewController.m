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

@interface RunViewController ()<MKMapViewDelegate>

@property (strong, nonatomic) NSMutableArray        *coordinate2DArray;
@property (strong, nonatomic) IBOutlet MKMapView    *mapView;
@property (assign, nonatomic) NSUInteger            count;

@end

@implementation RunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"跑步";
    
    self.coordinate2DArray = [[NSMutableArray alloc] init];
    [self initViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[URLog sharedObject] logInfo:@"enter run viewController" model:@"run" funName:nil];
}

- (void)initViews
{
    self.count = 0;
    
    self.mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
//    self.mapView.zoomEnabled = NO;
    [self.view addSubview:self.mapView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mapView.frame = self.view.bounds;
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [self.mapView setCenterCoordinate:userLocation.coordinate animated:YES];
    
     [[URLog sharedObject] logInfo:@"update run coordinate" model:@"run" funName:nil];
    
    self.count += 1;
    URWWLocationInfo *locationInfo = [[URWWLocationInfo alloc] init];
    locationInfo.longitude = userLocation.location.coordinate.longitude;
    locationInfo.latitude = userLocation.location.coordinate.latitude;
    [self.coordinate2DArray addObject:locationInfo];
    
    if (self.count == 3) {
        [self drawline:[self.coordinate2DArray copy]];
        self.count = 0;
        [self.coordinate2DArray removeAllObjects];
    }
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    MKPolylineRenderer *ployRenderer = [[MKPolylineRenderer alloc]initWithPolyline:overlay];
    // 设置线段的宽
    ployRenderer.lineWidth = 2;
    // 设置线段的边框颜色
    ployRenderer.strokeColor = [UIColor redColor];
    // 设置填充色
    ployRenderer.fillColor = [UIColor purpleColor];
    
    return ployRenderer;
}

- (void)drawline:(NSArray*)nowRoadArrary
{
     [[URLog sharedObject] logInfo:@"drawline" model:@"run" funName:nil];
    
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

@end
