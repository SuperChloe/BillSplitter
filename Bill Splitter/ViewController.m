//
//  ViewController.m
//  Bill Splitter
//
//  Created by Chloe on 2016-01-24.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateSplitAmout:(id)sender {
    NSDecimalNumber *billAmount = [[NSDecimalNumber alloc] initWithString:self.textField.text];
    NSDecimalNumber *numberOfPeople = [[NSDecimalNumber alloc] initWithFloat:self.slider.value];
    NSDecimalNumber *result = [billAmount decimalNumberByDividingBy:numberOfPeople];
    NSLog(@"%@", result);
    NSNumberFormatter *formatResult = [[NSNumberFormatter alloc] init];
    formatResult.numberStyle = NSNumberFormatterCurrencyStyle;
    self.label.text = [NSString stringWithFormat:@"Each person pays: %@", [formatResult stringFromNumber:result]];
}

@end
