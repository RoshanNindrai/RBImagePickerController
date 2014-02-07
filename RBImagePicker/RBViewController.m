//
//  RBViewController.m
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/29/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import "RBViewController.h"

@interface RBViewController ()

@end

@implementation RBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imagePicker = [[RBImagePickerController alloc] init];
    self.imagePicker.sourceDelegate = self;
    self.imagePicker.selectionType = RBMultipleImageSelectionType;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didFinishPickingImages:(NSArray *)selectedImages{
    
    // the image picker is desmissed internally.
    for (UIImage *image in selectedImages) {
        NSLog(@"%@", image);
    }
    
}

-(void)imagePickerDidCancel:(RBImagePickerController *)imagePicker{
    
     [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)onShow:(id)sender {
    
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
}
@end
