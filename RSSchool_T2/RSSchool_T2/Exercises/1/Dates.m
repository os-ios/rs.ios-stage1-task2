#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSString *result;
    
    // convert (day, month, year) to NSString
    NSString *inputString = [NSString stringWithFormat:@"%2@-%2@-%4@", day, month, year];
    
    // build NSDate from inputString
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"dd-MM-yyyy"; //  input format
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    NSDate *date = [dateFormatter dateFromString: inputString];

    if (date == nil) {
        result = @"Такого дня не существует";
    } else {
        dateFormatter.dateFormat = @"dd MMMM, EEEE"; // output format
        result = [dateFormatter stringFromDate:date];
    }
    
    return result;
}

@end
