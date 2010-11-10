//
//  UploaderAppDelegate.h
//  Uploader
//
//  Created by Steven Watson on 11/8/10.
//  Copyright 2010 swatsons.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UploaderViewController;

@interface UploaderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UploaderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UploaderViewController *viewController;

@end

