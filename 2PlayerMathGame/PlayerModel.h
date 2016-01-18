//
//  PlayerModel.h
//  2PlayerMathGame
//
//  Created by Carl Udren on 1/18/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerModel : NSObject

+ (instancetype) newPlayer;

- (NSInteger) getLives;

- (void) subtractLife;

@end
