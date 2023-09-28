//
//  PurchaseDetailViewController.m
//  Assal_Assignment1
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
    self.item.text = self.itemName;
    self.qunty.text = self.itemQunty;
    self.total.text = [@"$" stringByAppendingString:self.itemTotal];
    self.date.text = self.itemDate;
    
}
@end
