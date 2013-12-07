//
//  MapPoint.m
//  battleships
//
//  Created by Maciej Simm on 27/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

-(id)initWithPosX:(int)pos_x PosY:(int)pos_y {
    if (self = [super init]) {
        self.pos_x = pos_x;
        self.pos_y = pos_y;
    }
    return self;
};

@end
