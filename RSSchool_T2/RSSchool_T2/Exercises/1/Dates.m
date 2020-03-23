#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSString *result;

    NSString *inputString = [NSString stringWithFormat:@"%2@-%2@-%4@", day, month, year];

    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"dd-MM-yyyy"; //  input format
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    dateFormatter.locale = locale;
    NSDate *date = [dateFormatter dateFromString: inputString];

    if (date == nil) {
        result = @"Такого дня не существует";
    } else {
        dateFormatter.dateFormat = @"dd MMMM, EEEE"; // output format
        result = [dateFormatter stringFromDate:date];
    }
    
    [locale release];
    [dateFormatter release];
    
    return result;
}

@end
