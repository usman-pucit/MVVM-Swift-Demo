//
//  VehiclesMapController.m
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import "VehiclesMapController.h"
#import "VehiclesMapViewModel.h"

// MARK : - ViewController Interface

@interface VehiclesMapController ()
{
    NSArray *vehiclesList;
}

@end

// MARK : - ViewController Implementation

@implementation VehiclesMapController

// View controller life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAppearance];
    [self fetchVehiclesListResponse:_mapView];
}

/*!
 @brief Method to setup UI on start
*/

-(void)setupAppearance
{
    _mapView.delegate = self;
    self.title = @"Map View";
    
    [_spinner setSize:50.0f];
    _spinner.type = DGActivityIndicatorAnimationTypeBallClipRotateMultiple;
    _spinner.tintColor = [[UIColor colorNamed:@"AppRed"] colorWithAlphaComponent:1.0];
}

/*!
* @brief Method to fetch vehicles list with web service call and update mapview
* @param mapView as a parameter will be passed
* @discussion call this method to get list of vehicles with mapview bounds and update the mapview with map position change
*/

-(void) fetchVehiclesListResponse:(MKMapView *)mapView
{
    [self showLoader];
    
    [VehiclesMapViewModel getVehiclesListResquest:mapView.visibleMapRect inSucess:^(NSArray * _Nonnull responseObject) {
    
            [self setMapViewAnnotations:responseObject];
            [self hideLoader];
        
    } failureBlock:^(NSError * _Nonnull error) {
        
        [self hideLoader];
    }];
}

/*!
 * @brief Method to show annotations on mapView fetched from web service
 * @param annotations array as a parameter will be passed
 * @discussion annoations fetched from web service will be presented on mapview
 */

-(void)setMapViewAnnotations:(NSArray *)annotations
{
     [_mapView removeAnnotations:[_mapView annotations]];
     [_mapView addAnnotations:annotations];
}

/*!
 * @brief Method to show loader while web service is called
 */

-(void)showLoader
{
    [_spinner startAnimating];
}

/*!
 * @brief Method to hide loader on callback from web service
 */

-(void)hideLoader
{
    [_spinner stopAnimating];
}

#pragma mark - MKMapViewDelegate

/*!
 * @brief delegate method of MKMapView called after mapview position change
 * @discussion this method is called on mapview position change and call web service method to fetch new annotations for updated mapview bounds
 */

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
     [self fetchVehiclesListResponse:mapView];
}

/*!
 * @brief delegate method to setup annotation view visible on map
 * @discussion this method is called to make custom annotation view shows on mapview
 */

- (MKAnnotationView *)mapView:(MKMapView *)sender viewForAnnotation:(id < MKAnnotation >)annotation
{
    static NSString *reuseId = @"annotationPin";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[sender
                                                   dequeueReusableAnnotationViewWithIdentifier:reuseId];
    
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseId];
    }
    annotationView.image = [UIImage imageNamed : @"annotation"];
    annotationView.annotation = annotation;
    
    return annotationView;
}


@end
