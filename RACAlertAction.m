#import "RACAlertAction.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACAlertAction ()

@property (nonatomic, strong) RACDisposable *enabledDispsable;

@end

@implementation RACAlertAction

+ (instancetype)actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style {
    return [super actionWithTitle:title style:style handler:^(UIAlertAction *action) {
        [((RACAlertAction *)action).command execute:action];
    }];
}

- (void)setCommand:(RACCommand *)command {
    _command = command;
    
    // Check for stored signal in order to remove it and add a new one
    [self.enabledDispsable dispose], self.enabledDispsable = nil;
    
    if (command == nil) return;
    
    self.enabledDispsable = [command.enabled setKeyPath:@keypath(self, enabled) onObject:self];
}

@end
