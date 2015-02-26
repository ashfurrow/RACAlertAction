//
//  ViewController.m
//  Demo
//
//  Created by Ash Furrow on 2015-02-26.
//  Copyright (c) 2015 Ash Furrow. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <RACAlertAction/RACAlertAction.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Sends NO, waits one second, then sends YES and completes.
    RACSignal *delayedEnabledSignal = [[[[RACSignal interval:1 onScheduler:RACScheduler.mainThreadScheduler] take:1] mapReplace:@(YES)] startWith:@(NO)];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    
    RACAlertAction *alertAction = [RACAlertAction actionWithTitle:@"Title" style:UIAlertActionStyleDefault];
    [alertController addAction:alertAction];
    
    @weakify(alertAction);
    alertAction.rac_command = [[RACCommand alloc] initWithEnabled:delayedEnabledSignal signalBlock:^RACSignal *(id input) {
        @strongify(alertAction);
        assert(input == alertAction);
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSLog(@"Sucessfully invoked signal.");
            
            return nil;
        }];
    }];
    
    NSLog(@"Presenting controller.");
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
