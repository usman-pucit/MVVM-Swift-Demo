//
//  HelperMethods.h
//  FreeNowAssignment
//
//  Created by Malik Usman on 24/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 @brief Helper class with helper functions to use in all over the project
 */

@interface HelperMethods : NSObject

/*!
 @brief method to read Mock Json file
 */

+ (NSDictionary *)JSONFromFile;

@end

NS_ASSUME_NONNULL_END
