//
//  ExMediaModel.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "JSONModel.h"
#import "ExUserModel.h"


@protocol Images
@end

@protocol StandartResolutionModel
@end

@interface ExMediaModel : JSONModel

@end

@interface StandartResolutionModel : NSDictionary
@property (nonatomic,strong) NSString *url;
@property UIImage * publised_image;


@end

@interface ImagesModel : JSONModel
@property UserModel * user;
@property NSString * created_time;
@property UIImage * publised_image;
@end



