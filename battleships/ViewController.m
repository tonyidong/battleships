//
//  ViewController.m
//  battleships
//
//  Created by Maciej Simm on 26/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import "ViewController.h"
#import "Game.h"
#import "Ship.h"
#import "SeaMap.h"
#import "Tile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.mapView = [[NSMutableArray alloc] initWithCapacity:64];
    self.game = [[Game alloc] init];
    
// 300 szerokości
//
    CGPoint startPoint = CGPointMake(8.0f, 120.0f);
    CGSize sizeOfPoint = CGSizeMake(38.0f, 38.0f);
    
    self.target = nil;
    
    for (MapPoint* point in self.game.map.mapPoints) {
        float position_x = startPoint.x + (point.pos_x * sizeOfPoint.width);
        float position_y = startPoint.y + (point.pos_y * sizeOfPoint.height);
        Tile* tile = [[Tile alloc] initWithFrame:CGRectMake(position_x, position_y, sizeOfPoint.width, sizeOfPoint.height)];
        tile.point = point;
        [self.view addSubview:tile];
        [self.mapView addObject:tile];
    }
    
    self.currentTarget = [[UILabel alloc] initWithFrame:CGRectMake(8.0f, 430.0f, 300.0f, 50.0f)];
    [self.currentTarget setText:@"No target"];
    [self.view addSubview:self.currentTarget];
    
    self.successInfo = [[UILabel alloc] initWithFrame:CGRectMake(8.0f, 20.0f, 300.0f, 50.0f)];
    [self.successInfo setText:@""];
    [self.view addSubview:self.successInfo];

    self.shipsLeftOnSea = [[UILabel alloc] initWithFrame:CGRectMake(8.0f, 70.0f, 300.0f, 50.0f)];
    [self.shipsLeftOnSea setText:@"Statków na morzu: 6"];
    [self.view addSubview:self.shipsLeftOnSea];
    
    self.shootButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.shootButton.frame = CGRectMake(8.0f, 500.0f, 300.0f, 50.0f);
    self.shootButton.backgroundColor = [UIColor whiteColor];
    self.shootButton.layer.borderWidth = 1;
    self.shootButton.layer.borderColor = [UIColor redColor].CGColor;
    [self.shootButton setTitle:@"Shoot!" forState:UIControlStateNormal];
    
    [self.shootButton addTarget:self action:@selector(shootConfirmed:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:self.shootButton];
    
    UITapGestureRecognizer* gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    gestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gestureRecognizer];

}

- (void)viewTapped:(UITapGestureRecognizer*)recognizer {
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        CGPoint point = [recognizer locationInView:self.view];
        
        for (Tile* tile in self.mapView) {
            if(CGRectContainsPoint([tile frame], point)) {
                NSString* target1 = [NSString stringWithFormat:@"Target set:   Lat: %d", tile.point.pos_x+1];
                NSString* target2 = [NSString stringWithFormat:@" Long: %d", tile.point.pos_y+1];
                NSString* target = [target1 stringByAppendingString:target2];
                [self.currentTarget setText:target];
                [self setMyTarget: tile];
                break;
            }
            else {
                [self.currentTarget setText:@"No target"];
                [self setMyTarget: nil];
            }
        }
        
    }
}

- (void)setMyTarget:(Tile *)target {
    if (!self.target == nil) {
        self.target.backgroundColor = [UIColor whiteColor];
    }
    self.target = target;
    self.target.backgroundColor = [UIColor redColor];
}

- (void)shootConfirmed:(UIButton *)button {
    if (!self.target == nil) {
        BOOL hit = [self.game shotOnMap:self.game.map OnTarget:self.target.point];
        Tile* target = self.target;
        if (hit==TRUE) {
            [self.successInfo setText:@"Good shot!"];
            [self setMyTarget: nil];
            target.backgroundColor = [UIColor redColor];
        } else {
            [self.successInfo setText:@"You're a looser!"];
            [self setMyTarget: nil];
            target.backgroundColor = [UIColor lightGrayColor];
        }
        int leftOnSea = [self.game.map.ships count];
        NSString* leftOnSeaText = [NSString stringWithFormat:@"Ships on sea: %d",leftOnSea];
        [self.shipsLeftOnSea setText:leftOnSeaText];
        
        if ([self.game.map.ships count] == 0 ) {
            [self.successInfo setText:@"END OF THE GAME!"];
        }
    }
}

//    Game* game = self.game;
    
//    while (![game.map.ships count]==0) {
//        MapPoint *target = [game.map.mapPoints objectAtIndex:0];
//        BOOL hit = [game shotOnMap:game.map OnTarget:target];
//        if (hit==TRUE) { NSLog(@"mac1"); };
        
//        target = [game.map.mapPoints objectAtIndex:1];
//       hit = [game shotOnMap:game.map OnTarget:target];
//        if (hit==TRUE) { NSLog(@"mac2"); };
        
//        target = [game.map.mapPoints objectAtIndex:2];
//       hit = [game shotOnMap:game.map OnTarget:target];
//        if (hit==TRUE) { NSLog(@"mac3"); };
        
//        target = [game.map.mapPoints objectAtIndex:3];
//        hit = [game shotOnMap:game.map OnTarget:target];
//        if (hit==TRUE) { NSLog(@"mac4"); };
        
        
//        int currIndex = [game.map.ships count]-1;
//        [game.map.ships removeObjectAtIndex:currIndex];
//   }



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tileTapped:(UIGestureRecognizer*)recognizer {
    
}

@end
