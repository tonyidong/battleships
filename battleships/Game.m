//
//  Game.m
//  battleships
//
//  Created by Maciej Simm on 26/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import "Game.h"
#import "SeaMap.h"

@implementation Game

- (id)init {
    if (self = [super init]) {
        self.map = [[SeaMap alloc] initWithMapSize:8 FleetSize:6   ];
        [self.map generateShipsOnMap: self.map];
    }
    return self;
}

- (BOOL)shotOnMap:(SeaMap *)map OnTarget:(MapPoint *)target {
    BOOL result = FALSE;
    for (Ship* ship in map.ships) {
        if ([ship.shipPoints containsObject:target]) {
            result = TRUE;
            [ship.shipPoints removeObject:target];
            int leftToHit = [ship.shipPoints count];
            if (leftToHit == 0) {
                int sinkShip = [map.ships indexOfObject:ship];
                [map.ships removeObjectAtIndex:sinkShip];
                break;
            };
        };
    };
    return result;
}

@end
