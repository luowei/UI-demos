//
//  TestThirdViewController.m
//  View2TaBBarView
//
//  Created by rongfzh on 12-6-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TestThirdViewController.h"

@interface TestThirdViewController ()

@end

@implementation TestThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:3];
         
        self.tabBarItem = item;
    }
    return self;
}

-(void)backAction:(id)sender{
    [self.parentViewController dismissModalViewControllerAnimated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor brownColor]];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(40, 50, 60, 30)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
