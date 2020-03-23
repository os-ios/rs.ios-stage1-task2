#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {

    NSArray *array = @[@-1];
    NSMutableArray<NSNumber *> *stack = [array mutableCopy];

    // check that all characters from b exist in a
    for (int i = 0; i < b.length; i++) {
        NSString *character = [b substringWithRange:NSMakeRange(i, 1)];

        int index1 = [a rangeOfString:character].location;
        int index2 = [a rangeOfString:[character lowercaseString]].location;

        if (index1 == -1 && index2 == -1) {
            return @"NO";
        }

        int currentIndex = index1 == -1 ? index2 : index1;

        if (currentIndex < [stack lastObject].intValue) {
            return @"NO";
        }

        [stack addObject:@(currentIndex)];
    }

    for (int i = 0; i < a.length; i ++) {
        NSString *character = [a substringWithRange:NSMakeRange(i, 1)];
        if ([character isEqualToString: [character uppercaseString]] && ![stack containsObject:@(i)]) {
            return @"NO";
        }
    }

    return @"YES";
}
@end
