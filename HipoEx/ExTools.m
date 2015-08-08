//
//  Tools.m
//  PolyLingua
//
//  Created by Ozan Uysal on 1/24/12.
//  Copyright (c) 2012 uysalmo@gmail.com. All rights reserved.
//

#import "ExTools.h"

@implementation ExTools : NSObject
/*
 + (BOOL) isIPhone5 {
 if ([[UIScreen mainScreen] bounds].size.height > 480 && [[UIScreen mainScreen] bounds].size.width == 320) {
 return YES;
 } else {
 return NO;
 }
 }
 */
+ (id) retrieveUserDefaults:(NSString *) userKey{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:userKey] != nil)
        return [NSKeyedUnarchiver unarchiveObjectWithData:[defaults objectForKey:userKey]];
    else
        return nil;
}

+ (void) saveUserDefaults:(NSString *)key andValue:(id)value{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:[NSKeyedArchiver archivedDataWithRootObject:value] forKey:key];
    [defaults synchronize];
}

+ (void) removeUserDefaults:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

+ (NSString *) getInfoString : (NSString *) key{
    NSDictionary* infoDict = [[NSBundle mainBundle] infoDictionary];
    return [infoDict objectForKey:key];
}

+ (NSString *) urlFriendly:(NSString *) unfriendlyString{
    return [unfriendlyString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (NSDate *) dateConverter: (NSString *) dateString {
    int timeZone = [[NSTimeZone localTimeZone] secondsFromGMT]; // server time is GMT +0
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    return [[dateFormatter dateFromString:dateString] dateByAddingTimeInterval:timeZone];
}

+ (NSString *) dateFormatter: (NSDate *) date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *) longDateFormatter: (NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    return [dateFormatter stringFromDate:date];
}

+(NSString *)dateFormatterYearMonthDay:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:date];
}
/*
 + (void) listAllFonts {
 // List all fonts on device
 NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
 NSArray *fontNames;
 NSInteger indFamily, indFont;
 for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
 {
 NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
 fontNames = [[NSArray alloc] initWithArray:
 [UIFont fontNamesForFamilyName:
 [familyNames objectAtIndex:indFamily]]];
 for (indFont=0; indFont<[fontNames count]; ++indFont)
 {
 NSLog(@"    Font name: %@", [fontNames objectAtIndex:indFont]);
 
 }
 }
 }
 */
@end
