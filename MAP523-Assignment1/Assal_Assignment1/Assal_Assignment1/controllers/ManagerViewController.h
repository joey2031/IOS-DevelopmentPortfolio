//
//  ManagerViewController.h
//  Assal_Assignment1
//

//
// Did action segue for this view.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ManagerViewController : UIViewController
// It looks like I have to pass the array to manager and then history.
// Array of sold tickets
@property (nonatomic) NSMutableArray *ManagerVcSoldTicketsPublicArray;
@property (nonatomic) NSMutableArray *ManagerVSTicketsAvailablePublicArray;
@end

NS_ASSUME_NONNULL_END
