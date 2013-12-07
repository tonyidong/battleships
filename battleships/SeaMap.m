//
//  SeaMap.m
//  battleships
//
//  Created by Maciej Simm on 26/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import "SeaMap.h"
#import "MapPoint.h"
#import "Ship.h"


@implementation SeaMap

-(id)initWithMapSize:(int)mapSize FleetSize:(int)fleetSize {
    if (self = [super init]) {
        self.mapSize = mapSize;
        self.fleetSize = fleetSize;
        self.ships = [[NSMutableArray alloc] initWithCapacity:fleetSize];
        self.mapPoints = [[NSMutableArray alloc] initWithCapacity:(mapSize * mapSize)];
        [self generateMapPoints:mapSize];
    }
    return self;
}

-(void)generateMapPoints:(int)mapSize {
    for (int i=0; i<mapSize; i++) {
        for (int j=0; j<mapSize; j++) {
            MapPoint * mapPoint = [[MapPoint alloc] initWithPosX:j PosY:i];
            [self.mapPoints addObject:mapPoint];
        }
    }
}

-(void)generateShipsOnMap:(SeaMap *)map {
    Ship *oneShip = [[Ship alloc] initOnMap:map WithPositionX:0 PositionY:0 Layout:YES Size:4];
    [self.ships addObject: oneShip];

    Ship *twoShip = [[Ship alloc] initOnMap:map WithPositionX:1 PositionY:3 Layout:NO Size:3];
    [self.ships addObject: twoShip];
    Ship *threeShip = [[Ship alloc] initOnMap:map WithPositionX:4 PositionY:3 Layout:YES Size:3];
    [self.ships addObject: threeShip];

    Ship *fourShip = [[Ship alloc] initOnMap:map WithPositionX:4 PositionY:6 Layout:NO Size:2];
    [self.ships addObject: fourShip];
    Ship *fiveShip = [[Ship alloc] initOnMap:map WithPositionX:0 PositionY:7 Layout:YES Size:2];
    [self.ships addObject: fiveShip];
    Ship *sixShip = [[Ship alloc] initOnMap:map WithPositionX:6 PositionY:5 Layout:YES Size:2];
    [self.ships addObject: sixShip];
}

@end
