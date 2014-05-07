//
//  RBImagePickerController.h
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/29/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBImageCollectionCell.h"
#import "RBImagePickerController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface RBImageCollectionController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDataSource>

@property(nonatomic, strong)ALAsset *imageAsset;
@property(nonatomic, strong)NSArray *assets;
@property(nonatomic, strong)UIColor* backGroundColor;
@property(nonatomic)NSInteger maxSelectionCount;
@property(nonatomic)NSInteger minSelectionCount;
@property(nonatomic, strong)RBImagePickerController *pickerDelegate;

-(NSArray *)getSelectedAssets;

@end
