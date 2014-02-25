//
//  CategoriesTableViewController.m
//  shapeSquare
//
//  Created by Lavi Avigdor 2 on 2/20/14.
//  Copyright (c) 2014 Twtrland. All rights reserved.
//

#import "CategoriesTableViewController.h"
#import "ContentCollectionViewController.h"
#import "AsyncImageView.h"
#import "Data.h"

@interface CategoriesTableViewController ()
@property (nonatomic) Data *data;
@end

@implementation CategoriesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"CategoriesTableViewController viewDidLoad");
    
    self.title = @"Explore";
    self.data = [Data sharedInstance];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)observeNotifications {
    [[NSNotificationCenter defaultCenter] addObserverForName:@"DataHasLoadedNotification"
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification *notification)
     {
         [self.tableView reloadData];
         [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
         
         NSLog(@"%@", notification.name);
         [[NSNotificationCenter defaultCenter] removeObserver:notification];
         notification = nil;
     }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.data.categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CategoryTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
    cell.textLabel.text = [self.data.categories objectAtIndex:indexPath.row];
    //cell.imageView.imageURL = restaurant.imageUrl;
    return cell;
}
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"CategoriesTableViewController prepareForSegue");
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([segue.destinationViewController isKindOfClass:[ContentCollectionViewController class]])
    {
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"CategoriesTableViewController didSelectRowAtIndexPath CLICK row:%ld",(long)indexPath.row);
    self.data.chosenCategory = [self.data.categories objectAtIndex:indexPath.row];
    NSLog(@"ChosenCategory:%@", self.data.chosenCategory);

    ContentCollectionViewController *contentCollectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentCollectionViewController" ];
    if([contentCollectionViewController isKindOfClass:[ContentCollectionViewController class]])
    {
        [self.navigationController pushViewController:contentCollectionViewController animated:YES];
    }
}


@end
