//
//  HWTSquareCell.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/28.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTSquareCell.h"
#import "HWTSquareModel.h"
@interface HWTSquareCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation HWTSquareCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSquare:(HWTSquareModel *)square {
    _square = square;
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:square.icon]];
    _nameLabel.text = square.name;
}

@end
