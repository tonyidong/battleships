//
//  MapPoint.h
//  battleships
//
//  Created by Maciej Simm on 27/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapPoint : NSObject

@property (nonatomic) int pos_x;
@property (nonatomic) int pos_y;

-(id)initWithPosX:(int)pos_x PosY:(int)pos_y;

@end
