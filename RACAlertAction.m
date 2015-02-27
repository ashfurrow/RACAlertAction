#import "RACAlertAction.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACAlertAction ()

@property (nonatomic, strong) RACDisposable *enabledDisposable;

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
    [self.enabledDisposable dispose], self.enabledDisposable = nil;
    
    if (command == nil) return;
    
    self.enabledDisposable = [command.enabled setKeyPath:@keypath(self, enabled) onObject:self];
}

@end
