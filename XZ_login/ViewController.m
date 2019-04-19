//
//  ViewController.m
//  XZ_login
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "ZZNavigationViewController.h"
#import "ZZTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)bb:(id)sender {
    
    LoginViewController * lvc = [[LoginViewController alloc] init];
    ZZNavigationViewController * znvc = [[ZZNavigationViewController alloc] initWithRootViewController:lvc];
    [self presentViewController:znvc animated:YES completion:^{
        
    }];
}


@end
