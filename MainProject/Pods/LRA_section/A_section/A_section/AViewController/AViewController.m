//
//  AViewController.m
//  MainProject
//
//  Created by EGLS_BMAC on 2020/11/5.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "AViewController.h"
#import "CTMediator+B.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"A Module";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[[CTMediator sharedInstance] B_viewControllerWithContentText:@"hello world"] animated:YES];
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
