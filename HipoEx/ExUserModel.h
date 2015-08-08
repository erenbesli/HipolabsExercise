//
//  ExUserModel.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "JSONModel.h"
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreImage/CoreImage.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIColor.h>
#import <UIKit/UIGeometry.h>



@interface ExUserModel : JSONModel

@end

@interface UserModel : JSONModel
@property UIImage *profile_image;
@property(nonatomic,strong) NSString * username;
@end