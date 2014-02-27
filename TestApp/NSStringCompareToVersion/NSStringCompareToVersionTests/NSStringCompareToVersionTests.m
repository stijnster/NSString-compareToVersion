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
}

-(void)testCompareToVersionDescending{
    [self compareVersion:@"1.12" toVersion:@"1.1" expectedResult:NSOrderedDescending];
    [self compareVersion:@"6.2" toVersion:@"5.4.3.2" expectedResult:NSOrderedDescending];
    [self compareVersion:@"5.4.3.2" toVersion:@"5.0" expectedResult:NSOrderedDescending];
}

-(void)testCompareToVersionSame{
    [self compareVersion:@"1.2.3.123" toVersion:@"1.2.3.123" expectedResult:NSOrderedSame];
    [self compareVersion:@" 1.2.3.123 " toVersion:@"1.2.3.123" expectedResult:NSOrderedSame];
}

-(void)compareVersion:(NSString *)version toVersion:(NSString *)compareVersion expectedResult:(NSComparisonResult)expectedResult{
    NSComparisonResult actualResult = [version compareToVersion:compareVersion];
    
    if(actualResult != expectedResult){
        XCTFail(@"Compared %@ to %@, expected %d but got %d", version, compareVersion, expectedResult, actualResult);
    }
}

@end
