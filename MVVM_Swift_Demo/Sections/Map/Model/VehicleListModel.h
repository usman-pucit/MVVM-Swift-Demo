//
//  VehicleListModel.h
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import <Foundation/Foundation.h>



//Main model class for Vehicle List
@interface VehicleListModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *poiList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
