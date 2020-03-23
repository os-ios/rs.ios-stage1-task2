#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSMutableArray<NSNumber *> *arr = [[NSMutableArray alloc] initWithCapacity:number.intValue];
    [arr addObject:@0];
    [arr addObject:@1];

    for (int i = 2; i <= number.intValue; i++) {
        arr[i] = @(arr[i - 2].intValue + arr[i - 1].intValue);
        if (arr[i - 2].intValue * arr[i - 1].intValue >= number.intValue) {
            return @[arr[i - 2], arr[i - 1], arr[i - 2].intValue * arr[i - 1].intValue == number.intValue ? @1 : @0];
        }
    }

    return @[];
}

@end
