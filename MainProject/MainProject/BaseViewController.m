//
//  BaseViewController.m
//  MainProject
//
//  Created by EGLS_BMAC on 2020/11/5.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "BaseViewController.h"
#import "CTMediator+A.h"

@interface BaseViewController ()

/** timeLab */
@property (nonatomic,strong) UILabel *timeLab;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"我是base";
    [self.view addSubview:self.timeLab];
    self.timeLab.frame = CGRectMake(100, 100, 80, 80);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTime:) name:@"speed" object:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController  pushViewController:[[CTMediator sharedInstance] A_aViewControllerMoneyAction:^(NSDictionary * _Nonnull info) {
        NSLog(@"money info %@",info);
    } userAction:^(NSDictionary * _Nonnull info) {
        NSLog(@"userInfo %@",info);
    }] animated:YES];
}

- (void)showTime:(NSNotification *)notification {
    [self.timeLab setText:[NSString stringWithFormat:@"时间: %@s",(NSNumber *)notification.object]];
}

#pragma mark - lazy
- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
    }
    return _timeLab;
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
