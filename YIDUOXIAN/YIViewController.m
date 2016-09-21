//
//  YIViewController.m
//  YIDUOXIAN
//
//  Created by 张孟春 on 16/9/18.
//  Copyright © 2016年 张孟春. All rights reserved.
//

#import "YIViewController.h"

@interface YIViewController (){
    
    UIWebView * webView;
}


@end

@implementation YIViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//
//    //相对于上面的接口，这个接口可以动画的改变statusBar的前景色
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 0)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://shop.yiduoxian.com/"]];
    //    http://shop.yiduoxian.com/   易多鲜
    //    http://www.gmykj.com/   格美云
    [self.view addSubview: webView];
    [webView loadRequest:request];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
