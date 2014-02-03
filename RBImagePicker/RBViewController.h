//
//  RBViewController.h
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/29/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBImagePickerController.h"

@interface RBViewController : UIViewController<RBImagePickerDelegate>


@property (strong, nonatomic) IBOutlet UIButton *showImage;
@property (strong, nonatomic) RBImagePickerController *imagePicker;
- (IBAction)onShow:(id)sender;
@end
