//
//  ViewController.m
//  TimeAnimation
//
//  Created by GE on 15/12/25.
//  Copyright © 2015年 GE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static NSInteger timeOut = 59;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self createUI];
    
}

- (void)createUI
{
    UIImageView * iv = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    iv.animationImages  = [NSArray arrayWithObjects:
                           [UIImage imageNamed:@"progress_1"],
                           [UIImage imageNamed:@"progress_2.png"],
                           [UIImage imageNamed:@"progress_3.png"],
                           [UIImage imageNamed:@"progress_4.png"],
                           [UIImage imageNamed:@"progress_5.png"],
                           [UIImage imageNamed:@"progress_6.png"],
                           [UIImage imageNamed:@"progress_7.png"],
                           [UIImage imageNamed:@"progress_8.png"],
                           nil];
    [iv setAnimationDuration:1.0f];
    [iv setAnimationRepeatCount:0];
    [iv startAnimating];
    [self.view addSubview:iv];
    
    UILabel * numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
    numberLabel.text = [NSString stringWithFormat:@"%d",timeOut];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    numberLabel.textColor = [UIColor whiteColor];
    [iv addSubview:numberLabel];
    
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:numberLabel repeats:YES];
    [timer fire];
    
    
    
    
    
}

- (void)timeChange:(NSTimer *)timer
{
    timeOut --;
    UILabel * timeLabel = timer.userInfo;
    timeLabel.text = [NSString stringWithFormat:@"%d",timeOut];
    if (timeOut == 0) {
        [timer invalidate];
//        [self.btn setTitle:@"重新发送" forState:UIControlStateNormal];
//        timeOut = 10;
        
    }
}



@end
