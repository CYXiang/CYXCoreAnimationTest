//
//  ViewController.m
//  822-02-时钟demo
//
//  Created by Macx on 15/8/22.
//  Copyright (c) 2015年 CYX. All rights reserved.
//

#import "ViewController.h"

#define kPerSecondA 6
#define kPerMinuteA 6
#define kPerHourA 30

#define kPerMinhourA 0.5

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clockView;

/** <#注释#> */
@property (nonatomic,weak) CALayer * secLayer;

@property (nonatomic,weak) CALayer * minLayer;

@property (nonatomic,weak) CALayer * hourLayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpSecLayer];
    
    [self setUpMinLayer];
    
    [self setUpHourLayer];
    
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    [self timeChange];
}

- (void)timeChange{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dataCmp = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    
    
    NSInteger sec = dataCmp.second;
    
    CGFloat secA = (sec * kPerSecondA) / 180.0 * M_PI;
    
    _secLayer.transform = CATransform3DMakeRotation(secA, 0, 0, 1);
}



- (void)setUpSecLayer{
    CALayer *layer = [CALayer layer];
    
    _secLayer = layer;
    
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    layer.position = CGPointMake(_clockView.bounds.size.width * 0.5, _clockView.bounds.size.height * 0.5);
    
    layer.anchorPoint = CGPointMake(0.5, 1);
    
    layer.bounds = CGRectMake(0, 0, 1, 80);
    
    [_clockView.layer addSublayer:layer];
}
- (void)setUpMinLayer{
    CALayer *layer = [CALayer layer];
    
    _minLayer = layer;
    
    layer.backgroundColor = [UIColor blackColor].CGColor;
    
    layer.position = CGPointMake(_clockView.bounds.size.width * 0.5, _clockView.bounds.size.height * 0.5);
    
    layer.anchorPoint = CGPointMake(0.5, 1);
    
    layer.bounds = CGRectMake(0, 0, 1, 70);
    
    [_clockView.layer addSublayer:layer];
}
- (void)setUpHourLayer{
    CALayer *layer = [CALayer layer];
    
    _hourLayer = layer;
    
    layer.backgroundColor = [UIColor blackColor].CGColor;
    
    layer.position = CGPointMake(_clockView.bounds.size.width * 0.5, _clockView.bounds.size.height * 0.5);
    
    layer.anchorPoint = CGPointMake(0.5, 1);
    
    layer.bounds = CGRectMake(0, 0, 2, 60);
    
    [_clockView.layer addSublayer:layer];
}



@end
