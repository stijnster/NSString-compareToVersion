//
//  NSString+CompateToVersionTest.m
//  NSStringCompareToVersion
//
//  Created by Stijn Mathysen on 27/02/14.
//  Copyright (c) 2014 Skylight. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+CompareToVersion.h"

@interface NSString_CompateToVersionTest : XCTestCase

@end

@implementation NSString_CompateToVersionTest

-(void)setUp{
    [super setUp];
}

- (void)tearDown{
    [super tearDown];
}

-(void)testCompareToVersionAscending{
    [self compareVersion:@"1" toVersion:@"1.1" expectedResult:NSOrderedAscending];
    [self compareVersion:@"1.1" toVersion:@"1.2" expectedResult:NSOrderedAscending];
    [self compareVersion:@"6.4" toVersion:@"6.4.1" expectedResult:NSOrderedAscending];
    [self compareVersion:@"1.2" toVersion:@"1.2.1" expectedResult:NSOrderedAscending];
    [self compareVersion:@"1.2" toVersion:@"1.2.0.1" expectedResult:NSOrderedAscending];
    [self compareVersion:@"1.2.0" toVersion:@"1.2.0.1" expectedResult:NSOrderedAscending];
    [self compareVersion:@"1.2.0.0" toVersion:@"1.2.0.1" expectedResult:NSOrderedAscending];
    [self compareVersion:@"1.2.0.0.0" toVersion:@"1.2.0.1" expectedResult:NSOrderedAscending];
}

-(void)testCompareToVersionDescending{
    [self compareVersion:@"1.12" toVersion:@"1.1" expectedResult:NSOrderedDescending];
    [self compareVersion:@"6.2" toVersion:@"5.4.3.2" expectedResult:NSOrderedDescending];
    [self compareVersion:@"5.4.3.2" toVersion:@"5.0" expectedResult:NSOrderedDescending];
    [self compareVersion:@"1.2.1" toVersion:@"1.2.0.0" expectedResult:NSOrderedDescending];
    [self compareVersion:@"1.2.1" toVersion:@"1.2" expectedResult:NSOrderedDescending];
    [self compareVersion:@"1.2.0.1" toVersion:@"1.2" expectedResult:NSOrderedDescending];
}

-(void)testCompareToVersionSame{
    [self compareVersion:@"1.2.3.123" toVersion:@"1.2.3.123" expectedResult:NSOrderedSame];
    [self compareVersion:@"1.2.3.123 " toVersion:@"1.2.3.123" expectedResult:NSOrderedSame];
    [self compareVersion:@"1.2.0 " toVersion:@"1.2" expectedResult:NSOrderedSame];
    [self compareVersion:@"1.2" toVersion:@"1.2.0" expectedResult:NSOrderedSame];
    [self compareVersion:@"1.2.0.0" toVersion:@"1.2.0" expectedResult:NSOrderedSame];
    [self compareVersion:@"1.2.0.0" toVersion:@"1.2" expectedResult:NSOrderedSame];
    [self compareVersion:@"1.2" toVersion:@"1.2.0.0" expectedResult:NSOrderedSame];
    [self compareVersion:@"1.2.0" toVersion:@"1.2.0.0" expectedResult:NSOrderedSame];
}

-(void)testIsOlderThen{
    if(![@"1.0" isOlderThanVersion:@"2.0"]){
        XCTFail(@"Failed 1.0 %s 2.0", __PRETTY_FUNCTION__);
    }
    if([@"1.0" isOlderThanVersion:@"1.0"]){
        XCTFail(@"Failed 1.0 %s 1.0", __PRETTY_FUNCTION__);
    }
    if([@"2.0" isOlderThanVersion:@"1.0"]){
        XCTFail(@"Failed 2.0 %s 1.0", __PRETTY_FUNCTION__);
    }
}

