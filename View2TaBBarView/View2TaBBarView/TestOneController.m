//
//  TestOneController.m
//  View2TaBBarView
//
//  Created by rongfzh on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TestOneController.h"

@interface TestOneController ()

@end

@implementation TestOneController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:1];
        self.tabBarItem = item;
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",9];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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

@end
