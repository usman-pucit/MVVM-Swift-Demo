//
//  VehiclesMapController.h
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DGActivityIndicatorView.h"

NS_ASSUME_NONNULL_BEGIN

/// MARK : - ViewController
/// Vehicles mapview controller
/// Conformation of MKMapView Delegates

@interface VehiclesMapController : UIViewController<MKMapViewDelegate>

// MARK : - IBOutlets

    @property (weak, nonatomic) IBOutlet MKMapView *mapView;
    @property (weak, nonatomic) IBOutlet DGActivityIndicatorView *spinner;
    
@end

NS_ASSUME_NONNULL_END
