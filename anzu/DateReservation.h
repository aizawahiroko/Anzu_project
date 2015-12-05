//
//  DateReservation.h
//  anzu
//
//  Created by zawahiro on 2015/12/04.
//  Copyright © 2015年 aizawa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    YSWeekdayTypeSunday = 1 << 0,
    YSWeekdayTypeMonday = 1 << 1,
    YSWeekdayTypeTuesday = 1 << 2,
    YSWeekdayTypeWednesday = 1 << 3,
    YSWeekdayTypeThursday = 1 << 4,
    YSWeekdayTypeFriday = 1 << 5,
    YSWeekdayTypeSaturday = 1 << 6,
} YSWeekdayType;

@interface DateReservation : UIViewController {
    
    
}

- (NSDateComponents*)dateAndTimeComponents:(NSDate *)date;
- (NSArray*)oneWeekDateWithEnableWeekdayType:(YSWeekdayType)type;

@end
