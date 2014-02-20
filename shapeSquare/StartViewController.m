//
//  StartViewController.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/20/14.
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
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"StartViewController viewDidLoad");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnEnterClick:(UIButton *)sender {
    NSLog(@"StartViewController btnEnterClick");

    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
    if([navigationController isKindOfClass:[UINavigationController class]])
    {
        [self.navigationController pushViewController:navigationController animated:YES];
    }
}

@end
