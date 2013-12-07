//
//  Ship.h
//  battleships
//
//  Created by Maciej Simm on 26/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapPoint.h"
#import "SeaMap.h"

@interface Ship : NSObject

@property (nonatomic) NSMutableArray* shipPoints;
@property (nonatomic) int size;
@property (nonatomic) BOOL horizontal;
@property (nonatomic) MapPoint * position;

-(id)initOnMap:(id)map WithPositionX:(int)position_x PositionY:(int)position_y Layout:(BOOL)horizontal Size:(int)size;

@end
