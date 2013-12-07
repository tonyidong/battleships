//
//  Game.h
//  battleships
//
//  Created by Maciej Simm on 26/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SeaMap.h"
#import "Ship.h"
#import "MapPoint.h"

@interface Game : NSObject

@property (nonatomic) SeaMap* map;

-(id)init;
-(BOOL)shotOnMap:(id)map OnTarget:(MapPoint *)target;

@end
