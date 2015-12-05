//
//  ViewController.h
//  handmadeCalenderSampleOfObjectiveC
//
//  Created by 酒井文也 on 2014/11/04.
//  Copyright (c) 2014年 just1factory. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Calender : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,NSURLSessionDelegate,NSURLSessionDownloadDelegate,NSURLSessionDataDelegate,UITableViewDataSource,UITableViewDelegate> {
    IBOutlet UINavigationItem *navititle;
    UIView *picBaseV;
    NSArray *timeAry;
    NSDate *selectedDate;
    BOOL _isShownPicker;
    NSString *reserveDateStr;
    UITableView *table;
    NSMutableArray *reserveAry;
}


@end

