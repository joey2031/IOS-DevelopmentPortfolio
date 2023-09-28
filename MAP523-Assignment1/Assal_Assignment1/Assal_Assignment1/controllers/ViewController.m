//
//  ViewController.m
//  Assal_Assignment1
//

#import "ViewController.h"
#import "ManagerViewController.h"
#import "TicketMaster.h"
#import "Ticket.h"

// by placing thie in the <> we can use the built in picker view functions
@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *totalDisplay;
@property (weak, nonatomic) IBOutlet UILabel *qutyEnteredDisplay;
@property (weak, nonatomic) IBOutlet UILabel *ticketTypeDisplay;
@property (nonatomic) TicketMaster *Ticket;
@end

@implementation ViewController
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
    [self.Ticket createTickets];
    
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
    tempTicket = [self.Ticket.ticketsAvailable objectAtIndex:row]; 
    title = [NSString stringWithFormat: @"%@ %d price: %d$", tempTicket.name, tempTicket.quanity,  tempTicket.price];
    self.ticketTypeDisplay.text = tempTicket.name;
    return title;
}


- (IBAction)numberPressed:(id)sender {
    UIButton *button = (UIButton *) sender;
    self.qutyEnteredDisplay.text = [self.qutyEnteredDisplay.text stringByAppendingString:button.titleLabel.text];
}

-(void)viewWillAppear:(BOOL)animated{
     [self.picker reloadAllComponents];
}



- (IBAction)buyPressed:(id)sender {
    Ticket *tempTicket = [[Ticket alloc] init];
    SoldTicket *tempSoldTicket = [[SoldTicket alloc] init];
    //To get the index of the selected row in the picker view
    NSInteger selectedRow = [self.picker selectedRowInComponent: 0]; // this must be 0.
    
    tempTicket = [self.Ticket.ticketsAvailable objectAtIndex:selectedRow];
    
    //convert string to int and store calculation in int
    double total =  [self.qutyEnteredDisplay.text doubleValue] * tempTicket.price;
    NSString* totalStr = [NSString stringWithFormat:@"%.2f", total];
    self.totalDisplay.text = [@"$" stringByAppendingString:totalStr];

    tempTicket.quanity = tempTicket.quanity - [self.qutyEnteredDisplay.text intValue];
    tempSoldTicket.ticketSoldName = tempTicket.name;
    tempSoldTicket.numbSold = [self.qutyEnteredDisplay.text intValue];
    tempSoldTicket.dateSold = [NSDate date];
    tempSoldTicket.price = total; 
    [self.Ticket buyTicket:tempSoldTicket]; 
    self.qutyEnteredDisplay.text = @"";
    [self.picker reloadAllComponents]; 

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ManagerViewController* manVc = (ManagerViewController*) [segue destinationViewController];
    manVc.ManagerVcSoldTicketsPublicArray = self.Ticket.soldTickets; // assign soldTickets array of ticketMaster into ManagerVcSoldTicketsPublicArray
    manVc.ManagerVSTicketsAvailablePublicArray = self.Ticket.ticketsAvailable;
}
@end
