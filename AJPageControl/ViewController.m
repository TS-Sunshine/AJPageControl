//
//  ViewController.m
//  AJPageControl
//
//  Created by 安静的为你歌唱 on 2019/9/7.
//  Copyright © 2019 安静的为你歌唱. All rights reserved.
//

#import "ViewController.h"
#import "AJPageControl/AJPageControl.h"

@interface ViewController ()
@property (nonatomic, weak)AJPageControl *pageCtrl;
@end

@implementation ViewController {
    int _page;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _page = 0;
    AJPageControl *pageCtrl = [[AJPageControl alloc] initWithFrame:CGRectMake(100, 100, 100, 10)];
    pageCtrl.numberOfPages = 5;
    pageCtrl.currentPage = _page;
    pageCtrl.userInteractionEnabled = NO;
    pageCtrl.inactiveImage = [UIImage imageNamed:@"icon-1"];
    pageCtrl.inactiveImageSize = CGSizeMake(5, 5);
    pageCtrl.currentImage = [UIImage imageNamed:@"icon-2"];
    pageCtrl.currentImageSize = CGSizeMake(20, 5);
    pageCtrl.currentPageIndicatorTintColor = [UIColor clearColor];
    pageCtrl.pageIndicatorTintColor = [UIColor clearColor];
    self.pageCtrl = pageCtrl;
    
    [self.view addSubview:pageCtrl];
}

- (IBAction)addPage:(UIButton *)sender {
    _page = _page + 1;
     self.pageCtrl.currentPage = _page;
}

@end
