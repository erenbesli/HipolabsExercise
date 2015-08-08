//
//  TableViewCell.m
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize labelPublisedTime,labelUserName,publishedImage,profileImage,headerView;




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        //self.headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 50, 320, 430)];
        self.headerView =[UIView new];
        [self.labelUserName setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.labelUserName.backgroundColor = [UIColor yellowColor];
        
        [self addSubview:headerView];
        
        // configure control(s)
        //self.labelUserName = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 300, 30)];
        self.labelUserName = [UILabel new];
        [self.labelUserName setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.labelUserName.textColor = [UIColor blackColor];
        self.labelUserName.font = [UIFont fontWithName:@"Arial" size:12.0f];
        
        [self.headerView addSubview:self.labelUserName];
        
        
        //self.labelPublisedTime = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 300, 30)];
         self.labelPublisedTime = [UILabel new];
        [self.labelPublisedTime setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.labelPublisedTime.textColor = [UIColor blackColor];
        self.labelPublisedTime.font = [UIFont fontWithName:@"Arial" size:12.0f];
        
        [self.headerView addSubview:self.labelPublisedTime];
        
        
        //self.publishedImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 150, 150)];
        self.publishedImage = [UIImageView new];
        [self.publishedImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        //self.labelUserName.textColor = [UIColor blackColor];
        //self.labelUserName.font = [UIFont fontWithName:@"Arial" size:12.0f];
        
        [self addSubview:self.publishedImage];
        
        
        //self.profileImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 300, 30)];
        self.profileImage = [UIImageView new];
        [self.profileImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        //self.labelUserName.textColor = [UIColor blackColor];
        //self.labelUserName.font = [UIFont fontWithName:@"Arial" size:12.0f];
        
        [self.headerView addSubview:self.profileImage];
        
        
        NSDictionary  *elementsDict = NSDictionaryOfVariableBindings(labelUserName,labelPublisedTime,profileImage,publishedImage);
        
        NSDictionary  *elementsDict1 = NSDictionaryOfVariableBindings(headerView,publishedImage);
        
        
        /*
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[headerView]-[publishedImage]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:elementsDict1]];
        
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[headerView(>=60)]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:elementsDict1]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[publishedImage(>=60)]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:elementsDict1]];
        
        */
        
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[profileImage(>=5)]-[publishedImage(>=300)]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:elementsDict]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[labelUserName(>=60)]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:elementsDict]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[labelPublisedTime]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:elementsDict]];
        
        
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[profileImage(>=60)]-[labelUserName(>=60)]-[labelPublisedTime]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:elementsDict]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[publishedImage]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:elementsDict]];
        
        
        

        
        
        /*
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[profileImage]-[labelUserName]-[labelPublisedTime]-|"
                                                                          options:NSLayoutFormatDirectionLeadingToTrailing
                                                                          metrics:nil
                                                                            views:elementsDict]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[publishedImage]-|"
                                                                     options:NSLayoutFormatDirectionLeadingToTrailing
                                                                     metrics:nil
                                                                       views:elementsDict]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[profileImage]-|"
                                                                          options:NSLayoutFormatDirectionLeadingToTrailing
                                                                          metrics:nil
                                                                            views:elementsDict]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[labelUserName]-|"
                                                                          options:NSLayoutFormatDirectionLeadingToTrailing
                                                                          metrics:nil
                                                                            views:elementsDict]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[labelPublisedTime]-[publishedImage]-|"
                                                                          options:NSLayoutFormatDirectionLeadingToTrailing
                                                                          metrics:nil
                                                                            views:elementsDict]];
        
        */
        
    }
    return self;
}







@end
