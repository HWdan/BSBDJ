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
//重写 cell 的frame （高度减1就出现分割线）
- (void)setFrame:(CGRect)frame {
    frame.size.height -= 1;
    [super setFrame:frame];
}

- (void)setSubTag:(HWTSubTagModel *)subTag {
    _subTag = subTag;
    _nameLabel.text = subTag.theme_name;
    [self resolveNumber];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:subTag.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] options:SDWebImageCacheMemoryOnly completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        //获取图形上下文
        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
        //获取裁剪区域
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        //设置裁剪区域
        [path addClip];
        //画图片
        [image drawAtPoint:CGPointZero];
        //获取裁剪后的图片
        image = UIGraphicsGetImageFromCurrentImageContext();
        //关闭上下文
        UIGraphicsEndPDFContext();
        _iconImageView.image = image;
    }];
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
//    //设置 iconImageView 圆角 (iOS 9之前可能会出现卡顿，不建议使用)
//    _iconImageView.layer.cornerRadius = 30;
//    _iconImageView.layer.masksToBounds = YES;
    //处理 cell 分割线（让分割线从0开始，iOS 8之后）
    self.layoutMargins = UIEdgeInsetsZero;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
