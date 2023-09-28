//
//  ViewController.m
//  Calculator

/*
 The way this calculator works: press: 2, enter, 5, enter, operand
 and then it will display the answer.
**/
#import "ViewController.h"
#import "Cal_brain.h"

@interface ViewController ()
// property goes inside interface, so they can be private
@property (weak, nonatomic) IBOutlet UILabel *Display;
@property (nonatomic) Cal_brain *calculator;
@end


@implementation ViewController
// Lazy loading
-(Cal_brain *)calculator{
    if(_calculator == nil){
        _calculator = [[Cal_brain alloc] init];
    }
    return _calculator;
}

- (IBAction)DigitPressed:(id)sender {
    UIButton *button = (UIButton *) sender;
    if([self.Display.text isEqualToString:@"0"]){ // so there won't be a 0 in front eg. 56 instead of 056
        self.Display.text = @"";
    }
    self.Display.text = [self.Display.text stringByAppendingString:button.titleLabel.text];
    
}

- (IBAction)Oprator_pressed:(id)sender {
     UIButton *button = (UIButton *) sender;
     NSLog(@"%@", button.titleLabel.text); 
    double answer = [self.calculator calculate:button.titleLabel.text];
    NSNumber *myNumber = [NSNumber numberWithDouble:answer];
    self.Display.text = [myNumber stringValue];
    
}

- (IBAction)Enter_pressed:(id)sender {
    NSLog(@"%@", self.Display.text);
    [self.calculator pushItem:[self.Display.text doubleValue]];
    self.Display.text = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"calculator object is %@", self.calculator);
}
@end
