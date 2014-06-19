//
//  SettingsViewController.m
//  PickerViewDemo
//
//  Created by luowei on 14-6-19.
//
//

#import "SettingsViewController.h"
#import "ViewController.h"

@interface SettingsViewController (){
    NSMutableArray *aihaoTitles;
    NSMutableArray *aihaoValues;
    NSString *selectedAihao;
}
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UISlider *level;

@end

@implementation SettingsViewController

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
    // Do any additional setup after loading the view from its nib.
    aihaoTitles = [[NSMutableArray alloc] init];
    [aihaoTitles addObject:@"足球"];
    [aihaoTitles addObject:@"篮球"];
    [aihaoTitles addObject:@"乒乓球"];
    aihaoValues = [[NSMutableArray alloc] init];
    [aihaoValues addObject:@"football"];
    [aihaoValues addObject:@"basketball"];
    [aihaoValues addObject:@"pingpong"];
}

- (void)viewDidUnload
{
    [self setUsername:nil];
    [self setPickerView:nil];
    [self setLevel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 注册默认设置
- (void)registerDefaultsFromSettingsBundle {
    
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    if(!settingsBundle) {
        NSLog(@"Could not find Settings.bundle");
        return;
    }
    
    NSArray *preferences = [[NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]]  objectForKey:@"PreferenceSpecifiers"];
    
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    for(NSDictionary *prefSpecification in preferences) {
        NSString *key = [prefSpecification objectForKey:@"Key"];
        if(key) {
            id value = [prefSpecification objectForKey:@"DefaultValue"];
            if(value){
                [defaultsToRegister setObject:value forKey:key];
            }
        }
    }
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsToRegister];
}

- (IBAction)getSettings:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _username.text =  [defaults objectForKey:@"username"];
    selectedAihao = [defaults objectForKey:@"aihao"];
    if(!selectedAihao){
        [self registerDefaultsFromSettingsBundle];
        selectedAihao = [defaults objectForKey:@"aihao"];
    }
    NSLog(@"aihao:%@",selectedAihao);
    NSInteger aihaoIndex = [aihaoValues indexOfObject:selectedAihao];
    [_pickerView selectRow:aihaoIndex inComponent:0 animated:YES];
    [_level setValue:[defaults floatForKey:@"levelState"]];
}

- (IBAction)setSettings:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:_username.text forKey:@"username"];
    NSInteger aihaoIndex = [aihaoValues indexOfObject:selectedAihao];
    
    [defaults setValue:[aihaoValues  objectAtIndex:aihaoIndex] forKey:@"aihao"];
    [defaults setFloat:_level.value forKey:@"levelState"];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"偏好设置"
                          message:@"偏好设置已经保存！"
                          delegate:nil
                          cancelButtonTitle: @"完成"
                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)doneEdit:(id)sender {
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [aihaoTitles count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [aihaoTitles objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    selectedAihao = [aihaoValues objectAtIndex:row];
}


- (IBAction)back:(id)sender {
    ViewController *viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    [self dismissModalViewControllerAnimated:YES];
}

@end
