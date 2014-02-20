//
//  ContentCollectionViewController.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/20/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import "ContentCollectionViewController.h"
#import "ContentCollectionViewCell.h"


@interface ContentCollectionViewController ()

@end

@implementation ContentCollectionViewController

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
    NSLog(@"ContentCollectionViewController viewDidLoad");
    self.data = [Data sharedInstance];
    self.title = self.data.chosenCategory;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return [[self.data.categoriesAndContent valueForKey:self.data.chosenCategory] count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"ContentCollectionViewController collectionView:cellForItemAtIndexPath");
    
    ContentCollectionViewCell *contentCollectionViewCell = [collectionView
                                        dequeueReusableCellWithReuseIdentifier:@"ContentCollectionViewCell"
                                        forIndexPath:indexPath];

    if([contentCollectionViewCell isKindOfClass:[ContentCollectionViewCell class]]) {
        contentCollectionViewCell.username.text = @"test";
        /*
        id content = [self.data.categoriesAndContent valueForKey:self.data.chosenCategory][indexPath.row];
        contentCollectionViewCell.name.text = content[@"name"];
        contentCollectionViewCell.username.text = content[@"username"];
         */
    }

    return contentCollectionViewCell;
}


@end
