//
//  DateReservation.m
//  anzu
//
//  Created by zawahiro on 2015/12/04.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import "DateReservation.h"

@interface DateReservation ()

@end

@implementation DateReservation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [self oneWeekDateWithEnableWeekdayType:YSWeekdayTypeMonday | YSWeekdayTypeTuesday | YSWeekdayTypeWednesday]);
}

- (NSDateComponents*)dateAndTimeComponents:(NSDate *)date
{
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [cal components:( NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute ) fromDate:date];
}

- (NSArray *)oneWeekDateWithEnableWeekdayType:(YSWeekdayType)type
{
    if (type == 0) {
        return nil;
    }
    // selfを含むその日からの1週間を取得
    NSUInteger oneWeekNum = 7;
    NSMutableDictionary *oneWeekDict = [NSMutableDictionary dictionaryWithCapacity:oneWeekNum];
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    for (int i = 0; i < oneWeekNum; i++) {
        NSDate* now = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone] secondsFromGMT]];
        NSDateComponents *comp = [self dateAndTimeComponents:now];
        [comp setDay:comp.day + i];
        NSDate *newDate = [cal dateFromComponents:comp];
        NSDateComponents * newComp = [self dateAndTimeComponents:newDate];
        [oneWeekDict setObject:newComp forKey:[NSString stringWithFormat:@"%ld", (long)newComp.weekday]];
    }
    
    // 取得した1週間から有効な曜日のみを抜き出す
    NSMutableArray *resultArr= [NSMutableArray array];
    YSWeekdayType compType = type;
    // NSDateComponentsのweekdayの値は1〜7(日〜土)
    for (int i = 1; i <= oneWeekNum; i++) {
        if (compType % 2 == 1) {
            NSDateComponents *comp = [oneWeekDict objectForKey:[NSString stringWithFormat:@"%d", i]];
            [resultArr addObject:[cal dateFromComponents:comp]];
        }
        compType >>= 1;
    }
    return resultArr;
}

- (IBAction)selectWeekday:(id)sender {
    UIButton *btn = sender;
    
    if (!btn.selected) {
        btn.selected = YES;
//        [btn setBackgroundColor:[UIColor redColor]];
        
    }
    else {
        btn.selected = NO;
//        btn.backgroundColor = [UIColor whiteColor];
    }
    
}

-(IBAction)closeCalender:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
