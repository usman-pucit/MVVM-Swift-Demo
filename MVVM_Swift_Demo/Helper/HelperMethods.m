//
//  HelperMethods.m
//  FreeNowAssignment
//
//  Created by Malik Usman on 24/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import "HelperMethods.h"

/*!
 @brief method to read Mock Json file
 */

@implementation HelperMethods

/*!
 @brief method to read Mock Json file
 */


+ (NSDictionary *)JSONFromFile
{
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"Mock" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return  [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
