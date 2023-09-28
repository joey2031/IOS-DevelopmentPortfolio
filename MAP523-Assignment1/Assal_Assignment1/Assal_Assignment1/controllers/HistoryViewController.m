//
//  HistoryViewController.m
//  Assal_Assignment1
//

//

/*
 My biggest error: you must right click on tableView in the
 storyboard and under outlets drag dataSource and delegate
 to the first icon on top of the view controller.
  */

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
    // Ask prof. Not sure when to use prototype cells and when not to.
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
    
    
    // nothing is getting set for some reason- Wanted to use object, but not working.
    /*
    purVC.purTicket.ticketSoldName = tempTicket.ticketSoldName;
    purVC.purTicket.numbSold = tempTicket.numbSold;
    purVC.purTicket.price = tempTicket.price; // By price I really mean total in this conxext.
    purVC.purTicket.dateSold = tempTicket.dateSold;
    
    NSLog(@"Inside history:");
    NSLog(@"%d", purVC.purTicket.numbSold);
    NSLog(@"%.2f", purVC.purTicket.price);
    NSLog(@"%@", purVC.purTicket.dateSold);
    NSLog(@"%@", purVC.purTicket.dateSold);
     */
    
    
}

// ctrl click from main controller to this and selected show
// click arrow connecting the 2 view controllers and name it


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
