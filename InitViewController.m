//
//  InitViewController.m
//  eScheme
//
//  Created by whoami on 3/8/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "InitViewController.h"
#import "MVTaskListTableViewController.h"

@interface InitViewController ()

@end

@implementation InitViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self performSelector:@selector(loadingNextView)
             withObject:nil afterDelay:1.0f];
   [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
  
}

- (void)loadingNextView {
  MVTaskListTableViewController *vc = [[MVTaskListTableViewController alloc] init];
  [self.navigationController pushViewController: vc animated:YES];
  // [self.navigationController sViewController: vc sender: nil];
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
