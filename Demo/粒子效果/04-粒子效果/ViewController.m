//
//  ViewController.m
//  04-粒子效果
//
//  Created by Macx on 15/8/23.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "ViewController.h"
#import "drawView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet drawView *drawView;

@end

@implementation ViewController
- (IBAction)starDrow:(UIButton *)sender {
    [self.drawView startAnim];
    
}
- (IBAction)repDraw:(UIButton *)sender {
    [self.drawView reDraw];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
