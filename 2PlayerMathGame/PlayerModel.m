//
//  PlayerModel.m
//  2PlayerMathGame
//
//  Created by Carl Udren on 1/18/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "PlayerModel.h"

@interface PlayerModel()

@property (nonatomic, assign) NSInteger lives;

@end

@implementation PlayerModel

+ (instancetype) newPlayer{
    PlayerModel *newPlayer = [[PlayerModel alloc] init];
    newPlayer.lives = 3;
    return newPlayer;
}

- (void) subtractLife{
    self.lives--;
}

- (NSInteger) getLives{
    return self.lives;
}


@end
