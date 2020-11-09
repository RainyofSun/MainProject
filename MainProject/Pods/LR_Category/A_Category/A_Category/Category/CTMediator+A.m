//
//  CTMediator+A.m
//  A_Category
//
//  Created by EGLS_BMAC on 2020/11/5.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "CTMediator+A.h"

@implementation CTMediator (A)

- (UIViewController *)A_aViewControllerMoneyAction:(void (^)(NSDictionary * _Nonnull))moneyAction userAction:(void (^)(NSDictionary * _Nonnull))userAction {
    NSMutableDictionary *paramsToSend = [NSMutableDictionary dictionary];
    if (moneyAction) {
        [paramsToSend setObject:moneyAction forKey:@"moneyAction"];
    }
    if (userAction) {
        [paramsToSend setObject:userAction forKey:@"userAction"];
    }
    return [self performTarget:@"A" action:@"viewController" params:paramsToSend shouldCacheTarget:NO];
}

@end
