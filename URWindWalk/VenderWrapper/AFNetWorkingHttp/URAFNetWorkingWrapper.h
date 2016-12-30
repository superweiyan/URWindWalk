//
//  URAFNetWorkingWrapper.h
//  URWindWalk
//
//  Created by weiyan on 28/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^request_Url_block) (BOOL success, id responseObject);

@interface URAFNetWorkingWrapper : NSObject

+ (NSUInteger)requetURLWithParamForGet:url
                           param:(NSDictionary *)dict
                        callback:(request_Url_block)callback;

@end
