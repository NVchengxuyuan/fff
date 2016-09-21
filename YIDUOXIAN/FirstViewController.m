//
//  FirstViewController.m
//  YIDUOXIAN
//
//  Created by 张孟春 on 16/9/18.
//  Copyright © 2016年 张孟春. All rights reserved.
//

#import "FirstViewController.h"
#import "YIViewController.h"

@interface FirstViewController ()

@end
#define kImageCount 4
@implementation FirstViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    //程序
//    [user setBool:YES forKey:@"first"];
//    if (![user valueForKey:@"first"]) {
//        NSLog(@"123456789");
//    }else {
    
    [self setUpScorllView];
    [self setUpPageScroll];
//    }
    // Do any additional setup after loading the view.
}
- (void)setUpScorllView{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //设置ScrollView的容量区域大小
    scroll.contentSize = CGSizeMake(self.view.frame.size.width * kImageCount, self.view.frame.size.width);
    //整页滑动
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    //设置代理
    scroll.delegate = self;
    [self.view addSubview:scroll];
    
    //放置引导图片
    for (int i = 0; i < kImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width *i, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [imageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"leader%d",i + 1] ofType:@"png"]]];
        [scroll addSubview:imageView];
        
        //最后一张添加轻拍手势
        if(i == kImageCount - 1) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(self.view.frame.size.width/2 - 50 , self.view.frame.size.height - 80, 100, 40);
            [btn setTitle:@"快速体验" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:20];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor whiteColor];
            [btn.layer setMasksToBounds:YES];
            [btn.layer setCornerRadius:10.0];//设置矩形四个圆角半径
            
            [btn addTarget:self action:@selector(handlePUsh:) forControlEvents:UIControlEventTouchUpInside];
            [imageView addSubview:btn];
            //打开用户交互
            imageView.userInteractionEnabled = YES;
            // [tap release];
        }
    }
}


- (void)setUpPageScroll{
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200) / 2,self.view.frame.size.height - 40,200,30)];
    page.numberOfPages = kImageCount;//总页数
    page.tag = 110;//标记tag
    page.pageIndicatorTintColor = [UIColor lightGrayColor];//颜色
    page.currentPageIndicatorTintColor = [UIColor whiteColor];//当前页的颜色
    [self.view addSubview:page];
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:110];
    page.currentPage = scrollView.contentOffset.x/self.view.frame.size.width;
}

//轻拍进入程序主页面
- (void)handlePUsh:(UIButton *)sender{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    //程序
    [user setBool:YES forKey:@"first"];
    [user synchronize];
    YIViewController  *mainVC = [[YIViewController alloc] init];
    //更改window的根视图控制器，为主界面的视图控制器mainVC；
    [UIApplication sharedApplication].keyWindow.rootViewController = mainVC ;
    NSLog(@"user %@", [user valueForKey:@"first"] );
    
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
