//
//  PurchaseDetailViewController.h
//  Assal_Assignment1
//

//

#import <UIKit/UIKit.h>
#import "SoldTicket.h"

NS_ASSUME_NONNULL_BEGIN

/*
 Make sure the viewController in the story board id connected to the correct class. To do this select the top
 white rectangel, then select the yellow and white square that pops up. In the side bar select teh care icon
 under custom class enter the name of the class (the coca touch class you made for your viewController.)
 **/
@interface PurchaseDetailViewController : UIViewController
@property NSString*itemName;
@property NSString* itemQunty;
@property NSString* itemTotal;
@property NSString* itemDate;
@property SoldTicket *purTicket; // was not able to do this with a object.
@end

NS_ASSUME_NONNULL_END
