//
//  HomeViewController.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/25/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import "HomeViewController.h"
#import "Data.h"

@interface HomeViewController ()
@property (nonatomic) Data *data;
@end

@implementation HomeViewController

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
    self.title = @"Home";
    self.data = [Data sharedInstance];
    
    self.name.text = self.data.twitterAccount.userFullName;
    self.screen_name.text = self.data.twitterAccount.username;
    self.description.text = self.data.twitterAccount.description;
    
    [self.data setupTwitter];
    //self.imageView.imageURL = self.data.profile
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
