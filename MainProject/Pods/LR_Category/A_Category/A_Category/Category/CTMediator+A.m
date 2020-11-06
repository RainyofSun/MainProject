//
//  CTMediator+A.m
//  A_Category
//
//  Created by EGLS_BMAC on 2020/11/5.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "CTMediator+A.h"

@implementation CTMediator (A)

- (UIViewController *)A_aViewController {
    return [self performTarget:@"A" action:@"viewController" params:nil shouldCacheTarget:NO];
}

@end
