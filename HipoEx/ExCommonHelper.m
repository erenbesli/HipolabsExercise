//
//  OBSGlobalContainer.m
//  etailer
//
//  Created by Obase Bilgisayar on 12.03.2014.
//  Copyright (c) 2014 OBase. All rights reserved.
//

#import "ExCommonHelper.h"
//#import "OBSMainTabBarView.h"
//#import "OBSCategoryModel.h"
#import "AppDelegate.h"

@implementation ExCommonHelper

@synthesize allCategories, checkoutProcessStarted, hudIDs;

static ExCommonHelper * instance = nil;

+(ExCommonHelper*) getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance=[ExCommonHelper new];
            instance.checkoutProcessStarted = NO;
            instance.hudIDs = [NSMutableArray new];
        }
    }
    return instance;
}

/*
 +(NSMutableArray*)getCategoriesWithParent:(int)parentCategoryId{
 NSMutableArray * categories = [NSMutableArray new];
 
 for(OBSCategoryModel * cat in [OBSCommonHelper getInstance].allCategories){
 if([cat.ParentId intValue] == parentCategoryId)
 {
 [categories addObject:cat];
 }
 }
 
 return categories;
 }
 
 +(NSString*) getCategoryListAsStringWithParent:(int)parentCategoryId{
 NSString * cats = [NSString new];
 
 for(OBSCategoryModel * cat in [OBSCommonHelper getInstance].allCategories){
 if([cat.ParentId intValue] == parentCategoryId)
 {
 if([cats length]==0){
 cats = cat.Name;
 }
 else{
 cats = [NSString stringWithFormat:@"%@,%@",cats,cat.Name];
 }
 }
 }
 
 return cats;
 }
 */

+ (bool)checkDoublePickerCall:(int*)num
{
    if(*num>0){
        *num=0;
        return false;
    }
    *num=1;
    return true;
}

+(NSString*) formatNumber:(NSNumber*)value withDigits:(int)digits{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    //formatter.maximumIntegerDigits = 3;
    formatter.minimumFractionDigits = digits;
    formatter.maximumFractionDigits = digits;
    formatter.usesSignificantDigits = NO;
    formatter.usesGroupingSeparator = NO;
    formatter.groupingSeparator = @",";
    formatter.decimalSeparator = @".";
    NSString *formattedNumber = [formatter stringFromNumber:value];
    return formattedNumber;
}

+ (UIViewController *)getTopViewController{
    return [self getTopViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

/*
+ (UIViewController *)getTopViewController:(UIViewController *)rootViewController
{
    UIViewController * view;
    
    if (rootViewController.presentedViewController == nil) {
        view = rootViewController;
    }else{
        view = rootViewController.presentedViewController;
    }
    
    if ([view isMemberOfClass:[UINavigationController class]]) {
        UINavigationController *navigationController = (UINavigationController *)view;
        UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
        return [self getTopViewController:lastViewController];
    }else  if ([view isMemberOfClass:[OBSMainTabBarView class]]) {
        UITabBarController *tabBarController = (UITabBarController*) view;
        
        UINavigationController * navigationController =  [tabBarController.viewControllers objectAtIndex:tabBarController.selectedIndex];
        UIViewController * lastViewController = [navigationController.viewControllers objectAtIndex:[navigationController.viewControllers count]-1];
        return [self getTopViewController:lastViewController];
    }else{
        return view;
    }
    
    return [self getTopViewController:view];
}
*/
+(NSDate*) dateWithYear:(int) year Month:(int)month Day:(int)day{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    return [calendar dateFromComponents:components];
}
+(NSInteger)getDayForDate:(NSDate*)date{
    NSDate *currentDate;
    
    if(date==nil)
    {
        currentDate = [NSDate date];
    }
    else{
        currentDate = date;
    }
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    
    //[components month]; //gives you month
    //[components day]; //gives you day
    return [components day]; // gives you year
}
+(NSInteger)getMonthForDate:(NSDate*)date{
    NSDate *currentDate;
    
    if(date==nil)
    {
        currentDate = [NSDate date];
    }
    else{
        currentDate = date;
    }
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    
    //[components month]; //gives you month
    //[components day]; //gives you day
    return [components month]; // gives you year
}
+(NSInteger)getYearForDate:(NSDate*)date{
    NSDate *currentDate;
    
    if(date==nil)
    {
        currentDate = [NSDate date];
    }
    else{
        currentDate = date;
    }
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components
    
    //[components month]; //gives you month
    //[components day]; //gives you day
    return [components year]; // gives you year
}

+(NSString*)stringFromDate:(NSDate*)date withFormat:(NSString*)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}
+(NSDate*)dateFromString:(NSString*)value withFormat:(NSString*)format{
    
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:format];
    return [dateFormat dateFromString:value];
    
}
+ (NSNumber *)showGlobalProgressHUDWithTitle:(NSString *)title detailMessage:(NSString *)message {
    __block MBProgressHUD *hud = nil;
    NSNumber * hudId = [ExCommonHelper generateHudId];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
        //if([window viewWithTag:999999]==nil){
        hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        hud.labelText = title;
        hud.tag = [hudId integerValue];
        hud.detailsLabelText = message;
        [hud setUserInteractionEnabled:YES];
        hud.labelFont = [UIFont fontWithName:@"OpenSans" size:11];
        hud.dimBackground = YES;
        
        // }
    });
    //hud =  [MBProgressHUD HUDForView:[[[UIApplication sharedApplication] windows] lastObject]];
    return hudId;
}

+ (void) showToastWithMessage:(NSString*) message{
    __block MBProgressHUD *hud = nil;
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *window = [ExCommonHelper getTopViewController];
        //if([window viewWithTag:999999]==nil){
        hud = [MBProgressHUD showHUDAddedTo:window.view animated:YES];
        hud.labelText = message;
        hud.mode=MBProgressHUDModeText;
        hud.tag = 888888;
        //hud.detailsLabelText = message;
        [hud setUserInteractionEnabled:NO];
        hud.dimBackground = NO;
        hud.labelFont = [UIFont fontWithName:@"OpenSans" size:11];
        hud.alpha=0.9;
        hud.margin = 10.f;
        hud.yOffset = 150.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        //  }
    });
}

+ (void) dismissGlobalHUDWithHudId:(NSNumber*)hudId{
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            for(UIWindow* window in [[UIApplication sharedApplication] windows]){
                NSArray * huds = [MBProgressHUD allHUDsForView:window];
                for(MBProgressHUD * hud in huds){
                    if(hud.tag==[hudId integerValue]){
                        [hud hide:YES];
                        [[ExCommonHelper getInstance].hudIDs removeObject:hudId];
                    }
                }
            }
        });
    });
}

+ (void)dismissGlobalHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
        [MBProgressHUD hideHUDForView:window animated:YES];
    });
}

+(NSNumber*)generateHudId{
    NSNumber* hudId;
    BOOL isOK = NO;
    do{
        hudId = [NSNumber numberWithInt:[ExCommonHelper generateRandomNumberBetweenMin:1 Max:999999]];
        NSArray * ids = [[ExCommonHelper getInstance].hudIDs filteredArrayUsingPredicate:[NSPredicate
                                                                                           predicateWithFormat:@"self == %@", hudId ]];
        if(ids.count==0){
            isOK=YES;
            [[ExCommonHelper getInstance].hudIDs addObject:hudId];
        }
        
    } while(!isOK);
    return hudId;
}
+(int)generateRandomNumberBetweenMin:(int)min Max:(int)max
{
    return ( (arc4random() % (max-min+1)) + min );
}


@end
