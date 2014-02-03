//
//  RBImageCollectionCell.m
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/29/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import "RBImageCollectionCell.h"

#define CHECKMARK @"888-checkmark"

@interface  RBImageCollectionCell()



@end

@implementation RBImageCollectionCell



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.assetImage = [[UIImageView alloc] init];
        //self.contentView.frame = CGRectMake(0, 0, 104, 104);
        self.assetImage.frame = CGRectMake(0, 0, 75, 75);
        self.isSelected = false;
    }
    return self;
}

-(void)setImageAsset:(ALAsset *)imageAsset{
    
    _imageAsset = imageAsset;
    self.assetImage.image = [UIImage imageWithCGImage:[_imageAsset thumbnail]];
    
}

-(void)highlightCell{
    
    UIView *darkTint = [[UIView alloc] init];
    darkTint.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.4];
    darkTint.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self.contentView addSubview:darkTint];
    UIImageView *checkMark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:CHECKMARK]];
    checkMark.center = self.contentView.center;
    [self.contentView addSubview:checkMark];

    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
