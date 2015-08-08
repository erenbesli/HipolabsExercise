//
//  ExApiMediaResponseModel.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "JSONModel.h"
#import "ExMediaModel.h"

@interface ExApiMediaResponseModel : JSONModel

@end

@interface ExApiGetPublicPhotosResponseModel :JSONModel

@property (nonatomic,strong) NSArray *data;
@end