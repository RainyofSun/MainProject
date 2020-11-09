//
//  CTMediator+A.h
//  A_Category
//
//  Created by EGLS_BMAC on 2020/11/5.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import <CTMediator/CTMediator.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (A)

- (UIViewController *)A_aViewControllerMoneyAction:(void(^)(NSDictionary *info))moneyAction userAction:(void(^)(NSDictionary *info))userAction;

@end

NS_ASSUME_NONNULL_END
