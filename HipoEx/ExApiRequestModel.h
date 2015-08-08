//
//  SYVApiRequestModel.h
//  spreadyv
//
//  Created by Obase Bilgisayar on 14/03/15.
//  Copyright (c) 2015 Obase Bilgisayar. All rights reserved.
//

#import "JSONModel.h"
#import "ExApiConstants.h"

@interface ExApiRequestInfoModel : JSONModel

@property (strong,atomic) NSString*  ApiAppId;
@property (strong,atomic) NSString*  ApiKey;
@property (strong,atomic) NSNumber*  Language;
//@property (strong,atomic) NSNumber<Optional>*  DeliveryZone;
//@property (strong,atomic) NSNumber<Optional>*  CustomerId;
@property (strong,atomic) NSString*  Process;
@property (strong,atomic) NSString*  ClientVersion;
@property (strong,atomic) NSString*  DeviceModel;
@property (strong,atomic) NSString*  DeviceManufacturer;
@property (strong,atomic) NSString*  DeviceOSVersion;
//@property (strong,atomic) NSNumber<Optional>*  StoreId;
-(id)init;

@end

@interface ExApiRequestModel : JSONModel

@property (nonatomic,strong) ExApiRequestInfoModel * RequestInfo;

-(id) init;

@end

@interface SYVApiPagingInfoModel : JSONModel
@property (nonatomic,strong) NSNumber * PageNumber;
@property (nonatomic,strong) NSNumber * PageSize;
-(id) init;
@end
