//
//  ExApiConstants.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import <Foundation/Foundation.h>


//
//  SYVApiConstants.h
//  spreadyv
//
//  Created by Obase Bilgisayar on 15/03/15.
//  Copyright (c) 2015 Obase Bilgisayar. All rights reserved.
//

#define APP_DELEGATE [[UIApplication sharedApplication] delegate]
#define SERVER_ADDRESS @"server_address"
#define DEBUG_MODE YES
#define TOKEN @"user_token"

#define DEFAULT_SERVER_ADDRESS @"http://spreadyv.com"

//static const NSString* kOBSAPI_URL=@"http://spreadyv.com";
//static const NSString* kOBSAPI_URL=@"http://mobilestore.obase.com/api";

//static const NSString* kOBSAPI_URL=@"http://192.168.3.131";


static const NSString* kOBSAPI_URL=@"https://api.instagram.com/v1";


static NSString* INSAPI_URL_GetPublicPhotos=@"/media/search?lat=48.858844&lng=2.294351&client_id=029a204b95604a2981f7ddde6ea6dc0c";


static NSString* INSAPI_URL_SearchTags=@"/tags/search";

static NSString* kOBSAPI_URL_SaveTask=@"/save_task/";

static NSString* kOBSAPI_URL_SpreadVoice=@"/voice/spread/";
static NSString* kOBSAPI_URL_FetchVoice=@"/voice/fetch/";

static NSString* kOBSAPI_URL_LogIn=@"/user/login/";
static NSString* kOBSAPI_URL_Register=@"/user/register/";
static NSString* kOBSAPI_URL_LogOut=@"/user/logout/";


static NSString* kOBSAPI_URL_PasswordRecovery=@"/customer/Passwordrecovery";
static const bool kShowServiceError=true;

static const int kAPIStatus_Success=0;            //Başarılı
static const int kAPIStatus_Network=1;            //Servis ile bağlantı sırasında oluşan hata tipi
static const int kAPIStatus_ServerSide=2;         //Çagırılan metodta ile ilğili servis tarafında oluşan hatat ipi
static const int kAPIStatus_InvalidObject=3;      //Başarılı servis dönüş oldukdan sonra dönen nesne ile tip uyuşmazlığı hatası
static const int kAPIStatus_ClientSide=4;         //Başarılı servis dönüş oldukdan sonra beklenmedik hata tipi

/*Authuser Donus Durum Kodları*/
static const int kLoginStatus_Error=0;            //Hata
static const int kLoginStatus_Success=1;          //Başarılı
static const int kLoginStatus_InvalidInfo=2;      //Kullanıcı bilgileri yanlış
static const int kLoginStatus_InactiveUser=3;     //Pasif Kullanıcı

static const NSString* kApiID = @"I";


@interface ExApiConstants : NSObject





@end
