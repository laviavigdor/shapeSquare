//
//  Data.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/19/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import "Data.h"


NSString *const FEED_URL = @"http://twtrland.com/top2.php?json=1";
NSString *const SEARCH_URL = @"http://twtrland.com/p/jack?api=1";
NSString *const PROFILE_URL = @"http://twtrland.com/p/{0}?api=1";
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
-(void)getProfile:(NSString *)screen_name {
    NSLog(@"getProfile");
    
    NSMutableString *url = [NSMutableString stringWithString: PROFILE_URL];
    [url replaceOccurrencesOfString:@"{0}"
                         withString:screen_name
                            options:NSCaseInsensitiveSearch
                              range:NSMakeRange(0,[url length])];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                id jsonObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers error:nil];
                
                self.profile = [jsonObjects mutableCopy];

                [[NSNotificationCenter defaultCenter] postNotificationName:@"ProfileHasLoadedNotification" object:self];
                
            }] resume];
}
-(void)loadFeed {
    NSLog(@"loadFeed");

    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:FEED_URL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                id jsonObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers error:nil];
                
                self.categoriesAndContent = [jsonObjects mutableCopy];
                self.categories = [[jsonObjects allKeys] mutableCopy];

                [[NSNotificationCenter defaultCenter] postNotificationName:@"DataHasLoadedNotification" object:self];
                
            }] resume];
}

/*
 TBD: 
 - what do you do if you have more than one account, how to choose?
 - what do you do if there are no accounts?
 */
-(void)setupTwitter {    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [accountStore requestAccessToAccountsWithType:accountType options:Nil completion:^(BOOL granted, NSError *error) {
        if (granted == YES) {
            NSArray *arrayOfAccounts = [accountStore accountsWithAccountType:accountType];
            if ([arrayOfAccounts count] > 0) {
                self.twitterAccount = [arrayOfAccounts lastObject];
                NSLog(@"setupTwitter - username:%@", self.twitterAccount.username);
                [[NSNotificationCenter defaultCenter] postNotificationName:@"TwitterAccountConnectedNotification" object:self];
                [self getProfile:self.twitterAccount.username];
            }
        } else {
            NSLog(@"setupTwitter, error:%@", [error localizedDescription]);
        }
    }];
}


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

@end
