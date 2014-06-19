//
//  ViewController.h
//  PickerViewDemo
//
//  Created by rongfzh on 12-6-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate, UITextFieldDelegate,UIPickerViewDataSource>
{
    NSArray *pickerArray;
    NSArray *subPickerArray;
    NSDictionary *dicPicker;

}
- (IBAction)selectButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIToolbar *doneToolbar;

@property (strong, nonatomic) IBOutlet UIPickerView *selectPicker;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@end
