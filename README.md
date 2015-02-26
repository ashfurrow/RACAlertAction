# RACAlertAction
UIAlertAction subclass with support for ReactiveCocoa.

## Purpose

iOS 8 introduced `UIAlertController`, an abstraction above and replacement
for `UIAlertView`. `UIAlertController` uses `UIAlertAction` instances
to represent buttons (and actions for those buttons). But the interface
doesn't lend itself to naturally fit in the ReactiveCocoa world

Instead, we need to subclass it to ensure that certain things are set
at initialization time. That's what this library does.

## Installation

Installation is easy via CocoaPods. In your Podfile:

```ruby
pod 'RACAlertAction'
```

If you want a specific version of ReactiveCocoa, specify it on a separate line. `pod install`, then `import` the library via `#import <RACAlertAction/RACAlertAction.h>` or `@import RACAlertAction;` if you're using frameworks. 

## Usage

Usage is pretty straightforward. 

```objc
UIAlertController *alertController = ... // Set up your controller as you would normally.

// Create, then add the action
RACAlertAction *alertAction = [RACAlertAction actionWithTitle:/* your title */ style:/* whatever style */];
[alertController addAction:alertAction];

alertAction.rac_command = ... // Whatever RACCommand that represents your unit of work.
```

The action's `enabled` property will be automatically bound to the `enabled` signal of its `rac_command`. 
