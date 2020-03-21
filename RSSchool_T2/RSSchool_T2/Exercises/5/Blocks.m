#import "Blocks.h"

@implementation Blocks

- (instancetype)init {

    self.blockA = ^(NSArray *array) {
        NSLog(@"got A");
    };

    self.blockB = ^(Class clazz) {
        NSLog(@"got B");
    };

    return self;
}

@end

