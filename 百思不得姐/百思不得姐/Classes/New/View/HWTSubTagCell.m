//
//  HWTSubTagCell.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/25.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTSubTagCell.h"
#import "HWTSubTagModel.h"

@interface HWTSubTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation HWTSubTagCell

- (void)setSubTag:(HWTSubTagModel *)subTag {
    _subTag = subTag;
    _nameLabel.text = subTag.theme_name;
    [self resolveNumber];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:subTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

//处理订阅数据
- (void)resolveNumber {
    NSString * numberStr = [NSString stringWithFormat:@"%@订阅",_subTag.sub_number];
    if (_subTag.sub_number.integerValue > 10000) {
        CGFloat f = _subTag.sub_number.integerValue / 10000.0;
        numberStr = [NSString stringWithFormat:@"%.1f万人订阅",f];
        numberStr = [numberStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    _numberLabel.text = numberStr;
}

//从 xib 中加载就会调用这个方法一次
- (void)awakeFromNib {
    [super awakeFromNib];
    //设置 iconImageView 圆角
    _iconImageView.layer.cornerRadius = 30;
    _iconImageView.layer.masksToBounds = YES;
    //处理 cell 分割线（让分割线从0开始）
    self.layoutMargins = UIEdgeInsetsZero;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
