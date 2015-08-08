//
//  ExApiTag.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "ExApiClient.h"
#import "ExApiTagRequestModel.h"
#import "ExApiTagResponseModel.h"

@interface ExApiTag : ExApiClient



-(void) searchTags:(searchTagRequestModel*) request  searchTagCompleted:(void (^)(int status,searchTagResponseModel *response,NSError *err)) searchTagCompleted ShowServiceError:(bool)ShowServiceError;

@end
