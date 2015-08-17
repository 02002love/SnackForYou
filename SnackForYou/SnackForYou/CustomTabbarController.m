//
//  CustomTabbarController.m
//  SnackForYou
//
//  Created by JinWei on 15/8/17.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import "CustomTabbarController.h"

@interface CustomTabbarController ()

@end

@implementation CustomTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray * selectedArray = @[@"Btn_NaviBar_Home_selected_20x20~iphone",@"Btn_NaviBar_Class_selected_20x20~iphone",@"Btn_NaviBar_Subject_selected_20x20~iphone",@"Btn_NaviBar_Mine_selected_20x20~iphone"];
    
    NSArray * unselectedArray = @[@"Btn_NaviBar_Home_20x20~iphone",@"Btn_NaviBar_Class_20x20~iphone",@"Btn_NaviBar_Subject_normal_20x20~iphone",@"Btn_NaviBar_Mine_20x20~iphone"];
    NSArray * title = @[@"首页",@"分类",@"专题",@"我的"];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"Tabbg"]];
    for (int i = 0; i< self.tabBar.items.count; i++) {
        UITabBarItem * item = self.tabBar.items[i];
        UIImage  * selectedImage = [UIImage imageNamed:selectedArray[i]];
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage  * unselectedImage = [UIImage imageNamed:unselectedArray[i]];
        unselectedImage = [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item = [item initWithTitle:title[i] image:unselectedImage selectedImage:selectedImage];
        [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:12],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    }
    
    
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
