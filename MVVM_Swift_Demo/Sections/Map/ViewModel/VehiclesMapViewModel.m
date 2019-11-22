//
//  VehiclesMapViewModel.m
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import "VehiclesMapViewModel.h"
#import "VehicleListModel.h"
#import "PoiList.h"
#import "Coordinate.h"
#import "Networking.h"

// ViewModel Implementation
@implementation VehiclesMapViewModel

/*!
 * @brief Call this method to get NE  coordinates.
 * @param mRect as parmater will be passed.
 */

+(CLLocationCoordinate2D)getNECoordinate:(MKMapRect)mRect{
    return [self getCoordinateFromMapRectanglePoint:MKMapRectGetMaxX(mRect) y:mRect.origin.y];
}

/*!
 * @brief Call this method to get SW  coordinates.
 * @param mRect as parmater will be passed.
 */

+(CLLocationCoordinate2D)getSWCoordinate:(MKMapRect)mRect{
    return [self getCoordinateFromMapRectanglePoint:mRect.origin.x y:MKMapRectGetMaxY(mRect)];
}
    
+(CLLocationCoordinate2D)getCoordinateFromMapRectanglePoint:(double)x y:(double)y{
    MKMapPoint swMapPoint = MKMapPointMake(x, y);
    return MKCoordinateForMapPoint(swMapPoint);
}

/*!
 * @brief Call this method to get list of vehicles with provided region coordinates.
 * @param mRect as parmater.
 * @param successBlock This block will be invoked on successful service return.
 * @param failureBlock This block will be invoked on failure service return.
 */

+ (void)getVehiclesListResquest:(MKMapRect)mRect inSucess:(void (^)(NSArray *responseObject))successBlock failureBlock:(void (^)(NSError *error))failureBlock {
    
    CLLocationCoordinate2D bottomLeft = [self getSWCoordinate:mRect];
    CLLocationCoordinate2D topRight = [self getNECoordinate:mRect];
    
    NSBundle* mainBundle = [NSBundle mainBundle];
    NSString *rootURL = [mainBundle objectForInfoDictionaryKey:@"ROOT_URL"];
    NSString *url = [NSString stringWithFormat:@"%@?p1Lat=%f&p1Lon=%f&p2Lat=%f&p2Lon=%f",rootURL,bottomLeft.latitude,bottomLeft.longitude,topRight.latitude,topRight.longitude];
    
    [Networking getRequestWithRequestBody:url completeionBlock:^(NSHTTPURLResponse * _Nonnull response) {
        
        if ([response isKindOfClass:[NSDictionary class]]) {
            VehicleListModel * model = [VehicleListModel modelObjectWithDictionary:(NSDictionary*)response];
            NSArray *array = [[self prepareMapviewAnnoations:model.poiList] copy];
            successBlock(array);
        }
        else {
            failureBlock([NSError errorWithDomain:@"" code:0001 userInfo:@{@"Response Error": @"JSON response is not readible"}]);
        }
        
    } failureBlock:^(NSError * _Nonnull error) {
        failureBlock([NSError errorWithDomain:@"" code:0001 userInfo:@{@"Response Error": error.localizedDescription}]);
    }];
    
}

/*!
 * @brief Call this method to prepare mapview annotations.
 * @param vehiclesList as parmater will be passed.
 */

+(NSMutableArray*)prepareMapviewAnnoations:(NSArray *)vehiclesList
{
    NSMutableArray *annotationArray = [NSMutableArray new];
    
    for (int i=0; i<[vehiclesList count]; i++) {
        MKPointAnnotation* annotation= [MKPointAnnotation new];
        PoiList *poiList = vehiclesList[i];
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([poiList.coordinate latitude], [poiList.coordinate longitude]);
        annotation.coordinate= coordinate;
        [annotationArray addObject:annotation];
    }
    
    return annotationArray;
}


@end
