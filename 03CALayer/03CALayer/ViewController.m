//
//  ViewController.m
//  03CALayer
//
//  Created by jgh on 15/12/10.
//  Copyright © 2015年 jgh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 3)];
    containerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:containerView];
    
    self.layer = [CALayer layer];
    self.layer.frame = containerView.bounds;
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
