//
//  Networking.h
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


//Networking class

@interface Networking : NSObject<NSURLSessionDataDelegate>

/*!
 * @brief Network GET request method with AFNetworking
 * @param path as URL will be passed as param
 * @param successBlock block for success call return api response
 * @param failureBlock block for failure case return network failure error
 */

+(void )getRequestWithRequestBody:(NSString *)path
                              completeionBlock:(void (^)( NSHTTPURLResponse *response))successBlock
                              failureBlock:(void (^)(NSError *error ))failureBlock;
    
@end

NS_ASSUME_NONNULL_END
