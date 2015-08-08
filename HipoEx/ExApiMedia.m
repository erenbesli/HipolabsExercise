//
//  ExApiMedia.m
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "ExApiConstants.h"
#import "ExApiMedia.h"
#import "ExApiMediaRequestModel.h"
#import "ExApiMediaResponseModel.h"

@implementation ExApiMedia


-(void) GetPublicPhotos:(ExApiGetPublicPhotosRequestModel*) request  GetPublicPhotosCompleted:(void (^)(int status,ExApiGetPublicPhotosResponseModel *response,NSError *err)) GetPublicPhotosCompleted ShowServiceError:(bool)ShowServiceError{
    [self Process:request
        completed:^(int status,JSONModel *response,NSError *err){
            GetPublicPhotosCompleted(status,(ExApiGetPublicPhotosResponseModel *)response,err);
        }
 ShowServiceError:ShowServiceError
        methodURL:INSAPI_URL_GetPublicPhotos
        responseT:NSStringFromClass([ExApiGetPublicPhotosResponseModel class])];
}


@end
