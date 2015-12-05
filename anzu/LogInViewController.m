//
//  LogInViewController.m
//  anzu
//
//  Created by zawahiro on 2015/11/05.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import "LogInViewController.h"
#import "TopViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    idTxtf.delegate = self;
    passTxtf.delegate = self;
}

- (IBAction)login:(id)sender {
    
//    if ([[idTxtf text] isEqualToString:@"test"] && [[passTxtf text] isEqualToString:@"testpass"]) {
//        
//        
//        //ログイン成功でAPI通信。なんらか返ってきて患者NO取得（暫定 患者NO:1）
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//        //
//        
//        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"KEY_PATIENCE_ID"];
//        //
//        //
//        //
//        //
//        
    
        TopViewController *top = [[TopViewController alloc]initWithNibName:@"TopViewController" bundle:nil];
        [self.navigationController pushViewController:top animated:YES];
//    }
//    else {
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"確認" message:@"IDとパスワードが一致しません。" preferredStyle:UIAlertControllerStyleAlert];
//        
//        // addActionした順に左から右にボタンが配置されます
//        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//            // otherボタンが押された時の処理
//            
//        }]];
//        
//        [self presentViewController:alertController animated:YES completion:nil];
//    }
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
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
