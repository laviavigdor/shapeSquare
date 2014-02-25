//
//  StartViewController.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/25/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import "StartViewController.h"
#import "Data.h"

@interface StartViewController ()
@property (nonatomic) Data *data;
@end

@implementation StartViewController

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
    NSLog(@"StartViewController viewDidLoad");
    self.data = [Data sharedInstance];
    [self.data setupTwitter];
    self.title = @"Home";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
