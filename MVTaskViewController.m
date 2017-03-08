//
//  MVTaskViewController.m
//  eScheme
//
//  Created by whoami on 3/7/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "MVTaskViewController.h"
#import "CoreData/CoreData.h"
#import "AppDelegate.h"

@interface MVTaskViewController ()

@property (weak, nonatomic) IBOutlet UITextField *taskTitle;
@property (weak, nonatomic) IBOutlet UITextView *taskDescription;
@property (weak, nonatomic) IBOutlet UIDatePicker *taskDate;
@property (weak, nonatomic) IBOutlet UITextField *taskAssignee;

@end

@implementation MVTaskViewController

- (IBAction)saveTaskDetails:(UIBarButtonItem *)sender {
  NSManagedObjectContext *context = ((AppDelegate*) [[UIApplication sharedApplication] delegate]).persistentContainer.viewContext;
  
  NSManagedObject *entityNameObj = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:context];
  
  [entityNameObj setValue: _taskTitle.text forKey: @"title"];
  [entityNameObj setValue: _taskDate.date forKey: @"date"];
  [entityNameObj setValue: _taskAssignee.text forKey: @"assignee"];
  [entityNameObj setValue: _taskDescription.text forKey: @"descript"];
  
  [((AppDelegate*)[[UIApplication sharedApplication] delegate]) saveContext];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
  self.taskDescription.layer.cornerRadius = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
