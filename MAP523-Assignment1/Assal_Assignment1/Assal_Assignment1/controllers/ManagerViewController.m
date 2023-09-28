//
//  ManagerViewController.m
//  Assal_Assignment1
//

//

/*To "Connect" a view controller to a file first make a new coca class touch classa subclass of UIViewController, then in the story board go to the click on your view make sure the editior for the view on the right is opened, click show idenity inspector (next to the questionmark button) under custom class it lets you enter a class, enter the coca touch class you made for that view.*/

#import "ManagerViewController.h"
#import "HistoryViewController.h"
#import "ResetViewController.h"
//#import "SoldTicket.h"
@interface ManagerViewController ()
@end

@implementation ManagerViewController
// do we need lazy loading in this??
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// Also give segues ids
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"historySegue"]){
        HistoryViewController* histVc = (HistoryViewController*) [segue destinationViewController];
        histVc.HistoryVcSoldTicketsPublicArray = self.ManagerVcSoldTicketsPublicArray;
    }
    if([segue.identifier isEqualToString:@"resetSegue"]){
        ResetViewController* resetVc = (ResetViewController*) [segue destinationViewController];
        resetVc.ResetVSTicketsAvailablePublicArray = self.ManagerVSTicketsAvailablePublicArray;
    }
}


@end
