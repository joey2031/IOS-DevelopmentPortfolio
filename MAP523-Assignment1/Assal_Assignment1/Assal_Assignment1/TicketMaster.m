//
//  TicketMaster.m
//  Assal_Assignment1
//

//

#import "TicketMaster.h"

@implementation TicketMaster
// allocate memory for the ticketsAvailable array
-(NSMutableArray*)ticketsAvailable{
    if(_ticketsAvailable == nil){
        _ticketsAvailable = [[NSMutableArray alloc] init];
    }
    return _ticketsAvailable;
}
// allocate memory for the soldTickets array
-(NSMutableArray*) soldTickets{
    if(_soldTickets == nil){
        _soldTickets = [[NSMutableArray alloc] init];
    }
    return _soldTickets;
}


-(void) createTickets{
    Ticket *t1 = [[Ticket alloc] init];
    Ticket *t2 = [[Ticket alloc] init];
    Ticket *t3 = [[Ticket alloc] init];
    t1.name = @"Balcony Level Ticket";
    t2.name = @"Lower Level Ticket";
    t3.name = @"Courtside";
    
    t1.quanity = 12;
    t2.quanity = 9;
    t3.quanity = 2;
    
    t1.price = 1170;
    t2.price = 10434;
    t3.price = 27777;
    
    [self.ticketsAvailable addObject:t1];
    [self.ticketsAvailable addObject:t2];
    [self.ticketsAvailable addObject:t3];
}

-(void) buyTicket:(SoldTicket*)p_soldTicket{
    SoldTicket *soldTicket = [[SoldTicket alloc] init];
    SoldTicket *testTempTicket = [[SoldTicket alloc] init];
    // copy the object.
    soldTicket.dateSold = p_soldTicket.dateSold;
    soldTicket.numbSold = p_soldTicket.numbSold;
    soldTicket.price = p_soldTicket.price;
    // push in array
    [self.soldTickets addObject:p_soldTicket];
    testTempTicket = [self.soldTickets objectAtIndex:0];
    
    
    //NSLog(@"%@", testTempTicket.dateSold);
    //NSLog(@"%d", testTempTicket.numbSold);
    //NSLog(@"%f", testTempTicket.price);
    //NSLog(@"%@", self.soldTickets);


}

@end
