//
//  ViewController.m
//  02-图片折叠
//
//  Created by Macx on 15/8/23.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topImageV;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImageV;


@property (strong, nonatomic) CAGradientLayer *layer;
@end

@implementation ViewController

- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    
    CGPoint transP = [sender locationInView:sender.view];
    
    CGFloat angle = transP.y/200*M_PI;
    
    CATransform3D transfrom = CATransform3DIdentity;
    transfrom.m34 = -1/400.0;
    
    self.topImageV.layer.transform = CATransform3DRotate(transfrom, -angle, 1, 0, 0);
    
    _layer.opacity = transP.y/200;
    
    //手指抬起，恢复形变
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        //Damping：弹性系数
        //initialSpringVelocity：弹性效果的初始化速度
        //options:动画执行过程
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            //还原顶部动画
            _topImageV.layer.transform = CATransform3DIdentity;
            _layer.opacity = 0;
        } completion:^(BOOL finished) {
            
        }];
        
        
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置topImage中的图层只显示上半部分的图
    _topImageV.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    //显示下半部分
    _bottomImageV.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    
    _topImageV.layer.anchorPoint = CGPointMake(0.5, 1);
    _bottomImageV.layer.anchorPoint = CGPointMake(0.5, 1);
    
    //添加阴影
    //渐变层
    CAGradientLayer *layer = [CAGradientLayer layer];
    
    layer.frame = _bottomImageV.bounds;
    //渐变层颜色
    layer.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor];
    
    //设置不透明 0:透明
    layer.opacity = 0;
    
    _layer = layer;
    
    [_bottomImageV.layer addSublayer:layer];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
