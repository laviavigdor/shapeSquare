//
//  Data.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/19/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import "Data.h"
NSString *const FEED_URL = @"http://twtrland.com/top2.php?json=1";
NSString *const DataHasLoadedNotification = @"DataHasLoadedNotification";

@implementation Data
+(instancetype)sharedInstance
{
    static Data *instance = nil;
    if(instance == nil){
        instance = [[Data alloc] init];
    }
    return instance;
}


-(id)init {
    if (self = [super init]) {
        NSLog(@"Data init");
        [self loadFeed];
    }
    return self;
}
-(void)loadFeed {
    NSLog(@"loadFeed");

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:FEED_URL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                // handle response
                id jsonObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers error:nil];
                
                self.categoriesAndContent = [jsonObjects mutableCopy];
                self.categories = [[jsonObjects allKeys] mutableCopy];

                /*
                 NSArray *keys = [jsonObjects allKeys];
                 
                 // values in foreach loop
                 for (NSString *key in keys) {
                 NSLog(@"%@ is %@",key, [jsonObjects objectForKey:key]);
                 } */
                
                
                //id founderElements = [jsonObjects valueForKey:@"Founder "];
                //id element = founderElements[0];
                //element[@"name"];
                //element[@"username"];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"DataHasLoadedNotification" object:self];
                
            }] resume];
}

@end
