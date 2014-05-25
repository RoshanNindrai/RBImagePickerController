//
//  RBImagePickerController.m
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/31/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import "RBImagePickerController.h"
#import "RBImageCollectionController.h"

@interface RBImagePickerController ()

@property(nonatomic, strong) RBImageCollectionController *assetCollection;

@end

@implementation RBImagePickerController

NSString * const TITLE = @"Photos";
NSString * const DONE = @"Done";
NSString * const CANCEL = @"Cancel";

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
   
    self.assetCollection = [[RBImageCollectionController alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    self.assetCollection.pickerDelegate = self;
    [self assignMaxSelectionCount];
    [self assignMinSelectionCount];
    self.assetCollection.navigationItem.title = TITLE;
    if(self.selectionType != RBSingleImageSelectionType){
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:DONE
                                   style:UIBarButtonItemStyleBordered
                                   target:self action:@selector(onDone:)];
    
    [self.assetCollection.navigationItem setRightBarButtonItem:doneButton];
    
    }
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
                                     initWithTitle:CANCEL
                                     style:UIBarButtonItemStyleBordered
                                     target:self action:@selector(onCancel:)];
    
    [self.assetCollection.navigationItem setLeftBarButtonItem:cancelButton];
    [self.assetCollection.navigationItem.rightBarButtonItem setEnabled:NO];

    [self pushViewController:self.assetCollection animated:NO];
    
   

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onCancel:(id)sender{
    
    
    if([self.delegate respondsToSelector:@selector(imagePickerControllerDidCancel:)])
        [self.delegate imagePickerControllerDidCancel:self];
   else
       [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)assignMaxSelectionCount{
    
    if ([self.dataSource respondsToSelector:@selector(imagePickerControllerMaxSelectionCount:)]) {
        
         self.assetCollection.maxSelectionCount = [self.dataSource imagePickerControllerMaxSelectionCount:self];
        
    }
    else{
        
        self.assetCollection.maxSelectionCount = 0;
        
    }
}

-(void)assignMinSelectionCount{
    
    if ([self.dataSource respondsToSelector:@selector(imagePickerControllerMinSelectionCount:)]) {
        
        self.assetCollection.minSelectionCount = [self.dataSource imagePickerControllerMinSelectionCount:self];
        
    }
    else{
        
        self.assetCollection.minSelectionCount = 0;
        
    }
}

-(void)onDone:(id)sender{
    
    [self finishPickingImages];
    
}

-(void)finishPickingImages{
    
    [self.delegate imagePickerController:self didFinishPickingImagesWithURL:[self.assetCollection getSelectedAssets]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
