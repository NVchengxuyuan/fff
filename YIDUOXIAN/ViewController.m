//
//  ViewController.m
//  YIDUOXIAN
//
//  Created by 张孟春 on 16/9/18.
//  Copyright © 2016年 张孟春. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 300, 50)];
    [self.view addSubview:label];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
