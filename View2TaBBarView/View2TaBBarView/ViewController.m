//
//  ViewController.m
//  View2TaBBarView
//
//  Created by rongfzh on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "TestOneController.h"
#import "TestTwoController.h"
#import "TestThirdViewController.h"
#import "TabBarViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)gotoTabbarVIew:(id)sender {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    TestOneController *testOne1 = [[TestOneController alloc] init];
    [items addObject:testOne1];
    TestTwoController *twoController = [[TestTwoController alloc] init];
    [items addObject:twoController];
    TestThirdViewController *thirdController = [[TestThirdViewController alloc] init];
    [items addObject:thirdController];
    // items是数组，每个成员都是UIViewController
    TabBarViewController *tabBar = [[TabBarViewController alloc] init];
    [tabBar setTitle:@"TabBarController"];
    [tabBar setViewControllers:items];
    
    [self presentModalViewController : tabBar animated:YES];
}
@end
