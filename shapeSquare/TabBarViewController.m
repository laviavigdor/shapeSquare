
//
//  TabBarViewController.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/25/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

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
    [[self.tabBar.items objectAtIndex:0] setTitle:@"Home"];
    [[self.tabBar.items objectAtIndex:1] setTitle:@"Explore"];
    [[self.tabBar.items objectAtIndex:2] setTitle:@"Search"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
