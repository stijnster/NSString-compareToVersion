//
//  NSString+CompareWithVersion.h
//  Stijn Mathysen
//
//  Created by Stijn Mathysen on 27/02/14.
//  Copyright (c) 2014 Stijn Mathysen. Released under the MIT license
//

#import <Foundation/Foundation.h>

@interface NSString (CompareWithVersion)

-(NSComparisonResult)compareWithVersion:(NSString *)version;

@end
