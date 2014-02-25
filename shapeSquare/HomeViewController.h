//
//  HomeViewController.h
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/25/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *screen_name;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet AsyncImageView *imageView;

@end
