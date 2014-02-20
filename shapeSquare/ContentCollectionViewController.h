//
//  ContentCollectionViewController.h
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/20/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Data.h"

@interface ContentCollectionViewController : UICollectionViewController  <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic) Data *data;
@end
