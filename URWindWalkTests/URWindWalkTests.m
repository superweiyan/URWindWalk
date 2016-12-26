//
//  URWindWalkTests.m
//  URWindWalkTests
//
//  Created by weiyan on 14/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDateUtil.h"

@interface URWindWalkTests : XCTestCase
{}
@end

@implementation URWindWalkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
//    _dateUtil = [[NSDateUtil alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetDate {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    //NSString *dateString =  [_dateUtil getDateString:[NSDate date]];
    
    NSUInteger a2 = [NSDateUtil getFirstDayOfMonth:[NSDate date]];
    NSUInteger a1 =  4;
    XCTAssertEqual(a1, a2);
    //XCTAssertTrue([a1 isEqualToString:a2], @"a1 and a2 should point to the same object");
//    XCTAssertEqualObjects(a1, a2);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
