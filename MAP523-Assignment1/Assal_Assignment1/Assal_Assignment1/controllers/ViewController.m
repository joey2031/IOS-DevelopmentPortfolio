//
//  ViewController.m
//  Assal_Assignment1
//

//
// Look at june 11 example 3 for how to pass data between view controllers
// It crashes if you go to the manager page and the ticketSold array is empty- Check to see of thats ok


/*
 Notes: How to set up nav controller
 ** There are different ways but this is how I did it
 1. Chick on your first view
 2. Go to editior > embed in navigation controller
 3. Click on the navigation controller view, in the side menu click on the icon on the left next to the ruller
 4. Under view controller check "is initial view controller"
 */

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
// This initializes the object.
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

// If you want to split each row into sections. Eg. when you pick a date and
// and each row has a column for month year and day
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}
// number of rows.
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 3;
}

// This only gets called when the view loads. Originally had a switch, I keept the original code for this function at the end of the file
// For some reason if I use this method for the resetViewController.m the view picker is not updated.
- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString* title = nil;
    Ticket *tempTicket = [[Ticket alloc] init];
    tempTicket = [self.Ticket.ticketsAvailable objectAtIndex:row]; // can do this instead of a switch
    title = [NSString stringWithFormat: @"%@ %d price: %d$", tempTicket.name, tempTicket.quanity,  tempTicket.price];
    self.ticketTypeDisplay.text = tempTicket.name;
    return title;
}


- (IBAction)numberPressed:(id)sender {
    UIButton *button = (UIButton *) sender;
    self.qutyEnteredDisplay.text = [self.qutyEnteredDisplay.text stringByAppendingString:button.titleLabel.text];
}

//pickervew- We dont have to pass data back, just update the pickerview using this method.
// TBH: Not sure how it works, ask prof. Also which one do we use since they are the same...
//-(void)viewDidAppear:(BOOL)animated{ // this is for the view your comming from?- Never used this.
     //[self.picker reloadAllComponents];
//}
// When I dont have this I cant add more tickets in the manager view.
-(void)viewWillAppear:(BOOL)animated{
     [self.picker reloadAllComponents];
}



// TODO: Need to see why this works...
- (IBAction)buyPressed:(id)sender {
    Ticket *tempTicket = [[Ticket alloc] init];
    SoldTicket *tempSoldTicket = [[SoldTicket alloc] init];
    //To get the index of the selected row in the picker view
    NSInteger selectedRow = [self.picker selectedRowInComponent: 0]; // this must be 0.
    
    // is it beacuse I'm assigning temp object to another object and they are pointing to the same thing?
    tempTicket = [self.Ticket.ticketsAvailable objectAtIndex:selectedRow];
    
    //convert string to int and store calculation in int
    double total =  [self.qutyEnteredDisplay.text doubleValue] * tempTicket.price;
    NSString* totalStr = [NSString stringWithFormat:@"%.2f", total];
    self.totalDisplay.text = [@"$" stringByAppendingString:totalStr];

    // not sure how this is working since we did not put it in the picker array?? This is a temp object so how is it changing the picker?
    tempTicket.quanity = tempTicket.quanity - [self.qutyEnteredDisplay.text intValue];
    // create a soldTicket object that will be pushed in an array
    tempSoldTicket.ticketSoldName = tempTicket.name;
    tempSoldTicket.numbSold = [self.qutyEnteredDisplay.text intValue];
    tempSoldTicket.dateSold = [NSDate date];
    tempSoldTicket.price = total; // eg. if you by 2 courtside tickets the price will be 27777*2;
    [self.Ticket buyTicket:tempSoldTicket]; // push in array of ticketmaster
    self.qutyEnteredDisplay.text = @"";
    [self.picker reloadAllComponents]; // this works!

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ManagerViewController* manVc = (ManagerViewController*) [segue destinationViewController];
    manVc.ManagerVcSoldTicketsPublicArray = self.Ticket.soldTickets; // assign soldTickets array of ticketMaster into ManagerVcSoldTicketsPublicArray
    manVc.ManagerVSTicketsAvailablePublicArray = self.Ticket.ticketsAvailable;
}
@end


/*
 Original code in:
 - (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
 Keept here for learning pupurposes
switch(row){
    case 0:
        // First grab the object out of the array, assign it to another one and get the values.
        tempTicket = [self.Ticket.ticketsAvailable objectAtIndex:0];
        title = [NSString stringWithFormat: @"%@ %d price: %d$", tempTicket.name, tempTicket.quanity,  tempTicket.price];
        self.ticketTypeDisplay.text = tempTicket.name;
        break;
    case 1:
        tempTicket = [self.Ticket.ticketsAvailable objectAtIndex:1];
        title = [NSString stringWithFormat: @"%@ %d price: %d$", tempTicket.name, tempTicket.quanity,  tempTicket.price];
        self.ticketTypeDisplay.text = tempTicket.name;
        break;
    case 2:
        tempTicket = [self.Ticket.ticketsAvailable objectAtIndex:2];
        title = [NSString stringWithFormat: @"%@ %d price: %d$", tempTicket.name, tempTicket.quanity,  tempTicket.price];
        self.ticketTypeDisplay.text = tempTicket.name;
        break;
}*/
