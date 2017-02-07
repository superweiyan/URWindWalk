//
//  URDefine.m
//  URWindWalk
//
//  Created by weiyan on 28/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "URDefine.h"


@implementation URDefine

+ (int32_t)protocolVersion
{
    static uint32_t protocolVersion = 0;
    
    if (protocolVersion == 0) {
        NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
        NSString *appVersion =  infoDic[@"CFBundleShortVersionString"];
        NSArray *components = [appVersion componentsSeparatedByString:@"."];
        NSMutableString *combinedString = [NSMutableString new];
        
        for (int i = 0; i < components.count; i++) {
            NSString *version = components[i];
            
            if (version.length == 1) {
                [combinedString appendString:[NSString stringWithFormat:@"%@%@",@"0",version]];
            } else if (version.length >= 2) {
                NSString *subVersion = [version substringWithRange:NSMakeRange(0, 2)];
                [combinedString appendString:subVersion];
            } else {
                [combinedString appendString:@"00"];
            }
        }
        
        protocolVersion = [combinedString intValue];
    }
    
    return protocolVersion;
}


@end
