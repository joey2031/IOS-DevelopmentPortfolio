//
//  PurchaseDetailViewController.m
//  Assal_Assignment1
//

//

#import "PurchaseDetailViewController.h"

@interface PurchaseDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *item;
@property (weak, nonatomic) IBOutlet UILabel *qunty;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UILabel *date;
@end

@implementation PurchaseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.purTicket = [[SoldTicket alloc] init];
    // ended up doing this, couldnt get the object to work
    self.item.text = self.itemName;
    self.qunty.text = self.itemQunty;
    self.total.text = [@"$" stringByAppendingString:self.itemTotal];
    self.date.text = self.itemDate;
    
    
    /*
     This works, so how come I can't set the values in the other view controller.
    self.purTicket.price = 99.9;
    self.purTicket.numbSold = 100;
    
    NSLog(@"%d", self.purTicket.numbSold);
    NSLog(@"%f", self.purTicket.price);
     */
    
    // Do any additional setup after loading the view.
    
    /*
    NSLog(@"%@", self.purTicket.ticketSoldName);
    NSLog(@"%d", self.purTicket.numbSold);
    NSLog(@"%@", self.purTicket.dateSold);
    NSLog(@"%@", self.purTicket.price);
    */

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
