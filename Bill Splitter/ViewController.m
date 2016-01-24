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
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UISlider *tipSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sliderValueChanged:(id)sender {
    self.peopleLabel.text = [NSString stringWithFormat:@"Split between %.f people", self.slider.value];
}
- (IBAction)tipSliderValueChanged:(id)sender {
    float tipAmount = self.tipSlider.value * 100;
    self.tipLabel.text = [NSString stringWithFormat:@"%.f%% Tip", tipAmount];
}

- (IBAction)calculateSplitAmout:(id)sender {
    NSDecimalNumber *billAmount = [[NSDecimalNumber alloc] initWithString:self.textField.text];
    NSDecimalNumber *numberOfPeople = [[NSDecimalNumber alloc] initWithFloat:self.slider.value];
    NSDecimalNumber *tipAmount = [[NSDecimalNumber alloc] initWithFloat:self.tipSlider.value + 1];
    NSLog(@"%@", tipAmount);
    NSDecimalNumber *result = [[billAmount decimalNumberByMultiplyingBy:tipAmount] decimalNumberByDividingBy:numberOfPeople];
    NSNumberFormatter *formatResult = [[NSNumberFormatter alloc] init];
    formatResult.numberStyle = NSNumberFormatterCurrencyStyle;
    self.label.text = [NSString stringWithFormat:@"Each person pays: %@", [formatResult stringFromNumber:result]];
}

@end
