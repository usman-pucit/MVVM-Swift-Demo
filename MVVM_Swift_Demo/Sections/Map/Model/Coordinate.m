//
//  Coordinate.m
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import "Coordinate.h"


NSString *const kCoordinateLongitude = @"longitude";
NSString *const kCoordinateLatitude = @"latitude";


@interface Coordinate ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Coordinate

@synthesize longitude = _longitude;
@synthesize latitude = _latitude;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.longitude = [[self objectOrNilForKey:kCoordinateLongitude fromDictionary:dict] doubleValue];
            self.latitude = [[self objectOrNilForKey:kCoordinateLatitude fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.longitude] forKey:kCoordinateLongitude];
    [mutableDict setValue:[NSNumber numberWithDouble:self.latitude] forKey:kCoordinateLatitude];

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

    self.longitude = [aDecoder decodeDoubleForKey:kCoordinateLongitude];
    self.latitude = [aDecoder decodeDoubleForKey:kCoordinateLatitude];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeDouble:_longitude forKey:kCoordinateLongitude];
    [aCoder encodeDouble:_latitude forKey:kCoordinateLatitude];
}

- (id)copyWithZone:(NSZone *)zone {
    Coordinate *copy = [[Coordinate alloc] init];
    
    if (copy) {
        copy.longitude = self.longitude;
        copy.latitude = self.latitude;
    }
    
    return copy;
}


@end
