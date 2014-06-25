//
//  Currentpin.m
//  bogopogo
//
//  Created by Digvijay on 09/04/14.
//  Copyright (c) 2014 samar singla. All rights reserved.
//

#import "Currentpin.h"
#import "selectLocationViewController.h"

@implementation Currentpin
@synthesize title,coordinate,subtitle;
@synthesize nodes;

- (NSUInteger) nodeCount
{
    
    
   
    if( nodes )
    {
       
            return [nodes count];
       
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
