//
//  ViewController.m
//  XZ_login
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "ZZTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)bb:(id)sender {
    LoginViewController * lvc = [[[LoginViewController alloc] init] initView];
    [self presentViewController:lvc animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
