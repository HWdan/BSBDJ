//
//  HWTLoginRegisterView.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/27.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTLoginRegisterView.h"

@interface HWTLoginRegisterView ()

@property (weak, nonatomic) IBOutlet UIButton *loginRegisterBtn;

@end

@implementation HWTLoginRegisterView

+ (instancetype)loginView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

+ (instancetype)registerView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    //让按钮背景图片不被拉伸
    UIImage *image = _loginRegisterBtn.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [_loginRegisterBtn setBackgroundImage:image forState:UIControlStateNormal];
    [super awakeFromNib];
}

@end
