//
//  ContentCollectionViewCell.h
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/20/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface ContentCollectionViewCell : UICollectionViewCell <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet AsyncImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *screen_name;
@property (weak, nonatomic) IBOutlet UILabel *retweet_count;
@property (weak, nonatomic) IBOutlet UILabel *ageAgo;
@property (weak, nonatomic) IBOutlet UIWebView *text2;
@property (weak, nonatomic) IBOutlet UILabel *tweet;


@end
