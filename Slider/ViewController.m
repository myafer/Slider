//
//  ViewController.m
//  Slider
//
//  Created by YiHui on 15/8/13.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "ViewController.h"
#import "AferButtonSlider.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initSliderView];
}

- (void)initSliderView {
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 320, 50)];
    bgView.backgroundColor = [UIColor colorWithWhite:0.980 alpha:1.000];
    [self.view addSubview:bgView];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 20, 285, 10)];
    lineView.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    [bgView addSubview:lineView];
    
    for (int i = 0; i < 4; i ++) {
        UIView *coreView = [[UIView alloc] initWithFrame:CGRectMake( 12.5 + (270 / 3.0) * i, 15, 20, 20)];
        coreView.layer.cornerRadius = 10;
        coreView.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
        [bgView addSubview:coreView];
    }
    
    AferButtonSlider *a = [[AferButtonSlider alloc] initWithFrame:CGRectMake(0, 80, 320, 50)];
    a.backgroundColor = [UIColor clearColor];
    [self.view addSubview:a];
    a.returnBlock = ^(NSInteger indexB){
        NSLog(@"选中按钮第 === %ld 个", indexB);
    };

}



@end
