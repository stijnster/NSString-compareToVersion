//
//  NSString+CompareToVersion.m
//  Skylight BVBA
//
//  Created by Stijn Mathysen on 27/02/14.
//  Copyright (c) 2014 Stijn Mathysen. Released under the MIT license
//

#import "NSString+CompareToVersion.h"

@implementation NSString (CompareToVersion)

-(NSComparisonResult)compareToVersion:(NSString *)version{
    NSComparisonResult result;
    
    result = NSOrderedSame;
    
    if(![self isEqualToString:version]){
        NSArray *thisVersion = [self componentsSeparatedByString:@"."];
        NSArray *compareVersion = [version componentsSeparatedByString:@"."];
        
        for(NSInteger index = 0; index < MAX([thisVersion count], [compareVersion count]); index++){
            NSInteger thisSegment = (index < [thisVersion count]) ? [[thisVersion objectAtIndex:index] integerValue] : 0;
            NSInteger compareSegment = (index < [compareVersion count]) ? [[compareVersion objectAtIndex:index] integerValue] : 0;
            
            if(thisSegment < compareSegment){
                result = NSOrderedAscending;
                break;
            }
            
            if(thisSegment > compareSegment){
                result = NSOrderedDescending;
                break;
            }
        }
    }
    
    return result;
}


-(BOOL)isOlderThanVersion:(NSString *)version{
    return ([self compareToVersion:version] == NSOrderedAscending);
}

-(BOOL)isNewerThanVersion:(NSString *)version{
    return ([self compareToVersion:version] == NSOrderedDescending);
}

-(BOOL)isEqualToVersion:(NSString *)version{
    return ([self compareToVersion:version] == NSOrderedSame);
}

-(BOOL)isEqualOrOlderThanVersion:(NSString *)version{
    return ([self compareToVersion:version] != NSOrderedDescending);
}

-(BOOL)isEqualOrNewerThanVersion:(NSString *)version{
    return ([self compareToVersion:version] != NSOrderedAscending);
}

// Add Optimistic operator support
- (NSString *)getMainVersionWithIntegerCount:(int)integerCount {
    NSArray *components = [self componentsSeparatedByString:@"."];
    NSString *returnString = @"";
    if (components.count < integerCount) {
        returnString = nil;
    } else {
        for (int i = 0; i <= integerCount - 2; i++) {
            NSString *integerString = components[i];
            returnString = [returnString stringByAppendingString:[NSString stringWithFormat:@"%@.", integerString]];
        }
        if ((integerCount - 1) >= 0) {
            NSString *lastIntegerString = components[integerCount - 1];
            returnString = [returnString stringByAppendingString:lastIntegerString];
        } else {
            returnString = nil;
        }
    }
    return returnString;
}

- (BOOL)needsToUpdateToVersion:(NSString *)newVersion MainVersionIntegerCount:(int)integerCount {
    NSString *myMainVersion = [self getMainVersionWithIntegerCount:integerCount];
    NSString *newMainVersion = [newVersion getMainVersionWithIntegerCount:integerCount];
    
    if ([myMainVersion isEqualToVersion:newMainVersion]) {
        if ([newVersion isNewerThanVersion:self]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

@end