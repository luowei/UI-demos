//
//  ViewController.m
//  ButtonAlertTest
//
//  Created by luowei on 14-6-18.
//  Copyright (c) 2014年 rootls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *alertCleckedTip;

@end

@implementation ViewController

- (IBAction)addButton:(id)sender {
    UIButton *theNewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    theNewButton.backgroundColor = [UIColor clearColor];
    CGRect fram = CGRectMake(50, 200, 200, 50);
    theNewButton.frame = fram;
    [theNewButton setTitle:@"动态Button" forState:UIControlStateNormal];
    [theNewButton addTarget:self action:@selector(theNewButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:theNewButton];
}
-(void)theNewButtonClicked{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"你点击了动态Button" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",@"第三项", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    _alertCleckedTip.text = [NSString stringWithFormat:@"Alert Clicked At:%d",buttonIndex];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
