//
//  Networking.m
//  FreeNowAssignment
//
//  Created by Malik Usman on 16/08/2019.
//  Copyright © 2019 usmanSystems. All rights reserved.
//

#import "Networking.h"
#import "AFNetworking.h"

// Network class

@implementation Networking

/*!
 * @brief method to check interner availability
 */

+ (BOOL)checkInternet{
    
    BOOL returnBool = YES;
        
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com"]];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:NULL];
    if (data == nil) {
        returnBool = NO;
    }
        
    return returnBool;
}

/*!
 * @brief Network GET request method with AFNetworking 
 * @param path as URL will be passed as param
 * @param successBlock block for success call return api response
 * @param failureBlock block for failure case return network failure error
 */

+(void )getRequestWithRequestBody:(NSString *)path
                completeionBlock:(void (^)( NSHTTPURLResponse *response2))successBlock
                    failureBlock:(void (^)(NSError *error ))failureBlock{
   
    if ([self checkInternet]) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:path parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            successBlock(responseObject);
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            failureBlock(error);
        }];
    }else{
        failureBlock([NSError errorWithDomain:@"" code:0000 userInfo:@{ @"Error" : @"Network not available"}]);
    }
   
    
}

    
@end
