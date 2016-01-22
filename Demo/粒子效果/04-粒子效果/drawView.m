//
//  drawView.m
//  04-粒子效果
//
//  Created by Macx on 15/8/23.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "drawView.h"

@interface drawView ()

/** <#注释#> */
@property (strong, nonatomic) UIBezierPath * path;

/** 圆点 */
@property (nonatomic,weak) CALayer * greenLayer;

@end



@implementation drawView

/** path 数据懒加载*/
- (UIBezierPath *)path
{
    if (!_path) {
        _path = [UIBezierPath bezierPath];
    }
    return _path;
}

/** green 数据懒加载*/
- (CALayer *)greenLayer
{
    if (!_greenLayer) {
        CAReplicatorLayer *rep = [CAReplicatorLayer layer];
        rep.frame = self.bounds;
        rep.instanceCount = 10;
        rep.instanceDelay = 0.3;
        [self.layer addSublayer:rep];
        
        CALayer *greenDot = [CALayer layer];
        greenDot.frame = CGRectMake(-1000, 0, 10, 10);
        greenDot.backgroundColor = [UIColor greenColor].CGColor;
        greenDot.cornerRadius = 5;
        _greenLayer = greenDot;
        
        [rep addSublayer:greenDot];
        
        
    }
    return _greenLayer;
}


- (void)startAnim{
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    
    anim.path = _path.CGPath;
    
    anim.duration = 2;
    
    anim.repeatCount = MAXFLOAT;
    
    [self.greenLayer addAnimation:anim forKey:@"anim"];
   
}
- (void)reDraw{
    [self.path removeAllPoints];
    [self.greenLayer removeAnimationForKey:@"anim"];
    [self setNeedsDisplay];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touP = [touch locationInView:self];
    
    [self.path moveToPoint:touP];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touP = [touch locationInView:self];
    
    [self.path addLineToPoint:touP];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    [_path stroke];
}

@end
