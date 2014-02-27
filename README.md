NSString-compareWithVersion
===========================

## General

An objective-c category for NSString to do version string comparison.

Compare version strings easily with this category to NSString. To compare versions with each other, simply call the compareToVersion: function.

```objective-c

[@"1.2.2.4" compareToVersion:@"1.2.2.5"];
```

The result is NSComparisonResult; either NSOrderedAscending, NSOrderedDescending, NSOrderedSame.

The function will take all version elements into account and detects version changes more accurate then e.g.;

```objective-c

[@"1.2.2" compare:@"1.2.2.5" options:NSNumericSearch]
```

## Installation

Include the two NSString+CompareToVersion.* files, located in the Library folder into your project. and include the category where you want to use it;

```objective-c

#import "NSString+CompareToVersion.h"
```