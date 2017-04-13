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

-(void)testMainVersionExtraction{
    if(![[@"1.2.3.4" getMainVersionWithIntegerCount:1] isEqualToString:@"1"]){
        XCTFail(@"Failed to extract main version, should be 1 %s", __PRETTY_FUNCTION__);
    }
    if(![[@"1.2.3.4" getMainVersionWithIntegerCount:2] isEqualToString:@"1.2"]){
        XCTFail(@"Failed to extract main version, should be 1.2 %s", __PRETTY_FUNCTION__);
    }
    if(![[@"1.2.3.4" getMainVersionWithIntegerCount:3] isEqualToString:@"1.2.3"]){
        XCTFail(@"Failed to extract main version, should be 1.2.3 %s", __PRETTY_FUNCTION__);
    }
    if(![[@"1.2.3.4" getMainVersionWithIntegerCount:4] isEqualToString:@"1.2.3.4"]){
        XCTFail(@"Failed to extract main version, should be 1.2.3.4 %s", __PRETTY_FUNCTION__);
    }
    
    if([@"1.2.3.4" getMainVersionWithIntegerCount:0] != NULL){
        XCTFail(@"Extract main version should be null when the base version is 0 %s", __PRETTY_FUNCTION__);
    }
    
    if([@"1.2.3.4" getMainVersionWithIntegerCount:5] != NULL){
        XCTFail(@"Extract main version should be null when the base version has more components then the actual version number %s", __PRETTY_FUNCTION__);
    }
    
    if(![[@"1.2.3.4" getMainVersionWithIntegerCount:1] isEqualToString:@"1"]){
        XCTFail(@"One of the examples in the readme fails! %s", __PRETTY_FUNCTION__);
    };
    if(![[@"1.2.3.4" getMainVersionWithIntegerCount:2] isEqualToString:@"1.2"]){
        XCTFail(@"One of the examples in the readme fails! %s", __PRETTY_FUNCTION__);
    };
}

-(void)testNeedsToUpdateToVersion{
    NSString *currentVersion = @"0.2.1";
    NSString *newVersionInSameMainVersion = @"0.2.2";
    NSString *newVersionInNewMainVersion = @"0.3";

    if([currentVersion needsToUpdateToVersion:newVersionInSameMainVersion mainVersionIntegerCount:2] == NO){
        XCTFail(@"Current version %@ should update to %@ when main version is made up by first 2 components %s", currentVersion, newVersionInSameMainVersion, __PRETTY_FUNCTION__);
    }

    if([currentVersion needsToUpdateToVersion:newVersionInNewMainVersion mainVersionIntegerCount:2] == YES){
        XCTFail(@"Current version %@ should NOT update to %@ when main version is made up by first 2 components %s", currentVersion, newVersionInNewMainVersion, __PRETTY_FUNCTION__);
    }
    
    if([currentVersion needsToUpdateToVersion:newVersionInSameMainVersion mainVersionIntegerCount:1] == NO){
        XCTFail(@"Current version %@ should update to %@ when main version is made up by first component %s", currentVersion, newVersionInSameMainVersion, __PRETTY_FUNCTION__);
    }

    if([currentVersion needsToUpdateToVersion:newVersionInNewMainVersion mainVersionIntegerCount:1] == NO){
        XCTFail(@"Current version %@ should update to %@ when main version is made up by first component %s", currentVersion, newVersionInSameMainVersion, __PRETTY_FUNCTION__);
    }
    
    if([@"1.2.3.4" needsToUpdateToVersion:@"1.2.4" mainVersionIntegerCount: 2] == NO){
       XCTFail(@"One of the examples in the readme fails! %s", __PRETTY_FUNCTION__);
    }
    if([@"1.2.3.4" needsToUpdateToVersion:@"1.3.6" mainVersionIntegerCount: 2] == YES){
       XCTFail(@"One of the examples in the readme fails! %s", __PRETTY_FUNCTION__);
    }
}

-(void)compareVersion:(NSString *)version toVersion:(NSString *)compareVersion expectedResult:(NSComparisonResult)expectedResult{
    NSComparisonResult actualResult = [version compareToVersion:compareVersion];
    
    if(actualResult != expectedResult){
        XCTFail(@"Compared %@ to %@, expected %ld but got %ld", version, compareVersion, expectedResult, actualResult);
    }
}

@end
