//
//  URAFNetWorkingWrapper.m
//  URWindWalk
//
//  Created by weiyan on 28/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URAFNetWorkingWrapper.h"
#import <AFNetworking/AFNetworking.h>

/*
{
    results =     (
                   {
                       "last_update" = "2016-12-28T14:05:00+08:00";
                       location =             {
                           country = CN;
                           id = WS0E9D8WN298;
                           name = "\U5e7f\U5dde";
                           path = "\U5e7f\U5dde,\U5e7f\U5dde,\U5e7f\U4e1c,\U4e2d\U56fd";
                           timezone = "Asia/Shanghai";
                           "timezone_offset" = "+08:00";
                       };
                       now =             {
                           code = 0;
                           temperature = 15;
                           text = "\U6674";
                       };
                   }
                   );
}
 */

@implementation URAFNetWorkingWrapper

+ (NSUInteger)requetURLWithParamForGet:url
                                 param:(NSDictionary *)dict
                              callback:(request_Url_block)callback
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15.0;
    
    NSURLSessionDataTask *task = [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        }
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (callback) {
                callback(YES, responseObject);
            }
        }
     
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull   error) {
            if (callback) {
                callback(NO, error);
            }
        }];
    
    return task.taskIdentifier;
}

@end
