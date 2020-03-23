#import "TimeConverter.h"

@implementation TimeConverter

static NSArray<NSString *> *nums;

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        nums = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen", @"twenty", @"twenty one", @"twenty two", @"twenty three", @"twenty four", @"twenty five", @"twenty six", @"twenty seven", @"twenty eight", @"twenty nine"];
    }
    return self;
}

// Complete the following function
- (NSString *)convertFromHours:(NSString *)hours minutes:(NSString *)minutes {
    int h = [hours intValue];
    int m = [minutes intValue];

    if (h < 0 || h > 24 || m < 0 || m > 60) {
        return @"";
    }

    if (m == 0)
        return [NSString stringWithFormat:@"%@%@", nums[h], @" o' clock"];
    else if (m == 1)
        return [NSString stringWithFormat:@"%@%@", @"one minute past ", nums[h]];
    else if (m == 59)
        return [NSString stringWithFormat:@"%@%@", @"one minute to ", nums[(h % 12) + 1]];
    else if (m == 15)
        return [NSString stringWithFormat:@"%@%@", @"quarter past ", nums[h]];
    else if (m == 30)
        return [NSString stringWithFormat:@"%@%@", @"half past ", nums[h]];
    else if (m == 45)
        return [NSString stringWithFormat:@"%@%@", @"quarter to ", nums[(h % 12) + 1]];
    else if (m <= 30)
        return [NSString stringWithFormat:@"%@%@%@", nums[m], @" minutes past ", nums[h]];
    else if (m > 30)
        return [NSString stringWithFormat:@"%@%@%@", nums[60 - m], @" minutes to ", nums[(h % 12) + 1]];
    return @"";
}
@end
