//
//  ReservationListViewController.h
//  anzu
//
//  Created by zawahiro on 2015/12/01.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReservationListViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,NSURLSessionDelegate,NSURLSessionDownloadDelegate,NSURLSessionDataDelegate> {
    
    IBOutlet UITableView *table;
    NSMutableArray *reserveAry;
    NSArray *jsonAry;
}

@end
