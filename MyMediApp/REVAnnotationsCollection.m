//
//  
//    ___  _____   ______  __ _   _________ 
//   / _ \/ __/ | / / __ \/ /| | / / __/ _ \
//  / , _/ _/ | |/ / /_/ / /_| |/ / _// , _/
// /_/|_/___/ |___/\____/____/___/___/_/|_| 
//
//  Created by Bart Claessens. bart (at) revolver . be
//
#import "REVAnnotationsCollection.h"


@implementation REVAnnotationsCollection

@synthesize xSum,ySum;
@synthesize collection;


- (id) init
{
    self = [super init];
    if( self )
    {
        collection = [[NSMutableArray alloc] init];
        xSum = 0;
        ySum = 0;
    }
    return self;
}

- (void) addObject:(id<MKAnnotation>)annotation;
{
    if ([collection containsObject:@"you are here"]) {
        
    }
    else
    {
         [collection addObject:annotation];
    }
   
    MKMapPoint mapPoint = MKMapPointForCoordinate( [annotation coordinate] );
    NSLog(@"%f",[annotation coordinate].latitude);
    NSLog(@"%f",[annotation coordinate].longitude);
    xSum += mapPoint.x;
    ySum += mapPoint.y;
}
- (id) objectAtIndex:(NSUInteger)index
{
   
    return [collection objectAtIndex:index];
}
- (NSUInteger) count
{
    return [collection count];
}

#if !__has_feature(objc_arc)
-(void)dealloc
{
    [collection release], collection = nil;
    [super dealloc];
}
#endif
@end
