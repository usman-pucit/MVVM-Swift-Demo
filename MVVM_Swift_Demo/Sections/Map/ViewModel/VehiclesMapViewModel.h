//
//  VehiclesMapViewModel.h
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VehicleListModel.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

// ViewModel

@interface VehiclesMapViewModel : NSObject

/*!
 * @discussion Call this method to get SW  coordinates.
 * @param mRect as parmater will be passed.
 */

+(CLLocationCoordinate2D)getSWCoordinate:(MKMapRect)mRect;

/*!
 * @discussion Call this method to get NE  coordinates.
 * @param mRect as parmater will be passed.
 */

+(CLLocationCoordinate2D)getNECoordinate:(MKMapRect)mRect;

/*!
 * @discussion Call this method to prepare mapview annotations.
 * @param vehiclesList as parmater will be passed.
 */

+(NSMutableArray*)prepareMapviewAnnoations:(NSArray *)vehiclesList;

/*!
 * @discussion Call this method to get list of vehicles with provided region coordinates.
 * @param mRect as parmater.
 * @param successBlock This block will be invoked on successful service return.
 * @param failureBlock This block will be invoked on failure service return.
 */
    
+ (void)getVehiclesListResquest:(MKMapRect)mRect inSucess:(void (^)(NSArray *responseObject))successBlock failureBlock:(void (^)(NSError *error))failureBlock;
    
@end

NS_ASSUME_NONNULL_END
