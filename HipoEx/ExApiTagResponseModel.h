//
//  ExApiTagResponseModel.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "JSONModel.h"

@protocol Tag
@end

@interface ExApiTagResponseModel : JSONModel

@end


@interface Tag : JSONModel
@property (nonatomic,strong) NSNumber *  media_count;
@property (nonatomic,strong) NSString *name;

@end


@interface searchTagResponseModel : JSONModel

@property (nonatomic,strong) NSArray *  data;
//@property (nonatomic,strong)  NSArray <Optional>* meta;

@end



