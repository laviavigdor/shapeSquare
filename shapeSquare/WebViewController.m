//
//  WebViewController.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/24/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import "WebViewController.h"
NSString *const SITE_URL = @"http://twtrland.com";

@interface WebViewController ()

@end

@implementation WebViewController

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
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:SITE_URL]]];
    self.edgesForExtendedLayout=UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
