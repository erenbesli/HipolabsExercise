//
//  TableViewCell.h
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *profileImage;
@property(nonatomic,strong) UIImageView *publishedImage;
@property(nonatomic,strong) UILabel *labelUserName;
@property(nonatomic,strong) UILabel *labelPublisedTime;
@property(nonatomic,strong) UIView *headerView;
@end
