//
//  ExApiClient.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#import "JSONModel.h"

@interface ExApiClient : NSObject<UIAlertViewDelegate>

@property (nonatomic, strong) NSString *sessionToken;



-(void) Process:(JSONModel*) request completed:(void (^)(int status,JSONModel *response,NSError *err))completed ShowServiceError:(bool)ShowServiceError methodURL:(NSString*) methodURL responseT:(NSString*)responseT;

-(NSNumber *) ShowProgress;
-(void)HideProgress:(NSNumber*)hudId;

+ (id)sharedManager;

@end
