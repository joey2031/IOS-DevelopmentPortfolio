//
//  HistoryViewController.m
//  Assal_Assignment1
//


#import "HistoryViewController.h"
#import "TicketMaster.h"
#import "SoldTicket.h"
#import "PurchaseDetailViewController.h"

@interface HistoryViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@end

@implementation HistoryViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.HistoryVcSoldTicketsPublicArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    SoldTicket* s_ticket = self.HistoryVcSoldTicketsPublicArray[indexPath.row];
    NSString* quty = [NSString stringWithFormat:@"%d", s_ticket.numbSold];
    cell.textLabel.text = s_ticket.ticketSoldName;
    cell.detailTextLabel.text = quty;
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SoldTicket *tempTicket = [[SoldTicket alloc] init]; // temp object in this scope
    tempTicket = [self.HistoryVcSoldTicketsPublicArray objectAtIndex:self.table.indexPathForSelectedRow.row];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEEE MMM d, yyyy HH:mm:ss"];

 
    PurchaseDetailViewController *purVC = [segue destinationViewController];
    purVC.itemName = tempTicket.ticketSoldName;
    purVC.itemQunty = [NSString stringWithFormat:@"%d", tempTicket.numbSold];
    purVC.itemTotal = [NSString stringWithFormat:@"%.2f", tempTicket.price]; // in this case- by tempTicket.price, I mean total
    purVC.itemDate = [NSString stringWithFormat:@"%@", tempTicket.dateSold]; // this is a NSDate, first we need to format it
    
}
@end
