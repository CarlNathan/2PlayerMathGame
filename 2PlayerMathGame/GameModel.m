//
//  GameModel.m
//  2PlayerMathGame
//
//  Created by Carl Udren on 1/18/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "GameModel.h"
#import <stdlib.h>

@implementation GameModel

-(NSDictionary *)generateQuestion{
    NSMutableDictionary *questionDictionary = [[NSMutableDictionary alloc] init];
    NSInteger x = arc4random_uniform(10);
    NSInteger y = arc4random_uniform(10);
    NSInteger opperation = arc4random_uniform(3);
    
    NSString *answer;
    NSString *question;
    switch (opperation) {
        case 0:
            answer = [NSString stringWithFormat:@"%ld",x + y];
            question = [NSString stringWithFormat:@"%ld + %ld = ", x, y];
            break;
            
        case 1:
            if (y > x) {
                NSInteger z = x;
                x = y;
                y = z;
            }
            answer = [NSString stringWithFormat:@"%ld",x - y];
            question = [NSString stringWithFormat:@"%ld - %ld = ", x, y];
            break;
            
        case 2:
            answer = [NSString stringWithFormat:@"%ld",x * y];
            question = [NSString stringWithFormat:@"%ld x %ld = ", x, y];
            break;
            
        default:
            break;
    }
    questionDictionary[@"question"] = question;
    questionDictionary[@"answer"] = answer;
    return [questionDictionary copy];
}


@end