-(void)testIsNewerThen{
    if([@"1.0" isNewerThanVersion:@"2.0"]){
        XCTFail(@"Failed 1.0 %s 2.0", __PRETTY_FUNCTION__);
    }
    if([@"1.0" isNewerThanVersion:@"1.0"]){
        XCTFail(@"Failed 1.0 %s 1.0", __PRETTY_FUNCTION__);
    }
    if(![@"2.0" isNewerThanVersion:@"1.0"]){
        XCTFail(@"Failed 2.0 %s 1.0", __PRETTY_FUNCTION__);
    }
}

-(void)testIsEqualTo{
    if([@"1.0" isEqualToVersion:@"2.0"]){
        XCTFail(@"Failed 1.0 %s 2.0", __PRETTY_FUNCTION__);
    }
    if(![@"1.0" isEqualToVersion:@"1.0"]){
        XCTFail(@"Failed 1.0 %s 1.0", __PRETTY_FUNCTION__);
    }
    if([@"2.0" isEqualToVersion:@"1.0"]){
        XCTFail(@"Failed 2.0 %s 1.0", __PRETTY_FUNCTION__);
    }
    if(![@"1.2.0" isEqualToVersion:@"1.2"]){
        XCTFail(@"Failed 1.2.0 %s 1.2", __PRETTY_FUNCTION__);
    }
    if(![@"1.2" isEqualToVersion:@"1.2.0"]){
        XCTFail(@"Failed 1.2 %s 1.2.0", __PRETTY_FUNCTION__);
    }
    if(![@"1.2.0.0" isEqualToVersion:@"1.2"]){
        XCTFail(@"Failed 1.2.0.0 %s 1.2", __PRETTY_FUNCTION__);
    }
    if(![@"1.2" isEqualToVersion:@"1.2.0.0"]){
        XCTFail(@"Failed 1.2 %s 1.2.0.0", __PRETTY_FUNCTION__);
    }
    if(![@"1.2.2" isEqualToVersion:@"1.2.2.0"]){
        XCTFail(@"Failed 1.2.0.0 %s 1.2", __PRETTY_FUNCTION__);
    }
    if(![@"1.2.2.0" isEqualToVersion:@"1.2.2"]){
        XCTFail(@"Failed 1.2 %s 1.2.0.0", __PRETTY_FUNCTION__);
    }
}

-(void)testIsEqualOrOlderThen{
    if(![@"1.0" isEqualOrOlderThanVersion:@"2.0"]){
        XCTFail(@"Failed 1.0 %s 2.0", __PRETTY_FUNCTION__);
    }
    if(![@"1.0" isEqualOrOlderThanVersion:@"1.0"]){
        XCTFail(@"Failed 1.0 %s 1.0", __PRETTY_FUNCTION__);
    }
    if([@"2.0" isEqualOrOlderThanVersion:@"1.0"]){
        XCTFail(@"Failed 2.0 %s 1.0", __PRETTY_FUNCTION__);
    }
}

-(void)testIsEqualOrNewerThen{
    if([@"1.0" isEqualOrNewerThanVersion:@"2.0"]){
        XCTFail(@"Failed 1.0 %s 2.0", __PRETTY_FUNCTION__);
    }
    if(![@"1.0" isEqualOrNewerThanVersion:@"1.0"]){
        XCTFail(@"Failed 1.0 %s 1.0", __PRETTY_FUNCTION__);
    }
    if(![@"2.0" isEqualOrNewerThanVersion:@"1.0"]){
        XCTFail(@"Failed 2.0 %s 1.0", __PRETTY_FUNCTION__);
    }
}


-(void)compareVersion:(NSString *)version toVersion:(NSString *)compareVersion expectedResult:(NSComparisonResult)expectedResult{
    NSComparisonResult actualResult = [version compareToVersion:compareVersion];
    
    if(actualResult != expectedResult){
        XCTFail(@"Compared %@ to %@, expected %ld but got %ld", version, compareVersion, expectedResult, actualResult);
    }
}

@end
