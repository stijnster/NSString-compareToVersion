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

[@"1.2.2.4" isOlderThanVersion:@"1.2.2.5"];
[@"1.2.2.4" isNewerThanVersion:@"1.2.2.5"];
[@"1.2.2.4" isEqualToVersion:@"1.2.2.5"];
[@"1.2.2.4" isEqualOrOlderThanVersion:@"1.2.2.5"];
[@"1.2.2.4" isEqualOrNewerThanVersion:@"1.2.2.5"];
```

The result is a boolean indicating the test result.

## Optimistic version checking

[Jowyer](https://github.com/Jowyer) added two new methods that do optimistic version checking. You can define what your "main version" is, and then check to only do updates in the same main version.

```objective-c
[@"1.2.3.4" getMainVersionWithIntegerCount:1]; // returns 1 as your main version
[@"1.2.3.4" getMainVersionWithIntegerCount:2]; // returns 1.2 as your main version

[@"1.2.3.4" needsToUpdateToVersion:@"1.2.4" mainVersionIntegerCount: 2]; // returns YES, as the main version (1.2) is the same
[@"1.2.3.4" needsToUpdateToVersion:@"1.3.6" mainVersionIntegerCount: 2]; // returns NO, as the main version (1.2) is not the same as 1.3

```

## Testing

A test application is included with a unit test, that covers every method in the class.

## Installation

Include the two NSString+CompareToVersion.* files, located in the Library folder into your project. Include the category where you want to use it;

```objective-c

#import "NSString+CompareToVersion.h"
```

## Collaborate?

Fork me, make your change, write some tests and create a pull request!
