//
//  MainTabBarController.m
//  PractiseDemo
//
//  Created by BearClawr on 16/9/14.
//  Copyright © 2016年 BearClawr. All rights reserved.
//

#import "MainTabBarController.h"

#import "HomePageViewController.h"
#import "GoHomeViewController.h"
#import "SquareViewController.h"
#import "PersonViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createSubViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark- 子视图控制器设置
- (void)createSubViewController{
    HomePageViewController *homePage=[[HomePageViewController alloc] init];
    [self setupSubViewController:homePage
                       WithTitle:@"首页"
                 WithSelectImage:GetImage(@"home_highlight")
               WithUnSelectImage:GetImage(@"home_normal")];
    
    GoHomeViewController *goHome=[[GoHomeViewController alloc] init];
    [self setupSubViewController:goHome
                       WithTitle:@"到家"
                 WithSelectImage:GetImage(@"message_highlight")
               WithUnSelectImage:GetImage(@"message_normal")];
    
    SquareViewController *square=[[SquareViewController alloc] init];
    [self setupSubViewController:square
                       WithTitle:@"广场"
                 WithSelectImage:GetImage(@"mycity_highlight")
               WithUnSelectImage:GetImage(@"mycity_normal")];
    
    PersonViewController *personController=[[PersonViewController alloc] init];
    [self setupSubViewController:personController
                       WithTitle:@"个人中心"
                 WithSelectImage:GetImage(@"account_highlight")
               WithUnSelectImage:GetImage(@"account_normal")];
}

- (void)setupSubViewController:(UIViewController *)controller WithTitle:(NSString *)title WithSelectImage:(UIImage *)selectImage WithUnSelectImage:(UIImage *)unSelectImage{
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:controller];
    
    [navigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBA(254, 160, 14, 1)}
                                                   forState:UIControlStateSelected];
    [navigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBA(0, 0, 0, 1)}
                                                   forState:UIControlStateNormal];
    [navigationController.tabBarItem setTitle:title];
    
    navigationController.tabBarItem.image=[unSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationController.tabBarItem.selectedImage=[selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:navigationController];
    
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
