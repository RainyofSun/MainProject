//
//  Target_A.m
//  A_section
//
//  Created by EGLS_BMAC on 2020/11/5.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Target_A.h"
#import "AViewController.h"

typedef void (^CTUrlRouterCallbackBlock)(NSDictionary *info);

@implementation Target_A

- (UIViewController *)Action_viewController:(NSDictionary *)params {
    AViewController *viewController = [[AViewController alloc] init];
    CTUrlRouterCallbackBlock callBlock0 = [params objectForKey:@"moneyAction"];
    CTUrlRouterCallbackBlock callBlock1 = [params objectForKey:@"userAction"];
    if (callBlock0) {
        callBlock0(@{@"money":@"11111"});
    }
    if (callBlock1) {
        callBlock1(@{@"user":@"nick"});
    }
    return viewController;
}

@end
