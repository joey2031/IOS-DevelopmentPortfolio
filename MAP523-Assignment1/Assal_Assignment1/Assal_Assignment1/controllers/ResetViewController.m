//
//  ResetViewController.m
//  Assal_Assignment1
//

#import "ResetViewController.h"
#import "TicketMaster.h"

@interface ResetViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *ticketAmmountIn;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic) TicketMaster *Ticket;
@end

@implementation ResetViewController
-(TicketMaster *) Ticket{
    if(_Ticket == nil){
        _Ticket = [[TicketMaster alloc] init];
    }
    return _Ticket;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.picker.dataSource = self;
    self.picker.delegate = self;
    [self.Ticket createTickets]; // we still need to initialize
}
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}
// number of rows.
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString* title = nil;
    Ticket *tempTicket = [[Ticket alloc] init];
    
    switch(row){
        case 0:
            // First grab the object out of the array, assign it to another one and get the values.
            tempTicket = [self.ResetVSTicketsAvailablePublicArray objectAtIndex:0];
            title = [NSString stringWithFormat: @"%@ %d price: %d$", tempTicket.name, tempTicket.quanity,  tempTicket.price];
            break;
        case 1:
            tempTicket = [self.ResetVSTicketsAvailablePublicArray objectAtIndex:1];
            title = [NSString stringWithFormat: @"%@ %d price: %d$", tempTicket.name, tempTicket.quanity,  tempTicket.price];
            break;
        case 2:
            tempTicket = [self.ResetVSTicketsAvailablePublicArray objectAtIndex:2];
            title = [NSString stringWithFormat: @"%@ %d price: %d$", tempTicket.name, tempTicket.quanity,  tempTicket.price];
            break;
    }
    return title;
}

- (IBAction)getTextInValue:(id)sender {
    Ticket *tempTicket = [[Ticket alloc] init]; // make a temp object
    NSInteger selectedRow = [self.picker selectedRowInComponent: 0]; // this must be 0. Gets selected row of picker
    tempTicket = [self.ResetVSTicketsAvailablePublicArray objectAtIndex:selectedRow]; // get object from array
    
    tempTicket.quanity = [self.ticketAmmountIn.text intValue];
    self.ticketAmmountIn.text = @"";
    [self.picker reloadAllComponents];
    
}
- (IBAction)cancel:(id)sender {
    self.ticketAmmountIn.text = @"";

}

@end
