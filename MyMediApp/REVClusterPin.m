//
//  
//    ___  _____   ______  __ _   _________ 
//   / _ \/ __/ | / / __ \/ /| | / / __/ _ \
//  / , _/ _/ | |/ / /_/ / /_| |/ / _// , _/
// /_/|_/___/ |___/\____/____/___/___/_/|_| 
//
//  Created by Bart Claessens. bart (at) revolver . be
//

#import "REVClusterPin.h"


@implementation REVClusterPin
@synthesize title,coordinate,subtitle;
@synthesize nodes;

- (NSUInteger) nodeCount
{
   
    
    int k=0;
    if( nodes )
    {
        for (int p=0; p<[nodes count]; p++)
        {
            NSLog(@"%@",[[nodes objectAtIndex:p]title]);
        if ([[[nodes objectAtIndex:p]title] isEqualToString:@"you are here"])
        {
            k++;
        }
            else
            {
                
            }
        }
        if (k!=0) {
            return [nodes count]-1;
        }
        else
        {
            return [nodes count];
        }
    }
    //current location excluded
    return 0;
}

#if !__has_feature(objc_arc)
- (void)dealloc
{
    [title release];
    [subtitle release];
    [nodes release];
    [super dealloc];
}
#endif

@end
