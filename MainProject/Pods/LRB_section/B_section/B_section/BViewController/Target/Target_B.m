//
//  Target_B.m
//  MainProject
//
//  Created by EGLS_BMAC on 2020/11/5.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Target_B.h"
#import "BViewController.h"

@implementation Target_B

- (UIViewController *)Action_viewController:(NSDictionary *)params {
    NSString *context = [params objectForKey:@"contentText"];
    BViewController *bViewController = [[BViewController alloc] init];
    [bViewController setContext:context];
    return bViewController;
}

@end
