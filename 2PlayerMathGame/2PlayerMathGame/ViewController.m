//
//  ViewController.m
//  2PlayerMathGame
//
//  Created by Carl Udren on 1/18/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "PlayerModel.h"

@interface ViewController ()

@property (nonatomic, strong) GameModel *gameModel;
@property (nonatomic, strong) PlayerModel *player1;
@property (nonatomic, strong) PlayerModel *player2;
@property (nonatomic, strong) NSMutableString *textFieldText;
@property (nonatomic, strong) NSDictionary *answerDictionary;
@property (nonatomic, strong) NSString *playerTurnString;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.oneButton.clipsToBounds = YES;
    self.oneButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.twoButton.clipsToBounds = YES;
    self.twoButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.threeButton.clipsToBounds = YES;
    self.threeButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.fourButton.clipsToBounds = YES;
    self.fourButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.fiveButton.clipsToBounds = YES;
    self.fiveButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.sixButton.clipsToBounds = YES;
    self.sixButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.sevenButton.clipsToBounds = YES;
    self.sevenButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.eightButton.clipsToBounds = YES;
    self.eightButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.nineButton.clipsToBounds = YES;
    self.nineButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.zeroButton.clipsToBounds = YES;
    self.zeroButton.layer.cornerRadius = CGRectGetWidth(self.oneButton.frame) / 2.0f;
    self.enterButton.clipsToBounds = YES;
    self.enterButton.layer.cornerRadius = CGRectGetWidth(self.enterButton.frame) / 2.0f;


    // Do any additional setup after loading the view, typically from a nib.

    self.gameModel = [[GameModel alloc] init];
    self.player1 = [PlayerModel newPlayer];
    self.player2 = [PlayerModel newPlayer];
    self.textFieldText = [NSMutableString stringWithString:@""];
    self.player1Lives.text = [NSString stringWithFormat:@"Player 1 Lives: %ld",[self.player1 getLives]];
    self.player2Lives.text = [NSString stringWithFormat:@"Player 2 Lives: %ld",[self.player2 getLives]];
    self.playerTurnString = @"Player 2:";
    self.playerTurn.text = self.playerTurnString;
    [self newQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)oneButton:(id)sender {
    [self.textFieldText appendString:@"1"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)twoButton:(id)sender {
    [self.textFieldText appendString:@"2"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)threeButton:(id)sender {
    [self.textFieldText appendString:@"3"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)fourButton:(id)sender {
    [self.textFieldText appendString:@"4"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)fiveButton:(id)sender {
    [self.textFieldText appendString:@"5"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)sixButton:(id)sender {
    [self.textFieldText appendString:@"6"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)sevenButton:(id)sender {
    [self.textFieldText appendString:@"7"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)eightButton:(id)sender {
    [self.textFieldText appendString:@"8"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)nineButton:(id)sender {
    [self.textFieldText appendString:@"9"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)zeroButton:(id)sender {
    [self.textFieldText appendString:@"0"];
    self.answerText.text = [self.textFieldText copy];
}

- (IBAction)enterButton:(id)sender {
    if ([self.answerDictionary[@"answer"] isEqualToString:[self.textFieldText copy]]) {
        self.correctOrNot.textColor = [UIColor greenColor];
        self.correctOrNot.text = @"Correct!";
        self.correctOrNot.alpha = 1.0;
        [UIView animateWithDuration:0.5
    delay:1.0
    options: UIViewAnimationOptionCurveEaseOut
    animations:^{
        self.correctOrNot.alpha = 0.0;
    }
         completion:nil];
        [self newQuestion];
    } else {
        self.correctOrNot.textColor = [UIColor redColor];
        self.correctOrNot.text = @"Incorrect!";
        self.correctOrNot.alpha = 1.0;
        [UIView animateWithDuration:0.5
                              delay:1.0
                            options: UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             self.correctOrNot.alpha = 0.0;
                         }
                         completion:nil];
        if ([self.playerTurnString isEqualToString:@"Player 1:"]) {
            [self.player1 subtractLife];
            if ([self.player1 getLives]==0) {[self endGame];}
            self.player1Lives.text = [NSString stringWithFormat:@"Player 1 Lives: %ld",[self.player1 getLives]];
            [self newQuestion];
        } else {
            [self.player2 subtractLife];
            if ([self.player2 getLives]==0) {[self endGame];}
            self.player2Lives.text = [NSString stringWithFormat:@"Player 2 Lives: %ld",[self.player2 getLives]];
            [self newQuestion];
        }
    }
    self.textFieldText = [NSMutableString stringWithString:@""];
    self.answerText.text = self.textFieldText;
}

- (void) newQuestion{
    if ([self.playerTurnString isEqualToString:@"Player 1:"]) {
        self.playerTurnString = @"Player 2:";
        self.playerTurn.text = self.playerTurnString;
    } else {
        self.playerTurnString = @"Player 1:";
        self.playerTurn.text = self.playerTurnString;
    }
    self.answerDictionary = [self.gameModel generateQuestion];
    self.mathQuestion.text = self.answerDictionary[@"question"];
    
}

-(void)endGame{
    NSString *alertMessage = @"";
    if ([self.player1 getLives] == 0) {
        alertMessage = @"Player 2 Wins!";
    } else {
        alertMessage = @"Player 1 Wins!";
    }
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Game Over!"
                                          message:alertMessage
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *restartAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"New Game", @"Newgame action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [self viewDidLoad];
                               }];
    [alertController addAction:restartAction];
    [self presentViewController:alertController animated:YES completion:nil];


}
@end
