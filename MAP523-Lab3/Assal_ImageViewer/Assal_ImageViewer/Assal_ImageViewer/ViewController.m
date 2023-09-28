//
//  ViewController.m
//  Assal_ImageViewer
//

//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property NSArray* imageAddresses;
@property int i;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageAddresses = [NSArray
                      arrayWithObjects:
                      @"https://images.freeimages.com/images/large-previews/1cb/close-squirrel-1381764.jpg",
                      @"https://images.freeimages.com/images/large-previews/13f/natal-sofia-4-1431300.jpg",
                      @"https://images.freeimages.com/images/large-previews/5c8/hill-top-town-1383789.jpg",
                      @"https://images.freeimages.com/images/large-previews/1b4/car-1555101.jpg",
                      @"https://images.freeimages.com/images/large-previews/598/flowers-1380985.jpg",
                      nil];
    self.i = 0;

    
    //What this code is saying: create a new thread and fetch the image, then come back to the main thread to update the imageView
    // In summary: Create new thread, in the second thread fetch the image and then go to the main thread and update the imageView.
    dispatch_queue_t myQ = dispatch_queue_create("myQ", NULL); // thread 2
    // Block A
    dispatch_async(myQ, ^{
        UIImage *img = [self fetch:0]; // fetch image in second thread
        dispatch_async(dispatch_get_main_queue(), ^{ // Get the main Queue (AKA thread) and update the imageView- Update UI
            self.imageView.image = img;
        });
    });
}

-(UIImage*) fetch: (int) index{
    NSString* url = [self.imageAddresses objectAtIndex:index];
    NSURL *urlObj = [NSURL URLWithString:url];
    NSData *data = [NSData dataWithContentsOfURL:urlObj];
    return [UIImage imageWithData:data];
}

- (IBAction)prevAction:(id)sender {
    NSLog(@"Prev");
    if(self.i <= 0){
      self.i = 5; // set to 5 so when it goes down by 1 it will go back to 4
    }
    if(self.i > 0){
        self.i--;
    }
     self.imageView.image = [self fetch:self.i]; // Update UI in main thread
}
- (IBAction)nextAction:(id)sender {
    NSLog(@"next");
    if(self.i >= 4){
        self.i = -1; // set to -1 so when it goes down by 1 it will go back to 0
    }
    if(self.i < 6){
        self.i++;
    }
     self.imageView.image = [self fetch:self.i]; // Update UI in main thread
}

@end

/*
 Images
 1. https://images.freeimages.com/images/large-previews/1cb/close-squirrel-1381764.jpg
 2. https://images.freeimages.com/images/large-previews/13f/natal-sofia-4-1431300.jpg
 3. https://images.freeimages.com/images/large-previews/5c8/hill-top-town-1383789.jpg
 4. https://images.freeimages.com/images/large-previews/1b4/car-1555101.jpg
 5. https://images.freeimages.com/images/large-previews/598/flowers-1380985.jpg
 **/
