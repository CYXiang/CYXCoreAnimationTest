//
//  ViewController.m
//  03-活动指示器
//
//  Created by Macx on 15/8/23.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加复制层
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    
    repLayer.frame = _contentView.bounds;
    
    NSInteger count = 30;
    //设置总份数
    repLayer.instanceCount = count;
    
    //计算每个小块的角度
    CGFloat angle = (M_PI * 2)/count;
    
    repLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    
    repLayer.instanceDelay = .3/count;
    
    [_contentView.layer addSublayer:repLayer];
    
    //添加圆点图层到复制层
    CALayer *layer = [CALayer layer];
    
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    layer.frame = CGRectMake(_contentView.frame.size.width * 0.5, _contentView.frame.size.height * 0.1, 20, 20);
    
    layer.cornerRadius = 10;
    
    layer.transform = CATransform3DMakeScale(0, 0, 0);
    
    [repLayer addSublayer:layer];
    
    //添加动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"transform.scale";
    
    anim.fromValue = @1;
    
    anim.toValue = @0;
    
    anim.duration = .3;
    //动画反转（慢慢放大慢慢缩小）
//    anim.autoreverses = YES;
    
    anim.repeatCount = MAXFLOAT;
    
    [layer addAnimation:anim forKey:nil];

}



@end
