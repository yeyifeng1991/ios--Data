//
//  ViewController.m
//  xinxuan
//
//  Created by 叶子 on 2017/10/24.
//  Copyright © 2017年 叶义峰. All rights reserved.
//

#import "ViewController.h"
#import "UIBarButtonItem+Common.h"
#import "LeftMenuViewDemo.h"
#import "MenuView.h"
@interface ViewController ()<HomeMenuViewDelegate>
@property (nonatomic ,strong)MenuView      *menu;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviagtion];
    //左边的视图继承于UIView
    LeftMenuViewDemo *demo = [[LeftMenuViewDemo alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * 0.8, [[UIScreen mainScreen] bounds].size.height)];//设置左边的view的frame 宽度为屏幕的0.8
    demo.customDelegate = self;
    
    MenuView *menu = [MenuView MenuViewWithDependencyView:self.view MenuView:demo isShowCoverView:YES];
    self.menu = menu;
    
}
-(void)LeftMenuViewClick:(NSInteger)tag{
    [self.menu hidenWithAnimation];
    NSLog(@"点击的是哪一行----%ld",tag);
    
}

- (void)setNaviagtion
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithBtnImage:[UIImage imageNamed:@"ic_home"] target:self action:@selector(ShowSideView)];
    
    NSDate * date = [NSDate date];
    NSDateFormatter * fm = [[NSDateFormatter alloc]init];
    [fm setDateFormat:@"MM.dd"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithBtnTitle:[NSString stringWithFormat:@"今%@",[fm stringFromDate:date]] target:self action:nil];
    
}
-(void)ShowSideView
{
    NSLog(@"---- 显示侧滑出来的界面 ----");
    [self.menu show];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
