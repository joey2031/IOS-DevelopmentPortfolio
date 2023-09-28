//
//  ResetViewController.m
//  Assal_Assignment1
//

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


// When I do the function like this is dosent work.
/*
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString* title = nil;
    Ticket *tempTicket = [[Ticket alloc] init];
    tempTicket = [self.Ticket.ticketsAvailable objectAtIndex:row];
    title = [NSString stringWithFormat: @"%@ %d price: %d$", tempTicket.name, tempTicket.quanity,  tempTicket.price];
    return title;
}*/
 

- (IBAction)getTextInValue:(id)sender {
    Ticket *tempTicket = [[Ticket alloc] init]; // make a temp object
    NSInteger selectedRow = [self.picker selectedRowInComponent: 0]; // this must be 0. Gets selected row of picker
    tempTicket = [self.ResetVSTicketsAvailablePublicArray objectAtIndex:selectedRow]; // get object from array
    
    // This makes sense however, I updated the temp object not array, so why does that work? What happend to the other one in the array, is it overwritten?
    tempTicket.quanity = [self.ticketAmmountIn.text intValue];
    self.ticketAmmountIn.text = @"";
    [self.picker reloadAllComponents];
    // To update the main picker view we use viewDidAppear.
    // Only thing I dont understamd is if the array is in this class how does the main view know about it.
    //Its public but when you reload it how does it know to look there?
    
}
- (IBAction)cancel:(id)sender {
    self.ticketAmmountIn.text = @"";

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
