//
//  URSocketService+Login.h
//  URWindWalk
//
//  Created by weiyan on 19/02/2017.
//  Copyright © 2017 weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URSocketService.h"
#import "Urprotocol.pbobjc.h"

@interface URSocketService(Login)

- (void)parseLoginResProtocol:(URProtocol *)protocol;

@end
