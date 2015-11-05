//
//  AferButtonSlider.m
//  Slider
//
//  Created by YiHui on 15/8/13.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#define SELF_WIDTH self.bounds.size.width
#define SELF_HALF_WIDTH self.bounds.size.width / 2.0
#define SELF_HEIGHT self.bounds.size.height
#define SELF_HALF_HEIGHT self.bounds.size.height / 2.0

#define IMAGEVIEW_CENTER_Y SELF_HALF_HEIGHT


#import "AferButtonSlider.h"

@implementation AferButtonSlider {
    CGPoint _beginPoint;
}

- (void)drawRect:(CGRect)rect {
   
    _count = 3;
    _beginPoint = CGPointMake(SELF_WIDTH - SELF_HALF_HEIGHT, SELF_HALF_HEIGHT) ;

    _thumbImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height)];
    _thumbImageView.center = CGPointMake(SELF_WIDTH - SELF_HALF_HEIGHT, IMAGEVIEW_CENTER_Y);
    _thumbImageView.image = [UIImage imageNamed:@"women2"];
    [self addSubview:_thumbImageView];
    
    
}


#pragma mark - Touch events handling
-(BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchPoint = [touch locationInView:self];
    _beginPoint = _thumbImageView.center;
    if(CGRectContainsPoint(_thumbImageView.frame, touchPoint)){
        _thumbOn = YES;
    }else {
        _thumbOn = NO;
    }
    return YES;
}


-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    if (1) {
        CGPoint touchPoint = [touch locationInView:self];
        CGFloat touchX = touchPoint.x;
        CGPoint toPoint = CGPointMake([self toxxWithLastTouchPointX:touchX] , IMAGEVIEW_CENTER_Y);
        _thumbImageView.center = toPoint;
    }
    
    _thumbOn = NO;
}

- (CGFloat)toxxWithLastTouchPointX:(CGFloat )x {
    CGFloat xoff = 0.0;
    CGFloat distance = (SELF_WIDTH - (2 * SELF_HALF_HEIGHT)) / _count;
    int i = 0;
    while (i < _count) {
        if ((x - (i * distance) + SELF_HALF_HEIGHT) <= distance) {
            xoff = x - (i * distance);
            break;
        }
        i ++;
    }
    
    if (xoff < (distance / 2.0)) {
        if (self.returnBlock) {
            self.returnBlock(i);
        }
        return SELF_HALF_HEIGHT + i * distance;
        
    } else {
        if (self.returnBlock) {
            self.returnBlock(i + 1);
        }
        return MIN((((i + 1) * distance) + SELF_HALF_HEIGHT), (SELF_WIDTH - SELF_HALF_HEIGHT)) ;
        
    }
}


-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchPoint = [touch locationInView:self];
    _thumbImageView.center = CGPointMake( MIN( MAX( SELF_HALF_HEIGHT, touchPoint.x), self.frame.size.width - SELF_HALF_HEIGHT), IMAGEVIEW_CENTER_Y);
    
    return YES;
    
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    _thumbImageView.center = CGPointMake(SELF_HALF_HEIGHT, IMAGEVIEW_CENTER_Y);
}


@end
