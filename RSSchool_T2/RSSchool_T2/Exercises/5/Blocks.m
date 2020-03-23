#import "Blocks.h"

@implementation Blocks

- (instancetype)init {

    __block Blocks *weakSelf = self;
    __block NSArray *arr;

    self.blockA = ^(NSArray *array) {
        arr = array;
    };

    self.blockB = ^(Class clazz) {
        [weakSelf retain];

        if (clazz == [NSString class]) {
            NSMutableString *result = [NSMutableString new];
            for (NSObject *obj in arr) {
                if ([obj isKindOfClass:[NSString class]]) {
                    [result appendString:obj];
                }
            }
            weakSelf.blockC(result);
        }

        if (clazz == [NSNumber class]) {
            int result = 0;
            for (NSObject *obj in arr) {
                if ([obj isKindOfClass:[NSNumber class]]) {
                    result += [(NSNumber *) obj intValue];
                }
            }
            weakSelf.blockC(@(result));
        }

        if (clazz == [NSDate class]) {
            NSDate *laterDate = [NSDate dateWithTimeIntervalSince1970:0];
            for (NSObject *obj in arr) {
                if ([obj isKindOfClass:[NSDate class]]) {
                    NSDate *tmpDate = obj;
                    if ([tmpDate timeIntervalSinceReferenceDate] > [laterDate timeIntervalSinceReferenceDate]) {
                        laterDate = tmpDate;
                    }
                }
            }
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            dateFormatter.dateFormat = @"dd.MM.yyyy";
            weakSelf.blockC([dateFormatter stringFromDate:laterDate]);
        }


        [weakSelf release];
    };

    return self;
}

@end

