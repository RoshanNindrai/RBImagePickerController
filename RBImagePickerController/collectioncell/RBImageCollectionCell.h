//
//  RBImageCollectionCell.h
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/29/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface RBImageCollectionCell : UICollectionViewCell

@property (nonatomic, strong) ALAsset *imageAsset;
@property (nonatomic, strong) UIImageView *assetImage;
@property (nonatomic) bool isSelected;

-(void)highlightCell;

@end
