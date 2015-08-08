//
//  ExApiTagRequestModel.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "JSONModel.h"

@interface ExApiTagRequestModel : JSONModel

@end

@interface searchTagRequestModel : JSONModel

@property (nonatomic,strong) NSString *q;
@property (nonatomic,strong) NSString *client_id;


@end