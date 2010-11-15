//
//  UploaderViewController.h
//
//  Created by Steven Watson on 11/8/10.
//  Copyright 2010 swatsons.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UploaderViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    IBOutlet UIImageView *imageView;
}
- (IBAction)pushPick:(id)sender;
- (IBAction)pushUpload:(id)sender;
@end
