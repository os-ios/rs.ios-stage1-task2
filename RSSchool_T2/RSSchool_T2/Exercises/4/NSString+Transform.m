#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
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
    if (pangram) {
        for (int i = 0; i < words.count; i++) {
            NSMutableString *sentence = [words[i] mutableCopy];

            if (sentence.length != 0) {
                int count = 0;
                for (int j = 0; j < sentence.length; j++) {
                    NSString *character = [sentence substringWithRange:NSMakeRange(j, 1)];
                    if ([vowels containsObject:character]) { // TODO: convert to Block
                        count++;
                        [sentence replaceCharactersInRange:NSMakeRange(j, 1) withString:[character uppercaseString]];
                    }
                }

                [result addObject:[NSString stringWithFormat:@"%d%@", count, sentence]];
            }
        }
    } else {
        for (int i = 0; i < words.count; i++) {
            NSMutableString *word = [words[i] mutableCopy];

            if (word.length != 0) {
                int count = 0;
                for (int j = 0; j < word.length; j++) {
                    NSString *character = [word substringWithRange:NSMakeRange(j, 1)];
                    if ([consonants containsObject:character]) { // TODO: convert to Block
                        count++;
                        [word replaceCharactersInRange:NSMakeRange(j, 1) withString:[character uppercaseString]];
                    }
                }

                [result addObject:[NSString stringWithFormat:@"%d%@", count, word]];
            }
        }
    }

    NSArray *array = [result sortedArrayUsingComparator:^(NSString *sentence1, NSString *sentence2) {
        NSString *count1 = [sentence1 substringWithRange:NSMakeRange(0, 1)];
        NSString *count2 = [sentence2 substringWithRange:NSMakeRange(0, 1)];
        return [count1 compare: count2];
    }];

    NSMutableString *resultString = [NSMutableString new];
    for (int i = 0; i < array.count; i++) {
        if (i != 0) {
            [resultString appendString:@" "]; // prepend spaces between words
        }
        [resultString appendString:array[i]];
    }

    return resultString;
}

@end
