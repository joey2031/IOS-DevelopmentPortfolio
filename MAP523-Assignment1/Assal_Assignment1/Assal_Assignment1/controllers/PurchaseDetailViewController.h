//
//  PurchaseDetailViewController.h
//  Assal_Assignment1
//

#import <UIKit/UIKit.h>
#import "SoldTicket.h"

NS_ASSUME_NONNULL_BEGIN

@interface PurchaseDetailViewController : UIViewController
@property NSString*itemName;
@property NSString* itemQunty;
@property NSString* itemTotal;
@property NSString* itemDate;
@property SoldTicket *purTicket; 
@end

NS_ASSUME_NONNULL_END
