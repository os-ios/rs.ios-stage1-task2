#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    int a = 0, b = 1, c;

    for (int i = 2; i <= number.intValue; i++) {
        c = a + b;
        a = b;
        b = c;
        if (a * b >= number.intValue) {
            return @[@(a), @(b), @(a * b == number.intValue)];
        }
    }

    return @[];
}

@end
