//
//  Currentpin.h
//  bogopogo
//
//  Created by Digvijay on 09/04/14.
//  Copyright (c) 2014 samar singla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Currentpin : NSObject  <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
    
    NSArray *nodes;
    
}
@property(nonatomic, retain) NSArray *nodes;
@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subtitle;

- (NSUInteger) nodeCount;

@end

