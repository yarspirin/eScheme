//
//  MVTaskListTableViewController.m
//  eScheme
//
//  Created by whoami on 3/7/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "MVTaskListTableViewController.h"
#import "CoreData/CoreData.h"
#import "Task+CoreDataClass.h"
#import "AppDelegate.h"

@interface MVTaskListTableViewController ()

@property (strong, nonatomic) NSArray *tasks;

@end

@implementation MVTaskListTableViewController

- (void) retrieveData {
  
  NSFetchRequest<Task *> *fetchRequest = [Task fetchRequest];
  NSError *error = nil;
  
  NSManagedObjectContext *context = ((AppDelegate*) [[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
  
  _tasks = [context executeFetchRequest:fetchRequest error:&error];
  [self.tableView reloadData];
}

- (void) viewWillAppear:(BOOL)animated {
  [self retrieveData];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
  
  self.navigationItem.hidesBackButton = YES;
  
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
  }
  
  NSDateFormatter *formatter = [NSDateFormatter new];
  [formatter setDateFormat: @"dd/MM"];
  
  NSString *dateAsString = [formatter stringFromDate: [[_tasks objectAtIndex:indexPath.row] date]];

  
  [cell.textLabel setText: [NSString stringWithFormat: @"%@ [Due date: %@]", [[_tasks objectAtIndex:indexPath.row] title], dateAsString]];
  [cell setBackgroundColor: [UIColor colorWithPatternImage:[UIImage imageNamed:@"button.jpeg"]]];
  [cell.detailTextLabel setText: [NSString stringWithFormat: @"%@%@", @"Assigned to ", [[_tasks objectAtIndex: indexPath.row] assignee]]];
  [cell.textLabel setTextColor: [UIColor colorWithWhite: 255 alpha: 1]];
  [cell.detailTextLabel setTextColor: [UIColor colorWithWhite: 255 alpha: 1]];
  return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


/* #pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
}*/

@end
