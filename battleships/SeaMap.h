//
//  SeaMap.h
//  battleships
//
//  Created by Maciej Simm on 26/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ship.h"

@interface SeaMap : NSObject

@property (nonatomic) NSMutableArray* ships;
@property (nonatomic) NSMutableArray* mapPoints;
@property (nonatomic) int mapSize;
@property (nonatomic) int fleetSize;

-(id)initWithMapSize:(int)mapSize FleetSize:(int)fleetSize;
-(void)generateShipsOnMap:(SeaMap*)map;

@end
