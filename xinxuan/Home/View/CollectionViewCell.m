//
//  CollectionViewCell.m
//  FoldTableVIewText
//
//  Created by ZZCN77 on 2017/9/12.
//  Copyright © 2017年 co. All rights reserved.
//

#import "CollectionViewCell.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]/// rgb颜色转换（16进制->10进制）
@interface CollectionViewCell(){
    NSString *_titleStr;
    NSString *_detailStr;
}
@end
@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.dateView = [[UIImageView alloc] init];
        self.dateView.backgroundColor = [UIColor orangeColor];
        self.dateView.layer.cornerRadius = 40 / 2;
        self.dateView.layer.masksToBounds = YES;
        [self addSubview:self.dateView];
        [self.dateView mas_makeConstraints:^(MASConstraintMaker *make) {
            //配置具体的约束信息。
            make.left.equalTo(@10);
            make.centerY.equalTo(self.mas_centerY);
            make.width.height.equalTo(@40);
        }];
        
        self.textLab = [[UILabel alloc]init];
        self.textLab.numberOfLines = 0;
        self.textLab.text = @"扯犊子呢";
        [self addSubview:self.textLab];
        [self.textLab mas_makeConstraints:^(MASConstraintMaker *make) {
            //配置具体的约束信息。
            make.left.equalTo(self.dateView.mas_right).offset(10);
            make.right.equalTo(self.mas_right).offset(-5);
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@40);
        }];
//


    }
    return self;
}
- (instancetype)initWithTitleItem:(NSString *)title detail:(NSString *)detail{
    if (self = [super init]) {
        _titleStr = title;
        _detailStr = detail;
         NSDictionary *attrs = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15.0f] ,NSForegroundColorAttributeName:UIColorFromRGB(0x444444)};
        self.titleLable.attributedText = [[NSAttributedString alloc]initWithString:_titleStr attributes:attrs];
        
        NSDictionary *attrs2 = @{ NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:15.0f] ,NSForegroundColorAttributeName:UIColorFromRGB(0x444444)};
        self.detailLable.attributedText = [[NSAttributedString alloc]initWithString:_detailStr attributes:attrs2];
    }
    return self;
}





@end
