//
//  TabBarViewController.m
//  View2TaBBarView
//
//  Created by rongfzh on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TabBarViewController.h"
#import "TestOneController.h"
#import "TestTwoController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

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
//    self.tabBarController.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if(item.tag == 1){
        NSLog(@"TestOneController");
    }else if(item.tag == 2){
        NSLog(@"TestTwoController");
    }else {
        NSLog(@"TestThirdController");
    }
}


@end
