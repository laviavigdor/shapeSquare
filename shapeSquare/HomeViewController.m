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
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"ProfileHasLoadedNotification" object:nil queue:nil usingBlock:^(NSNotification *notification) {
        
        self.name.text =            [[[self.data.profile valueForKey:@"data"] valueForKey:@"unifiedProfile"] valueForKey:@"name"];
        //self.description.text =     [[[self.data.profile valueForKey:@"data"] valueForKey:@"unifiedProfile"] valueForKey:@"description"];
        //self.imageView.imageURL =   [[[self.data.profile valueForKey:@"data"] valueForKey:@"unifiedProfile"] valueForKey:@"image"];
        
        NSLog(@"image url:%@", [[[self.data.profile valueForKey:@"data"] valueForKey:@"unifiedProfile"] valueForKey:@"image"]);
        NSURL *imageUrl = [NSURL URLWithString:[[[self.data.profile valueForKey:@"data"] valueForKey:@"unifiedProfile"] valueForKey:@"image"]];
        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
        self.imageView.image = [[UIImage alloc] initWithData:imageData];
        
        NSLog(@"%@", notification.name);
        [[NSNotificationCenter defaultCenter] removeObserver:notification];
         notification = nil;
     }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"TwitterAccountConnectedNotification" object:nil queue:nil usingBlock:^(NSNotification *notification) {
        self.name.text = @"";
        self.screen_name.text = @"";
        //self.description.text = @"123";
        
        NSLog(@"%@", notification.name);
        [[NSNotificationCenter defaultCenter] removeObserver:notification];
        notification = nil;
    }];

    [self.data setupTwitter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
