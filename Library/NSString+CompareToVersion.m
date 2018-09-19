//
//  NSString+CompareToVersion.m
//  Skylight BVBA
//
//  Created by Stijn Mathysen on 27/02/14.
//  Copyright (c) 2014 Stijn Mathysen. Released under the MIT license
//

#import "NSString+CompareToVersion.h"

static NSString *versionSeparator = @".";

@implementation NSString (CompareToVersion)

- (NSComparisonResult)compareToVersion:(NSString *)version {
    if ([self isEqualToString:version])
        return NSOrderedSame;
    
    NSArray *thisVersion = [self componentsSeparatedByString:versionSeparator];
    NSArray *compareVersion = [version componentsSeparatedByString:versionSeparator];
    
    NSInteger maxCount = MAX([thisVersion count], [compareVersion count]);
    
    for (NSInteger index = 0; index < maxCount; index++) {
        NSInteger thisSegment = (index < [thisVersion count]) ? [[thisVersion objectAtIndex:index] integerValue] : 0;
        NSInteger compareSegment = (index < [compareVersion count]) ? [[compareVersion objectAtIndex:index] integerValue] : 0;
        
        if (thisSegment < compareSegment) {
            return NSOrderedAscending;
        }
        
        if (thisSegment > compareSegment) {
            return NSOrderedDescending;
        }
    }
    
    return NSOrderedSame;
}


- (BOOL)isOlderThanVersion:(NSString *)version {
    return ([self compareToVersion:version] == NSOrderedAscending);
}

- (BOOL)isNewerThanVersion:(NSString *)version {
    return ([self compareToVersion:version] == NSOrderedDescending);
}

- (BOOL)isEqualToVersion:(NSString *)version {
    return ([self compareToVersion:version] == NSOrderedSame);
}

- (BOOL)isEqualOrOlderThanVersion:(NSString *)version {
    return ([self compareToVersion:version] != NSOrderedDescending);
}

- (BOOL)isEqualOrNewerThanVersion:(NSString *)version {
    return ([self compareToVersion:version] != NSOrderedAscending);
}

- (NSString *)getMainVersionWithIntegerCount:(NSInteger)integerCount {
    NSArray *components = [self componentsSeparatedByString:versionSeparator];
    
    if ((integerCount > 0) && (integerCount <= components.count)) {
        return [[components subarrayWithRange:NSMakeRange(0, integerCount)] componentsJoinedByString:versionSeparator];
    }
    
    return NULL;
}

- (BOOL)needsToUpdateToVersion:(NSString *)newVersion mainVersionIntegerCount:(NSInteger)integerCount {
    NSString *myMainVersion = [self getMainVersionWithIntegerCount:integerCount];
    NSString *newMainVersion = [newVersion getMainVersionWithIntegerCount:integerCount];
    
    if ([myMainVersion isEqualToVersion:newMainVersion]) {
        return [newVersion isNewerThanVersion:self];
    }
    
    return NO;
}

@end

