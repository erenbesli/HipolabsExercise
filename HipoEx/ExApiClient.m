//
//  ExApiClient.m
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "ExApiClient.h"


#import "AFNetworking.h"

#import "ExCommonHelper.h"
#import "AppDelegate.h"
#import <sys/utsname.h>
#import "ExApiConstants.h"

#import "ExTools.h"




@implementation ExApiClient
#define TimeoutError -1001
#define NetworkError -1009
@synthesize sessionToken;


#pragma mark Process
-(void) Process:(JSONModel*) request
      completed:(void (^)(int status,JSONModel *response,NSError *err))completed
ShowServiceError:(bool)ShowServiceError
      methodURL:(NSString*) methodURL
      responseT:(NSString*)responseT
{
    NSNumber * hudId = [self ShowProgress];
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    [manager.requestSerializer setTimeoutInterval:90];
    
    [manager
     GET:[[NSString alloc]initWithFormat:@"%@%@",kOBSAPI_URL, methodURL]
     parameters:[request toDictionary]
     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         
         @try {
             
             JSONModelError* error=nil;
             
             id response= [[NSClassFromString(responseT) alloc] initWithDictionary:responseObject error:&error];
             
             if(error!=nil)
             {
                 NSLog(@"%@",error);
                 completed(kAPIStatus_ClientSide, nil,error);
             }
             else
             {
                 completed(kAPIStatus_Success,response,nil);
             }
         }
         @catch (NSException *exception) {
             completed(kAPIStatus_ClientSide,nil,nil);
         }
         @finally {
             [self HideProgress:hudId];
         }
         
     }
     
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         [self HideProgress:hudId];
         
         if (ShowServiceError) {
             AppDelegate *delegate=(AppDelegate *) [[UIApplication sharedApplication] delegate];
             
             delegate.request=request;
             delegate.methodURL=methodURL;
             delegate.ShowServiceError=ShowServiceError;
             delegate.responseT=responseT;
             delegate.completed=completed;
             
             [delegate retryProcess];
         }
         
         if(error.code!=NetworkError && error.code!=TimeoutError)
             completed(kAPIStatus_Network,nil,error);
         
     }];
}

-(NSString*) GetDeviceModel{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}
-(NSNumber*)ShowProgress{
    return [ExCommonHelper showGlobalProgressHUDWithTitle:@"Searching..." detailMessage:nil];
}

-(void)HideProgress:(NSNumber*)hudId {
    [ExCommonHelper dismissGlobalHUDWithHudId:hudId];
}







@end
