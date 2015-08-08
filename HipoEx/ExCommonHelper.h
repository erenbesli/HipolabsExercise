//
//  OBSGlobalContainer.h
//  etailer
//
//  Created by Obase Bilgisayar on 12.03.2014.
//  Copyright (c) 2014 OBase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface ExCommonHelper : NSObject<UIAlertViewDelegate>{
    NSMutableArray * allCategories;
}

@property (nonatomic,retain) NSMutableArray * allCategories;

+(ExCommonHelper*) getInstance;

+(NSMutableArray*)getCategoriesWithParent:(int)parentCategoryId;

+(NSString*) getCategoryListAsStringWithParent:(int)parentCategoryId;

+(NSString*) formatNumber:(NSNumber*)value withDigits:(int)digits;

+(UIViewController*)getTopViewController;
+ (UIViewController *)getTopViewController:(UIViewController *)rootViewController;
+(NSDate*) dateWithYear:(int) year Month:(int)month Day:(int)day;
+(NSInteger)getDayForDate:(NSDate*)date;
+(NSInteger)getMonthForDate:(NSDate*)date;
+(NSInteger)getYearForDate:(NSDate*)date;
+(NSDate*)dateFromString:(NSString*)value withFormat:(NSString*)format;
+(NSString*)stringFromDate:(NSDate*)date withFormat:(NSString*)format;

+ (NSNumber *)showGlobalProgressHUDWithTitle:(NSString *)title detailMessage:(NSString *)message;
+ (void)dismissGlobalHUD;
+ (void) showToastWithMessage:(NSString*) message;
+ (void) dismissGlobalHUDWithHudId:(NSNumber*)hudId;

@property (nonatomic,assign) BOOL checkoutProcessStarted;
@property (nonatomic,strong) NSMutableArray * hudIDs;
+(int)generateRandomNumberBetweenMin:(int)min Max:(int)max;
+(NSNumber*)generateHudId;
+ (bool)checkDoublePickerCall:(int*)num;

@end
