//
//  AJPageControl.h
//  AJPageControl
//
//  Created by 安静的为你歌唱 on 2019/9/8.
//  Copyright © 2019 安静的为你歌唱. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AJPageControl : UIPageControl

@property (nonatomic, strong) UIImage *currentImage;
@property (nonatomic, strong) UIImage *inactiveImage;

@property (nonatomic, assign) CGSize currentImageSize;
@property (nonatomic, assign) CGSize inactiveImageSize;

@end

NS_ASSUME_NONNULL_END
