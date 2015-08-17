//
//  AboutUsController.m
//  SnackForYou
//
//  Created by JinWei on 15/8/17.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import "AboutUsController.h"

@interface AboutUsController ()
@property (weak, nonatomic) IBOutlet UIWebView *htmlWebView;

@end

@implementation AboutUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString * path = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"];
    [self.htmlWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:path]]];
    


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
