#import "NSString+Transform.h"

@implementation NSString (Transform)

- (NSString *)transform {
    NSArray<NSString *> *alphabet = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    NSArray<NSString *> *vowels = @[@"a", @"A", @"e", @"E", @"i", @"I", @"o", @"O", @"u", @"U", @"y", @"Y"];
    NSArray<NSString *> *consonants = @[@"b", @"B", @"c", @"C", @"d", @"D", @"f", @"F", @"g", @"G", @"h", @"H", @"j", @"J", @"k", @"K", @"l", @"L", @"m", @"M", @"n", @"N", @"p", @"P", @"q", @"Q", @"r", @"R", @"s", @"S", @"t", @"T", @"v", @"V", @"w", @"W", @"x", @"X", @"z", @"Z"];
    NSMutableArray<NSString *> *result = [NSMutableArray new];

    BOOL pangram = true;
    for (NSString *str in alphabet) {
        if (![self.uppercaseString containsString:str]) {
            pangram = false;
        }
    }

    NSArray<NSString *> *words = [[self stringByReplacingOccurrencesOfString:@"\n" withString:@""] componentsSeparatedByString:@" "];
    for (int i = 0; i < words.count; i++) {
        NSMutableString *word = [words[i] mutableCopy];

        if (word.length != 0) {
            int count = 0;
            for (int j = 0; j < word.length; j++) {
                NSString *character = [word substringWithRange:NSMakeRange(j, 1)];

                BOOL vowelOrConsonant = pangram ? [vowels containsObject:character] : [consonants containsObject:character];
                if (vowelOrConsonant) {
                    count++;
                    [word replaceCharactersInRange:NSMakeRange(j, 1) withString:[character uppercaseString]];
                }
            }

            [result addObject:[NSString stringWithFormat:@"%d%@", count, word]];
        }

        [word release];
    }

    NSArray *array = [result sortedArrayUsingComparator:^(NSString *word1, NSString *word2) {
        NSString *word1Count = [word1 substringWithRange:NSMakeRange(0, 1)];
        NSString *word2Count = [word2 substringWithRange:NSMakeRange(0, 1)];
        return [word1Count compare:word2Count];
    }];

    NSMutableString *resultString = [NSMutableString new];
    for (int i = 0; i < array.count; i++) {
        if (i != 0) {
            [resultString appendString:@" "]; // prepend spaces between words
        }
        [resultString appendString:array[i]];
    }

    return [resultString autorelease];
}

@end
