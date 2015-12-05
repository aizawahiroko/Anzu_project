//
//  PatienceInfoViewController.m
//  anzu
//
//  Created by zawahiro on 2015/11/05.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import "PatienceInfoViewController.h"

@interface PatienceInfoViewController ()

@end

@implementation PatienceInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    patienceNameTextf.returnKeyType = UIReturnKeyDone;
    patienceNoTextf.returnKeyType = UIReturnKeyDone;
    patienceTelTextf.returnKeyType = UIReturnKeyDone;
    hospitalNoTextf.returnKeyType = UIReturnKeyDone;
    
    patienceNameTextf.delegate = self;
    patienceNoTextf.delegate = self;
    patienceTelTextf.delegate = self;
    hospitalNoTextf.delegate = self;
    
    
    NSString *urlStr = @"http://practice-manager-dev.matrix.jp/practiceManager/API/patientInfoList.php?no=1";
    NSURL *url = [NSURL URLWithString:urlStr];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil  ];
    
    NSURLSessionDataTask *jsonData = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *) response;
            if (httpResp.statusCode == 200) {
                NSError *jsonError;
                jsonAry = [NSArray array];
                jsonAry = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                if (!jsonError) {
                    // something for json data
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // something after parsing json data
                        NSLog(@"json 患者情報 = %@",jsonAry);
                        [self setPatienceInfo];
                    });
                }
            }
        }
    }];
  
    [jsonData resume];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = @"患者情報";
    
}


//患者情報セット
- (void)setPatienceInfo {
    NSDictionary *dic = [NSDictionary dictionary];
    dic = [jsonAry objectAtIndex:0];
    
    
    //変更前、今現在の情報を保持
    patienceNoStr = [dic objectForKey:@"no"];
    hospitalNoStr = [dic objectForKey:@"practice_info_no"];
    patienceNameStr = [dic objectForKey:@"name"];
    patienceTelStr = [dic objectForKey:@"tel"];
    
    patienceNoTextf.text = patienceNoStr;
    hospitalNoTextf.text = hospitalNoStr;
    patienceNameTextf.text = patienceNameStr;
    patienceTelTextf.text = patienceTelStr;
}


- (IBAction)updateInfo:(id)sender {
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"確認" message:@"患者情報を変更します。よろしいでしょうか？" preferredStyle:UIAlertControllerStyleAlert];
    
    // addActionした順に左から右にボタンが配置されます
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // otherボタンが押された時の処理
        
        NSString *baseUrlStr = @"http://practice-manager-dev.matrix.jp/practiceManager/API/patientInfoUpdate.php?";
        NSString *encodedNameStr = [patienceNameTextf.text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
        NSString *postStr = [NSString stringWithFormat:@"no=%@&practiceInfoNo=%@&name=%@&tel=%@",patienceNoTextf.text,hospitalNoTextf.text,encodedNameStr,patienceTelTextf.text];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseUrlStr,postStr]];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil  ];
        
        NSURLSessionDataTask *jsonData = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (!error) {
                NSHTTPURLResponse *httpResp = (NSHTTPURLResponse *) response;
                if (httpResp.statusCode == 200) {
                    NSError *jsonError;
                    jsonAry = [NSArray array];
                    jsonAry = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                    if (!jsonError) {
                        // something for json data
                        dispatch_async(dispatch_get_main_queue(), ^{
                            
                            
                            
                        });
                    }
                }
            }
        }];
        
        [jsonData resume];
        
        UIAlertController *doneAlert = [UIAlertController alertControllerWithTitle:@"確認" message:@"変更しました。" preferredStyle:UIAlertControllerStyleAlert];
        [doneAlert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // cancelボタンが押された時の処理
            
        }]];
        [self presentViewController:doneAlert animated:YES completion:nil];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // cancelボタンが押された時の処理
   
    }]];

    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

- (IBAction)resetInfo:(id)sender {
    
    patienceNoTextf.text = patienceNoStr;
    hospitalNoTextf.text = hospitalNoStr;
    patienceNameTextf.text = patienceNameStr;
    patienceTelTextf.text = patienceTelStr;
}
    
//    // 送信する URL とパラメータ
//    NSString *url = @"http://practice-manager-dev.matrix.jp/practiceManager/API/patientInfoUpdate.php";
//    NSDictionary *params = @{
//                             @"name": @"test04",
//                             @"no": @"4",
//                             @"practiceInfoNo": @"10",
//                             @"tel": @"123456",
//                             };
//    
//    // 連想配列として与えられたパラメータをクエリ文字列に変換する
//    NSData *query = [self buildQueryWithDictionary: params];
//    
//    // リクエストの種類、ヘッダを設定する
//    NSMutableURLRequest *request = [NSMutableURLRequest
//                                    requestWithURL: [NSURL URLWithString: url]
//                                    cachePolicy: NSURLRequestUseProtocolCachePolicy
//                                    timeoutInterval: 10.0];
//    
//    [request setHTTPMethod: @"POST"];
//    [request setValue: @"application/x-www-form-urlencoded"  forHTTPHeaderField: @"Content-Type"];
//    [request setValue: [NSString stringWithFormat: @"%lu", (unsigned long)[query length]]  forHTTPHeaderField: @"Content-Length"];
//    [request setHTTPBody: query];
//    
//    // 共有セッションを取得し、サーバにリクエストを行う
//    NSURLSession *session = [NSURLSession sharedSession];
//    
//    [[session dataTaskWithRequest: request  completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
//        
//        // レスポンスが成功か失敗かを見てそれぞれ処理を行う
//        if (response && ! error) {
//            NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData: data  options: NSJSONReadingAllowFragments  error: nil];
//            if (responseData) {
//                NSLog(@"成功: %@", responseData);
//            }
//            else {
//                NSLog(@"JSON 形式でない: %@", [[NSString alloc] initWithData: data  encoding: NSUTF8StringEncoding]);
//            }
//        }
//        else {
//            NSLog(@"失敗: %@", error);
//        }
//        
//    }] resume];
//}
//
//// クエリ文字列を得る
//- (NSData *) buildQueryWithDictionary: (NSDictionary *)params
//{
//    // 連想配列のキーと値をそれぞれ URL エンコードし、 key=value の形で配列に追加していく
//    NSMutableArray *parts = [NSMutableArray array];
//    for (id key in params) {
//        [parts addObject: [NSString stringWithFormat: @"%@=%@",
//                           [self encodeURIComponent: (NSString *)key],
//                           [self encodeURIComponent: (NSString *)[params objectForKey: key]]]];
//    }
//    
//    // それぞれを & で結ぶ
//    NSString *queryString = [parts componentsJoinedByString: @"&"];
//    
//    // NSURLRequest setHTTPBody: に渡せるよう NSData に変換する
//    return [queryString dataUsingEncoding: NSUTF8StringEncoding];
//}
//
//// JavaScript の encodeURIComponent() 相当
//- (NSString *) encodeURIComponent: (NSString *)string
//{
//    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, CFSTR(";:@&=+$,/?%#[]"), kCFStringEncodingUTF8);
//}

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
