//
//  ViewController.m
//  06-音量振动条
//
//  Created by Macx on 15/8/24.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "ViewController.h"

#define keyPath(objc,keyPath) @(((void)objc.keyPath, #keyPath))

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加复制层到contentView
    CAReplicatorLayer *repLater = [CAReplicatorLayer layer];
   
    repLater.frame = _contentView.bounds;
    
    int count = 7;
    
    repLater.instanceCount = count;
    
    repLater.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    
    repLater.instanceDelay = .2;
    
    [_contentView.layer addSublayer:repLater];
    
    //添加音量振动条到复制层
    CALayer *redView = [CALayer layer];
    
    redView.position = CGPointMake(0, 200);
    
    redView.anchorPoint = CGPointMake(0, 1);
    
    redView.bounds = CGRectMake(0, 0, 20, 100);
    
    redView.backgroundColor = [UIColor redColor].CGColor;
    
    [repLater addSublayer:redView];
    
    //添加动画到redView
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"transform.scale.y";
    
    anim.toValue = @0;
    
    anim.duration = .3;
    
    anim.repeatCount = MAXFLOAT;
    
    anim.autoreverses = YES;
    
    [redView addAnimation:anim forKey:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
