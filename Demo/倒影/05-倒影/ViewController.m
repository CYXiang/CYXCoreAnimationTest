//
//  ViewController.m
//  05-倒影
//
//  Created by Macx on 15/8/23.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAReplicatorLayer *replayer = (CAReplicatorLayer *)self.view.layer;
    
    replayer.instanceCount = 2;
    
    replayer.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    
    replayer.instanceRedOffset -= 0.1;
    replayer.instanceGreenOffset -= 0.1;
    replayer.instanceBlueOffset -= 0.1;
    replayer.instanceAlphaOffset -= 0.1;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
