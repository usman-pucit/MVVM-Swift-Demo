//
//  Coordinate.h
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Coordinate : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double longitude;
@property (nonatomic, assign) double latitude;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
