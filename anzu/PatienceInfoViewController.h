//
//  PatienceInfoViewController.h
//  anzu
//
//  Created by zawahiro on 2015/11/05.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatienceInfoViewController : UIViewController<NSURLSessionDelegate,NSURLSessionDownloadDelegate,NSURLSessionDataDelegate,UITextFieldDelegate> {
    
    IBOutlet UITextField *patienceNoTextf;
    IBOutlet UITextField *hospitalNoTextf;
    IBOutlet UITextField *patienceNameTextf;
    IBOutlet UITextField *patienceTelTextf;
    
    NSArray *jsonAry;
    
    NSString *patienceNoStr;
    NSString *hospitalNoStr;
    NSString *patienceNameStr;
    NSString *patienceTelStr;
}


@end
