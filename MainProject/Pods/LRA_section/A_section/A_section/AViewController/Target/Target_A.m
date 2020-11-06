//
//  Target_A.m
//  A_section
//
//  Created by EGLS_BMAC on 2020/11/5.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "Target_A.h"
#import "AViewController.h"

@implementation Target_A

- (UIViewController *)Action_viewController:(NSDictionary *)params {
    AViewController *viewController = [[AViewController alloc] init];
    return viewController;
}

@end
