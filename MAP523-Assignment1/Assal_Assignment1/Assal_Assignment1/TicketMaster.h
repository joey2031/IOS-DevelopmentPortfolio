//
//  TicketMaster.h
//  Assal_Assignment1
//
#import <Foundation/Foundation.h>
#import "Ticket.h"
#import "SoldTicket.h"

NS_ASSUME_NONNULL_BEGIN

@interface TicketMaster : NSObject
@property (nonatomic) NSMutableArray *ticketsAvailable;
@property (nonatomic) NSMutableArray *soldTickets;
-(void) createTickets;
-(void) buyTicket:(SoldTicket*)p_soldTicket;

@end

NS_ASSUME_NONNULL_END
