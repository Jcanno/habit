//
//  ConcentrateCircleView.m
//  Habit
//
//  Created by JZQ on 2018/6/18.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "ConcentrateCircleView.h"

@implementation ConcentrateCircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        //百分比标签
        UILabel *cLabel = [[UILabel alloc] initWithFrame:self.bounds];
        cLabel.font = [UIFont boldSystemFontOfSize:50];
        cLabel.textColor = [UIColor blackColor];
        cLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:cLabel];
        self.cLabel = cLabel;
    }
    return self;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    //    _cLabel.text = [NSString stringWithFormat:@"%02i:%02i", (int)progress/60,(int)progress%60];
    
    //    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    //路径
    UIBezierPath *path = [[UIBezierPath alloc] init];
    //线宽
    path.lineWidth = 2.0f;
    //颜色
    [[UIColor blackColor] set];
    //拐角
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    //半径
    CGFloat radius = (MIN(rect.size.width, rect.size.height) - 10) * 0.5;
    
    //画弧（参数：中心、半径、起始角度(3点钟方向为0)、结束角度、是否顺时针）
    if (self.type==1) {
        [path addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:M_PI * 1.5 endAngle:M_PI * 3.5 - M_PI * 2 *(1-_progress/10) clockwise:YES];
    }else{
        [path addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:M_PI * 1.5 endAngle:M_PI * 1.5 + M_PI * 2 *(1-_progress/10) clockwise:YES];
    }
    //连线
    [path stroke];
}
@end
