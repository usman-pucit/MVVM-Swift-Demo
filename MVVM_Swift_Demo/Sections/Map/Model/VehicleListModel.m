//
//  VehicleListModel.m
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import "VehicleListModel.h"
#import "PoiList.h"


NSString *const kBaseClassPoiList = @"poiList";


@interface VehicleListModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VehicleListModel

@synthesize poiList = _poiList;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedPoiList = [dict objectForKey:kBaseClassPoiList];
    NSMutableArray *parsedPoiList = [NSMutableArray array];
    
    if ([receivedPoiList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPoiList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPoiList addObject:[PoiList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPoiList isKindOfClass:[NSDictionary class]]) {
       [parsedPoiList addObject:[PoiList modelObjectWithDictionary:(NSDictionary *)receivedPoiList]];
    }

    self.poiList = [NSArray arrayWithArray:parsedPoiList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForPoiList = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.poiList) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            [tempArrayForPoiList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            [tempArrayForPoiList addObject:subArrayObject];
        }
    }
    
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPoiList] forKey:kBaseClassPoiList];

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

    self.poiList = [aDecoder decodeObjectForKey:kBaseClassPoiList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_poiList forKey:kBaseClassPoiList];
}

- (id)copyWithZone:(NSZone *)zone {
    VehicleListModel *copy = [[VehicleListModel alloc] init];
    if (copy) {
        copy.poiList = [self.poiList copyWithZone:zone];
    }
    return copy;
}


@end
