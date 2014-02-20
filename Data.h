//
//  Data.h
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/19/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString *const DataHasLoadedNotification;

@interface Data : NSObject
+(instancetype)sharedInstance; // singleton
-(void)loadFeed;
@property (nonatomic, strong) NSMutableArray *categoriesAndContent;
@property (nonatomic, strong) NSMutableArray *categories;
@property (nonatomic, strong) NSString *chosenCategory;

@end