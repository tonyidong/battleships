//
//  ViewController.h
//  battleships
//
//  Created by Maciej Simm on 26/11/13.
//  Copyright (c) 2013 Maciej Simm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "Ship.h"
#import "SeaMap.h"
#import "Tile.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) Game* game;
@property (nonatomic, strong) NSMutableArray* mapView;
@property (nonatomic, strong) UILabel* currentTarget;
@property (nonatomic, strong) UIButton* shootButton;
@property (nonatomic, strong) UILabel* successInfo;
@property (nonatomic, strong) UILabel* shipsLeftOnSea;
@property (nonatomic, strong) Tile* target;

@end
