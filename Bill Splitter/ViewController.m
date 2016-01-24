//
//  ViewController.m
//  Bill Splitter
//
//  Created by Chloe on 2016-01-24.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;
@property (nonatomic, strong) NSArray *peopleNumbers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    
    [self.textField becomeFirstResponder];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sliderValueChanged:(id)sender {
    self.peopleLabel.text = [NSString stringWithFormat:@"Split between %.f people", self.slider.value];
    [self calculate];
}
- (IBAction)tipSliderValueChanged:(id)sender {
    float tipAmountValue = self.tipSlider.value * 100;
    self.tipLabel.text = [NSString stringWithFormat:@"%.f%% Tip", tipAmountValue];
    [self calculate];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self calculate];
}

#pragma mrk - Helper methods

- (void)calculate {
    NSDecimalNumber *billAmount = [[NSDecimalNumber alloc] initWithString:self.textField.text];
    NSDecimalNumber *numberOfPeople = [[NSDecimalNumber alloc] initWithFloat:roundf(self.slider.value)];
    NSDecimalNumber *tipAmount = [[NSDecimalNumber alloc] initWithFloat:self.tipSlider.value + 1];
    NSDecimalNumber *result = [[billAmount decimalNumberByMultiplyingBy:tipAmount] decimalNumberByDividingBy:numberOfPeople];
    NSNumberFormatter *formatResult = [[NSNumberFormatter alloc] init];
    formatResult.numberStyle = NSNumberFormatterCurrencyStyle;
    self.label.text = [NSString stringWithFormat:@"Each person pays: %@", [formatResult stringFromNumber:result]];
}

@end
