//
//  Tools.h
//  PolyLingua
//
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface Tools : NSObject{
    
}

+ (void) saveUserDefaults:(NSString *)key andValue:(id)value;
+ (void) removeUserDefaults:(NSString *)key;
+ (id) retrieveUserDefaults:(NSString *) userKey;
+ (NSString *) getInfoString : (NSString *) key;
+ (NSDate *) dateConverter: (NSString *) dateString;
+ (NSString *) dateFormatter: (NSDate *) date;
+ (NSString *) longDateFormatter: (NSDate *)date ;
+ (NSString *)dateFormatterYearMonthDay:(NSDate *)date;

+ (NSString *) urlFriendly:(NSString *)unfriendlyString;

+ (BOOL) isIPhone5;

+ (void) listAllFonts;

@end
