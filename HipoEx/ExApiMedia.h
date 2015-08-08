//
//  ExApiMedia.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "ExApiClient.h"
#import "ExApiMediaRequestModel.h"
#import "ExApiMediaResponseModel.h"

@interface ExApiMedia : ExApiClient


-(void) GetPublicPhotos:(ExApiGetPublicPhotosRequestModel*) request  GetPublicPhotosCompleted:(void (^)(int status,ExApiGetPublicPhotosResponseModel *response,NSError *err)) GetPublicPhotosCompleted ShowServiceError:(bool)ShowServiceError;

@end
