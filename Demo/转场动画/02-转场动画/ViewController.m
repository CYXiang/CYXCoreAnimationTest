//
//  ViewController.m
//  02-转场动画
//
//  Created by Macx on 15/8/23.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    static int i = 2;
    
    
    NSString *name = [NSString stringWithFormat:@"%d",i];
        
    self.imageView.image = [UIImage imageNamed:name];
    i++;
    
    if (i > 3) {
        i = 1;
    }
    
    
    CATransition *anim = [CATransition animation];
    
    anim.type = @"pageCurl";
    
    [self.imageView.layer addAnimation:anim forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
