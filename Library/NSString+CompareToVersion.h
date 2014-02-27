//
//  NSString+CompareToVersion.h
//  Stijn Mathysen
//
//  Created by Stijn Mathysen on 27/02/14.
//  Copyright (c) 2014 Stijn Mathysen. Released under the MIT license
//

#import <Foundation/Foundation.h>

@interface NSString (CompareToVersion)

-(NSComparisonResult)compareToVersion:(NSString *)version;

-(BOOL)isOlderThan:(NSString *)version;
-(BOOL)isNewerThan:(NSString *)version;
-(BOOL)isEqualTo:(NSString *)version;
-(BOOL)isEqualOrOlderThan:(NSString *)version;
-(BOOL)isEqualOrNewerThan:(NSString *)version;

@end
