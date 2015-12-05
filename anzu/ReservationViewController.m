//
//  ReservationViewController.m
//  anzu
//
//  Created by zawahiro on 2015/11/05.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import "ReservationViewController.h"
#import "ReservationListViewController.h"
#import "Calender.h"
#import "DateReservation.h"

@interface ReservationViewController ()

@end

@implementation ReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"予約管理";
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"予約一覧" style:UIBarButtonItemStylePlain target:self action:@selector(showReservationList)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (IBAction)showCalender:(id)sender {
    Calender *calender = [[Calender alloc]initWithNibName:@"Calender" bundle:nil];
    [self presentViewController:calender animated:YES completion:nil];
    
}

- (IBAction)showDateReservation:(id)sender {
    DateReservation *datereservation = [[DateReservation alloc]initWithNibName:@"DateReservation" bundle:nil];
    [self presentViewController:datereservation animated:YES completion:nil];
    
}

- (void)showReservationList {
    
    ReservationListViewController *reserveList = [[ReservationListViewController alloc]initWithNibName:@"ReservationListViewController" bundle:nil];
    [self.navigationController pushViewController:reserveList animated:YES];
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
