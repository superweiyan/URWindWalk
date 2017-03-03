//
//  URBlock.h
//  URWindWalk
//
//  Created by weiyan on 02/03/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class URProtocol;

typedef void(^timeout_block) ();
typedef void(^onRawDataArrived_block) (URProtocol*);
typedef void(^onDataCallback_block)();
