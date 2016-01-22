//
//  ViewController.m
//  822-01-CALayer
//
//  Created by Macx on 15/8/22.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/** 子图层 */
@property (nonatomic,weak) CALayer * layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.新建图层
    CALayer *layer = [CALayer layer];
    //设置尺寸
    layer.frame = CGRectMake(50, 50, 100, 100);
    //设置背景
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    //添加子图层
    [self.view.layer addSublayer:layer];
    //赋值
    _layer = layer;
    
//    _imageView.layer.cornerRadius = 25;
    

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //开启事务
    [CATransaction begin];
    //设置动画时长
    [CATransaction setAnimationDuration:.5];
    
    //动画移位
    _layer.position = CGPointMake(arc4random_uniform(375), arc4random_uniform(600));
    //背景颜色
    _layer.backgroundColor = [self randomColor].CGColor;
    
    //圆角半径
    _layer.cornerRadius = arc4random_uniform(50);
    
    //边框
    _layer.borderWidth = arc4random_uniform(30);
    
    _layer.masksToBounds = YES;
    
    //边框颜色
    _layer.borderColor = [self randomColor].CGColor;
    
    //提交事务
    [CATransaction commit];
    
    _imageView.layer.cornerRadius = 50;
    _imageView.clipsToBounds = YES;
}
//颜色随机方法
- (UIColor *)randomColor
{
    
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)viewLayer{
    
    //显示阴影
    _redView.layer.shadowOpacity = 1;
    //阴影颜色
    _redView.layer.shadowColor = [UIColor blueColor].CGColor;
    //阴影偏移位
    _redView.layer.shadowOffset = CGSizeMake(10, 10);
    //圆角半径
    _redView.layer.cornerRadius = 50;
    //边框宽度
    _redView.layer.borderWidth = 5;
    //边框颜色
    _redView.layer.borderColor = [UIColor greenColor].CGColor;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
