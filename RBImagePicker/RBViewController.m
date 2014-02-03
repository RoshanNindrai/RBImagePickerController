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
    self.imagePicker.selectionType = RBMultipleSelectionType;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didFinishSelectingImages:(NSArray *)selectedImages{
    
    for (UIImage *image in selectedImages) {
        NSLog(@"%@", image);
    }
    
}


- (IBAction)onShow:(id)sender {
    
    [self presentViewController:self.imagePicker animated:YES completion:nil];
    
}
@end
