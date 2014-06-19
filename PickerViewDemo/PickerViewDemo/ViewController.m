//
//  ViewController.m
//  PickerViewDemo
//
//  Created by rongfzh on 12-6-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"

#define kFirstComponent 0
#define kSubComponent 1

@interface ViewController ()

@end

@implementation ViewController
@synthesize doneToolbar;
@synthesize selectPicker;
@synthesize textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    pickerArray = [NSArray arrayWithObjects:@"动物",@"植物",@"石头", nil];
    dicPicker = [NSDictionary dictionaryWithObjectsAndKeys:
                 [NSArray arrayWithObjects:@"鱼",@"鸟",@"虫子",            nil], @"动物",
                 [NSArray arrayWithObjects:@"花",@"草",@"葵花",            nil], @"植物",
                 [NSArray arrayWithObjects:@"疯狂的石头",@"花岗岩",@"鹅卵石", nil], @"石头",nil];
    
    subPickerArray = [dicPicker objectForKey:@"动物"];
    textField.inputView = selectPicker;
    textField.inputAccessoryView = doneToolbar;
    textField.delegate = self;
    selectPicker.delegate = self;
    selectPicker.dataSource = self;
    selectPicker.frame = CGRectMake(0, 640, 320, 216);

}

- (void)viewDidUnload
{
    [self setDoneToolbar:nil];
    [self setSelectPicker:nil];
    [self setTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Picker Delegate
 
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == kFirstComponent){
        return [pickerArray count];
    }else {
        return [subPickerArray count];
    }

}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component == kFirstComponent){
        return [pickerArray objectAtIndex:row];
    }else {
        return [subPickerArray objectAtIndex:row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == kFirstComponent) {
        subPickerArray = [dicPicker objectForKey:[pickerArray objectAtIndex:row]]; 
        [pickerView selectRow:0 inComponent:kSubComponent animated:YES];
        [pickerView reloadComponent:kSubComponent];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSInteger firstViewRow = [selectPicker selectedRowInComponent:kFirstComponent];
    NSInteger subViewRow = [selectPicker selectedRowInComponent:kSubComponent];
    NSString * firstString = [pickerArray objectAtIndex:firstViewRow];
    NSString * subString =  [[dicPicker objectForKey:[pickerArray objectAtIndex:firstViewRow]] objectAtIndex:subViewRow] ;
    NSString *textString = [[NSString alloc ] initWithFormat:@"您选择了：%@%@%@", firstString, @" 里的 ", subString];
    self.textField.text = textString;
}

- (IBAction)selectButton:(id)sender {
    [textField endEditing:YES];
}


- (IBAction)preferenceSetting:(id)sender {
    SettingsViewController *settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [self presentModalViewController:settingsViewController animated:YES];
}


@end
