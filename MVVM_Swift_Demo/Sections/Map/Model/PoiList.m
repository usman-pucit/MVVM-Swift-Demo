//
//  PoiList.m
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import "PoiList.h"
#import "Coordinate.h"


NSString *const kPoiListId = @"id";
NSString *const kPoiListCoordinate = @"coordinate";
NSString *const kPoiListFleetType = @"fleetType";
NSString *const kPoiListHeading = @"heading";


@interface PoiList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PoiList

@synthesize poiListIdentifier = _poiListIdentifier;
@synthesize coordinate = _coordinate;
@synthesize fleetType = _fleetType;
@synthesize heading = _heading;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.poiListIdentifier = [[self objectOrNilForKey:kPoiListId fromDictionary:dict] doubleValue];
            self.coordinate = [Coordinate modelObjectWithDictionary:[dict objectForKey:kPoiListCoordinate]];
            self.fleetType = [self objectOrNilForKey:kPoiListFleetType fromDictionary:dict];
            self.heading = [[self objectOrNilForKey:kPoiListHeading fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.poiListIdentifier] forKey:kPoiListId];
    [mutableDict setValue:[self.coordinate dictionaryRepresentation] forKey:kPoiListCoordinate];
    [mutableDict setValue:self.fleetType forKey:kPoiListFleetType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.heading] forKey:kPoiListHeading];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.poiListIdentifier = [aDecoder decodeDoubleForKey:kPoiListId];
    self.coordinate = [aDecoder decodeObjectForKey:kPoiListCoordinate];
    self.fleetType = [aDecoder decodeObjectForKey:kPoiListFleetType];
    self.heading = [aDecoder decodeDoubleForKey:kPoiListHeading];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_poiListIdentifier forKey:kPoiListId];
    [aCoder encodeObject:_coordinate forKey:kPoiListCoordinate];
    [aCoder encodeObject:_fleetType forKey:kPoiListFleetType];
    [aCoder encodeDouble:_heading forKey:kPoiListHeading];
}

- (id)copyWithZone:(NSZone *)zone {
    PoiList *copy = [[PoiList alloc] init];
    
    
    
    if (copy) {

        copy.poiListIdentifier = self.poiListIdentifier;
        copy.coordinate = [self.coordinate copyWithZone:zone];
        copy.fleetType = [self.fleetType copyWithZone:zone];
        copy.heading = self.heading;
    }
    
    return copy;
}


@end
