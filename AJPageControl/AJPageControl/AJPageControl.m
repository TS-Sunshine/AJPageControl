//
//  AJPageControl.m
//  AJPageControl
//
//  Created by 安静的为你歌唱 on 2019/9/8.
//  Copyright © 2019 安静的为你歌唱. All rights reserved.
//

#import "AJPageControl.h"
#define kDotW 30  //圆点的宽度
#define kMagrin 0 //圆点之间的间隔


@implementation AJPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setCurrentPage:(NSInteger)currentPage {
    [super setCurrentPage:currentPage];
    [self updateDots];
}

- (void)updateDots {
    for (int i = 0; i < [self.subviews count]; i++) {
        UIImageView *dot = [self imageViewForSubview:[self.subviews objectAtIndex:i] currPage:i];
        CGRect tempRect = dot.frame;
        if (i == self.currentPage){
            dot.image = self.currentImage;
            tempRect = CGRectMake(-self.currentImageSize.width/2, 0, self.currentImageSize.width, self.currentImageSize.height);
            dot.frame = tempRect;
        }else{
            dot.image = self.inactiveImage;
            tempRect.size = self.inactiveImageSize;
            dot.frame = tempRect;
        }
    }
}

- (UIImageView *)imageViewForSubview:(UIView *)view currPage:(int)currPage{
    UIImageView *dot = nil;
    if ([view isKindOfClass:[UIView class]]) {
        for (UIView *subview in view.subviews) {
            if ([subview isKindOfClass:[UIImageView class]]) {
                dot = (UIImageView *)subview;
                break;
            }
        }
        
        if (dot == nil) {
            dot = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, view.frame.size.width, view.frame.size.height)];
            
            [view addSubview:dot];
        }
    }else {
        dot = (UIImageView *)view;
    }
    
    return dot;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //计算圆点尺寸和间距的长度
    CGFloat marginX = kDotW + kMagrin;
    
    //计算整个pageControll的宽度
    CGFloat newW = self.frame.size.width;//(self.subviews.count - 1 ) * magrin + self.subviews.count *dotW;
    //计算左边距
    CGFloat leftRight = (newW - ((self.subviews.count - 1 ) * kMagrin + self.subviews.count * kDotW)) / 2;
    //设置新frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
    //遍历subview,设置圆点frame
    for (int i=0; i<[self.subviews count]; i++) {
        UIImageView* dot = [self.subviews objectAtIndex:i];
        [dot setFrame:CGRectMake(i * marginX + leftRight, dot.frame.origin.y, kDotW, kDotW)];
    }
}

@end
