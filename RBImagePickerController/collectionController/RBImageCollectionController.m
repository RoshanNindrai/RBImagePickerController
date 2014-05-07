//
//  RBImagePickerController.m
//  RBImagePicker
//
//  Created by Roshan Balaji on 1/29/14.
//  Copyright (c) 2014 Uniq Labs. All rights reserved.
//

#import "RBImageCollectionController.h"
#import "ALAsset+RBAsset.h"
#define CELLIDENTIFIER @"assetcell"
#define ASSET_WIDTH_HEIGHT 75

@interface RBImageCollectionController ()

@property(nonatomic, strong) NSMutableDictionary *selected_images;
@property(nonatomic, strong) NSMutableArray *selected_images_index;

@end

@implementation RBImageCollectionController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

// visuals

-(void)setBackGroundColor:(UIColor *)backGroundColor{
    
    self.view.backgroundColor = backGroundColor;
    
}

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.minSelectionCount = 0;
        self.maxSelectionCount = 0;
    }
    return self;
}

-(void)setMinSelectionCount:(NSInteger)minSelectionCount
{
    
    self->_minSelectionCount = MIN(self.maxSelectionCount, minSelectionCount);
        
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.selected_images = [[NSMutableDictionary alloc] init];
    self.selected_images_index = [[NSMutableArray alloc] init];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 4.0;
    layout.minimumLineSpacing = 4.0;
    layout.sectionInset = UIEdgeInsetsMake(4, 4, 4, 4);
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    if(self.backGroundColor == nil){
        self.collectionView.backgroundColor =  [UIColor whiteColor];
    }
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    _assets = [@[] mutableCopy];
    __block NSMutableArray *tmpAssets = [@[] mutableCopy];

    ALAssetsLibrary *assetsLibrary = [RBImageCollectionController defaultAssetsLibrary];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if(result)
            {
                
                if([[result valueForProperty:@"ALAssetPropertyType"] isEqualToString:@"ALAssetTypePhoto"]){
                [tmpAssets addObject:result];
                }
            }
        }];
       NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"assetDate" ascending:NO];
        self.assets = [tmpAssets sortedArrayUsingDescriptors:@[sort]];
       
        // 5
        [self.collectionView reloadData];
    } failureBlock:^(NSError *error) {
        NSLog(@"Error loading images %@", error);
    }];
    [self.collectionView registerClass:[RBImageCollectionCell class] forCellWithReuseIdentifier:CELLIDENTIFIER];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    static dispatch_once_t pred = 0;
    static ALAssetsLibrary *library = nil;
    dispatch_once(&pred, ^{
        library = [[ALAssetsLibrary alloc] init];
    });
    return library;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.assets.count;
}

- (RBImageCollectionCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    RBImageCollectionCell *cell = (RBImageCollectionCell *)[collectionView
                                                            dequeueReusableCellWithReuseIdentifier:CELLIDENTIFIER forIndexPath:indexPath];
    
    ALAsset *asset = self.assets[indexPath.row];
    [cell setImageAsset:asset];
    
    [cell.contentView addSubview:cell.assetImage];
    
    if([self.pickerDelegate selectionType] != RBSingleImageSelectionType ){
    
        if([self.selected_images_index containsObject:indexPath]){
     
            [cell highlightCell];
        
        }
        
    }
    
    return cell;
    
}

- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView
                    layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout  *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    return CGSizeMake(ASSET_WIDTH_HEIGHT, ASSET_WIDTH_HEIGHT);

}

-(NSArray *)getSelectedAssets{
    
    return [self.selected_images allValues];
    
}

-(BOOL)didReachMaxCount
{
    
    if([self.selected_images_index count] <= self.maxSelectionCount || self.maxSelectionCount == 0)
    {
        
        return NO;
        
    }
    
    return YES;
    
}

-(BOOL)didReachMinCount
{
    
    if([self.selected_images_index count] < self.minSelectionCount )
    {
        
        return NO;
        
    }
    
    return YES;
    
}

-(void)showHideCompletionOption
{
    
    if(([self.selected_images_index count] != 0  && ![self didReachMaxCount] && [self didReachMinCount])){
        
        [self.navigationItem.rightBarButtonItem setEnabled:YES];
        
    }
    else{
        
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
        
    }

}

-(void)selectAssestAtIndexPath:(NSIndexPath* )indexPath
{
    
    ALAsset *asset = self.assets[indexPath.row];
    ALAssetRepresentation *defaultRep = [asset defaultRepresentation];
    UIImage *image = [UIImage imageWithCGImage:[defaultRep fullScreenImage] scale:[defaultRep scale] orientation:0];
    [self.selected_images setObject:image forKey:indexPath];
    [self.selected_images_index addObject:indexPath];
    
    
}

-(void)deselectSelectedImageFromIndexpath:(NSIndexPath *)indexPath
{
    
    [self.selected_images removeObjectForKey:indexPath];
    [self.selected_images_index removeObject:indexPath];
    
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    if(![self.selected_images_index containsObject:indexPath]){
    
        [self selectAssestAtIndexPath:indexPath];
        
    }
    else{
        
        [self deselectSelectedImageFromIndexpath:indexPath];

    }
    
    if([self.pickerDelegate selectionType] == RBSingleImageSelectionType){
        
        [self.pickerDelegate finishPickingImages];
    }
    
    [self showHideCompletionOption];
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
}



@end
