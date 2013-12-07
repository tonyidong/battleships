//
//  Tile.m
//  battleships
//
//  Created by Maciej Simm on 07/12/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import "Tile.h"

@implementation Tile

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor redColor].CGColor;
        self.backgroundColor = [UIColor whiteColor];
        
//        UITapGestureRecognizer * tapTile = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tileTapped:)];
//        tapTile.numberOfTapsRequired = 1;
//        [self addGestureRecognizer:tapTile];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
