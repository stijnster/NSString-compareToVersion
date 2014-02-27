NSString-compareWithVersion
===========================

An objective-c category for NSString to do version string comparison.

## General

Compare version strings easily with this category to NSString. To compare versions with each other, simply call the compareToVersion: function.

```objective-c

[@"1.2.2.4" compareToVersion:@"1.2.2.5"];
```

The result is NSComparisonResult; either NSOrderedAscending, NSOrderedDescending, NSOrderedSame.

The function will take all version elements into account and detects version changes more accurate then e.g.;

```objective-c

[@"1.2.2" compare:@"1.2.2.5" options:NSNumericSearch]
```

## Helper methods

There are a few helper methods that make version comparison even easier;

```objective-c

[@"1.2.2.4" isOlderThan:@"1.2.2.5"];
[@"1.2.2.4" isNewerThan:@"1.2.2.5"];
[@"1.2.2.4" isEqualTo:@"1.2.2.5"];
[@"1.2.2.4" isEqualOrOlderThan:@"1.2.2.5"];
[@"1.2.2.4" isEqualOrNewerThan:@"1.2.2.5"];
```

The result is a boolean indicating the test result.

## Testing

A test application is included with a unit test, that covers every method in the class.

## Installation

Include the two NSString+CompareToVersion.* files, located in the Library folder into your project. Include the category where you want to use it;

```objective-c

#import "NSString+CompareToVersion.h"
```

## Collaborate?

Fork me!!