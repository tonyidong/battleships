//
//  Ship.m
//  battleships
//
//  Created by Maciej Simm on 26/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import "Ship.h"
#import "MapPoint.h"
#import "SeaMap.h"

@implementation Ship


-(id)initOnMap:(SeaMap *)map WithPositionX:(int)position_x PositionY:(int)position_y Layout:(BOOL)horizontal Size:(int)size {
    if (self = [super init]) {
        self.position = [map.mapPoints objectAtIndex:position_x*8+position_y];
        self.size = size;
        self.horizontal = horizontal;
        self.shipPoints = [[NSMutableArray alloc] initWithCapacity:size];
        
        // Define points that the ship is made of
        [self defineShipParts:self.position ForSize:self.size Layout:self.horizontal OnMap:map];
    }
    return self;
}

-(void)defineShipParts:(MapPoint *)startPoint ForSize:(int)size Layout:(BOOL)horizontal OnMap:(SeaMap *)map {
    [self.shipPoints addObject:startPoint];
    
    for (int i=1; i<size; i++) {
        MapPoint* part = [[MapPoint alloc] init];
        if (horizontal) {
            part = [map.mapPoints objectAtIndex:(startPoint.pos_x*8+startPoint.pos_y+i)];
        }
        else {
            part = [map.mapPoints objectAtIndex:((startPoint.pos_x+i)*8+startPoint.pos_y)];
        }
        [self.shipPoints addObject:part];
    }
};

@end
