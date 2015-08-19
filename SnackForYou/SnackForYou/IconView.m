//
//  IconView.m
//  SnackForYou
//
//  Created by JinWei on 15/8/19.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import "IconView.h"


@interface IconView()

- (IBAction)QQBtnClick;
- (IBAction)WeiChatBtnClick;
- (IBAction)SinaBtnClick;



@end

@implementation IconView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)QQBtnClick {
    
    [ShareSDK getUserInfoWithType:ShareTypeQQSpace authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            NSLog(@"QQ空间授权成功！");
            NSLog(@"uid:%@",[userInfo uid]);
            NSLog(@"nickname:%@",[userInfo nickname]);
            NSLog(@"profileImage:%@",[userInfo profileImage]);
            UIAlertView* alverView = [[UIAlertView alloc]initWithTitle:nil message:@"授权成功，信息请看控制台" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            [alverView show];
            
        }else{
            UIAlertView* alverView = [[UIAlertView alloc]initWithTitle:nil message:@"授权失败" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            [alverView show];
            NSLog(@"QQ空间授权失败");
            NSLog(@"错误码:%ld,错误描述:%@",(long)[error errorCode],[error errorDescription]);
        }
    }];
    
}

- (IBAction)WeiChatBtnClick {
    
    [ShareSDK getUserInfoWithType:ShareTypeWeixiSession authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            NSLog(@"微信授权成功！");
            NSLog(@"uid:%@",[userInfo uid]);
            NSLog(@"nickname:%@",[userInfo nickname]);
            NSLog(@"profileImage:%@",[userInfo profileImage]);
            UIAlertView* alverView = [[UIAlertView alloc]initWithTitle:nil message:@"授权成功，信息请看控制台" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            [alverView show];
            
        }else{
            UIAlertView* alverView = [[UIAlertView alloc]initWithTitle:nil message:@"授权失败" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            [alverView show];
            NSLog(@"微信授权失败");
            NSLog(@"错误码:%ld,错误描述:%@",(long)[error errorCode],[error errorDescription]);
        }
    }];
    
}

- (IBAction)SinaBtnClick {
    
    
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            NSLog(@"新浪微博授权成功！");
            NSLog(@"uid:%@",[userInfo uid]);
            NSLog(@"nickname:%@",[userInfo nickname]);
            NSLog(@"profileImage:%@",[userInfo profileImage]);
            UIAlertView* alverView = [[UIAlertView alloc]initWithTitle:nil message:@"授权成功，信息请看控制台" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            [alverView show];
            
        }else{
            UIAlertView* alverView = [[UIAlertView alloc]initWithTitle:nil message:@"授权失败" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil];
            [alverView show];
            NSLog(@"新浪微博授权失败");
            NSLog(@"错误码:%ld,错误描述:%@",(long)[error errorCode],[error errorDescription]);
        }
    }];
    
}


@end
