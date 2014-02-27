NSString-compareWithVersion
===========================

An objective-c category for NSString to do version string comparison.

Compare version strings easily with this category to NSString. To compare versions with each other, simply call the compareToVersion: function.

```objective-c

[@"1.2.2.4" compareToVersion:@"1.2.2.5"];

```

The function will take all version elements into account and detects version changes more accurate then 

```objective-c

[@"1.2.2" compare:@"1.2.2.5" options:NSNumericSearch]

```