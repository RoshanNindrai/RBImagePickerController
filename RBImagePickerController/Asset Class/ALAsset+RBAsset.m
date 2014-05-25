//
//  ALAsset+RBAsset.m
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/31/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import "ALAsset+RBAsset.h"

@implementation ALAsset (RBAsset)

-(NSDate *)assetDate{
    
    return (NSDate *)[self valueForProperty:@"ALAssetPropertyDate"];
    
}



@end
