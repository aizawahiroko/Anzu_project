//
//  TopViewController.m
//  anzu
//
//  Created by zawahiro on 2015/11/05.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import "TopViewController.h"
#import "ReservationViewController.h"
#import "PatienceInfoViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] init];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    barButton.title = @"";
    self.navigationItem.backBarButtonItem = barButton;
}


- (IBAction)toNextView:(id)sender {
    
    UIViewController *nextVC = nil;
    
    if ([sender tag] == 0) {
        ReservationViewController *reserv = [[ReservationViewController alloc]initWithNibName:@"ReservationViewController" bundle:nil];
        nextVC = reserv;
    }
    else {
        PatienceInfoViewController *patience = [[PatienceInfoViewController alloc]initWithNibName:@"PatienceInfoViewController" bundle:nil];
        nextVC = patience;
    }
    
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
