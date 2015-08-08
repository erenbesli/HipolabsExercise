//
//  ExApiTag.m
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "ExApiConstants.h"
#import "ExApiTag.h"
#import "ExApiTagRequestModel.h"
#import "ExApiTagResponseModel.h"
#import "ExApiTag.h"

@implementation ExApiTag


-(void) searchTags:(searchTagRequestModel*) request  searchTagCompleted:(void (^)(int status,searchTagResponseModel *response,NSError *err)) searchTagCompleted ShowServiceError:(bool)ShowServiceError{
    [self Process:request
        completed:^(int status,JSONModel *response,NSError *err){
            searchTagCompleted(status,(searchTagResponseModel *)response,err);
        }
 ShowServiceError:ShowServiceError
        methodURL:INSAPI_URL_SearchTags
        responseT:NSStringFromClass([searchTagResponseModel class])];
}


@end
