//
//  AferButtonSlider.h
//  Slider
//
//  Created by YiHui on 15/8/13.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnBlock)(NSInteger indexB);

@interface AferButtonSlider : UIControl {
    UIImageView *_thumbImageView;
    BOOL _thumbOn;
}

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) ReturnBlock returnBlock;

@end
