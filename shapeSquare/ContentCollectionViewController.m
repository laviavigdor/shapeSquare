//
//  ContentCollectionViewController.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/20/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import "ContentCollectionViewController.h"
#import "ContentCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

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
        id content = [self.data.categoriesAndContent valueForKey:self.data.chosenCategory][indexPath.row];
        contentCollectionViewCell.name.text = [content valueForKey:@"name"];
        contentCollectionViewCell.screen_name.text = [NSString stringWithFormat:@"@%@", [content valueForKey:@"screen_name"]];
        contentCollectionViewCell.ageAgo.text = [content valueForKey:@"ageAgo"];
        contentCollectionViewCell.retweet_count.text = [content valueForKey:@"retweet_count"];
        contentCollectionViewCell.imageView.imageURL = [NSURL URLWithString:[content valueForKey:@"profile_image_url"]];

        contentCollectionViewCell.tweet.text = [content valueForKey:@"text"];
        //[contentCollectionViewCell.text2 loadHTMLString:[content valueForKey:@"text2"] baseURL:Nil];
        
        contentCollectionViewCell.layer.cornerRadius = 5;
        contentCollectionViewCell.layer.masksToBounds = YES;
        

    }

        
        /*
         "id": "72680905",
         "user_id": "89043072",
         "created_at": "2014-02-14 15:14:16",
         "tweet_id": "434344850884816896",
         "text": "Thought of the day: \"All of us would be better investors if we just made fewer decisions.\" -Daniel Kahneman http:\/\/t.co\/b2B37ReaH8 #WSJ",
         "favorited": "0",
         "in_reply_to_status_id": "0",
         "in_reply_to_user_id": "0",
         "retweet_count": "22",
         "retweeted": "0",
         "entities": "{\"hashtags\":[{\"text\":\"WSJ\",\"indices\":[131,135]}],\"symbols\":[],\"urls\":[{\"url\":\"http:\\\/\\\/t.co\\\/b2B37ReaH8\",\"expanded_url\":\"http:\\\/\\\/stks.co\\\/h0I7h\",\"display_url\":\"stks.co\\\/h0I7h\",\"indices\":[108,130]}],\"user_mentions\":[]}",
         "timezone": "+0000",
         "ageAgo": "8 days ago",
         "text2": "Thought of the day: \"All of us would be better investors if we just made fewer decisions.\" -Daniel Kahneman stks.co\/h0I7h<\/a> #WSJ<\/a>",
         "profile_image_url": "http:\/\/pbs.twimg.com\/profile_images\/855548242\/Zweig_hedcut_normal.JPG",
         "screen_name": "jasonzweigwsj",
         "name": "Jason Zweig"
        
    }
     */
    return contentCollectionViewCell;
}


@end
