//
//  PoiList.h
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Coordinate;

@interface PoiList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double poiListIdentifier;
@property (nonatomic, strong) Coordinate *coordinate;
@property (nonatomic, strong) NSString *fleetType;
@property (nonatomic, assign) double heading;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
