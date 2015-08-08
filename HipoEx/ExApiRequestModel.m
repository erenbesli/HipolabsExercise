//
//  SYVApiRequestModel.m
//  spreadyv
//
//  Created by Obase Bilgisayar on 14/03/15.
//  Copyright (c) 2015 Obase Bilgisayar. All rights reserved.
//

#import "ExApiRequestModel.h"

@implementation ExApiRequestInfoModel

-(id)init{
    if(self==[super init]){
    }
    return self;
}

@end

@implementation ExApiRequestModel

-(id) init{
    if(self==[super init]){
        self.RequestInfo = [[ExApiRequestInfoModel alloc] init];
    }
    return self;
}

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

@end

@implementation SYVApiPagingInfoModel
-(id) init{
    if(self==[super init]){
        self.PageSize = [NSNumber numberWithInt:20];
    }
    return self;
}
@end
