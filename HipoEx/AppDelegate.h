//
//  AppDelegate.h
//  spreadyv
//
//  Created by Obase Bilgisayar on 10/03/15.
//  Copyright (c) 2015 Obase Bilgisayar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
//#import "ExApiResponseModel.h"
#import "ExApiRequestModel.h"
#import "ExApiClient.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) ExApiRequestModel* request;
@property (nonatomic,strong) NSString* methodURL;
@property (nonatomic,strong) NSString* responseT;
@property (nonatomic) BOOL ShowServiceError;
@property (nonatomic,strong)void (^completed)(int status,JSONModel *response,NSError *err);
-(void) retryProcess;

@end

