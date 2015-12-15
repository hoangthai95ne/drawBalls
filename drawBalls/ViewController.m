//
//  ViewController.m
//  drawBalls
//
//  Created by Hoàng Thái on 12/15/15.
//  Copyright © 2015 HOANGTHAI. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat _margin;
    CGFloat _ballDiameter;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _margin = 40.0;
    _ballDiameter = 24.0;
   
    NSLog(@"Number of column can draw: %d", [self numberOfColumnCanDraw]);
    
    NSLog(@"space between rows with %d row: %3.0f", 18, [self spaceBetweenRowsWithRow:18]);
    
    [self drawBallsWithNumberInRows:10 andNumberOfColumn:18];
}

- (void) placeGrayBallAtX: (CGFloat) x 
                     andY: (CGFloat) y 
                  withTag: (CGFloat) tag
{
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    ball.center = CGPointMake(x, y);
    ball.tag = tag;
    [self.view addSubview:ball];
}

- (CGFloat) spaceBetweenBallCenterWhenNumberOfBallIsKnown: (int) n {
    return (self.view.bounds.size.width - 2 * _margin) / (n - 1);
}

- (int) numberOfColumnCanDraw {
    return (self.view.bounds.size.height - 2 * _margin) / _ballDiameter;
}

- (CGFloat) spaceBetweenRowsWithRow: (int) row {
    return (self.view.bounds.size.height - 2 * _margin) / (row - 1);
}

- (void) numberOfBallsVSSpace {
    bool stop = false;
    int n = 3;
    while (!stop) {
        CGFloat space = [self spaceBetweenBallCenterWhenNumberOfBallIsKnown: n];
        if (space < _ballDiameter) {
            stop = true;
        }
        else {
            NSLog(@"Number of balls: %d and space between balls: %3.0f", n, space);
        }
        n++;
    }
}

- (void) drawRowBalls: (int) numberBalls {
    CGFloat space = [self spaceBetweenBallCenterWhenNumberOfBallIsKnown:numberBalls];
    for(int i = 0; i < numberBalls; i++) {
        [self placeGrayBallAtX:_margin + i * space
                          andY:200 
                       withTag:i + 1];
    }
}

- (void) drawBallsWithNumberInRows: (int) numberBallsInRow andNumberOfColumn: (int) numberOfColumn {
    CGFloat spaceBetweenBallsInRow = [self spaceBetweenBallCenterWhenNumberOfBallIsKnown:numberBallsInRow];
    CGFloat spaceBetweenRows = [self spaceBetweenRowsWithRow:numberOfColumn];
    for (int i = 0; i < numberOfColumn; i++)
    {
        for (int j = 0; j < numberBallsInRow; j++)
        {
            [self placeGrayBallAtX:_margin + j * spaceBetweenBallsInRow
                              andY:_margin + i * spaceBetweenRows
                           withTag:1];
        }
    }
}

- (void) checkSizeOfApp {
    CGSize size = self.view.bounds.size;
    NSLog(@"Width = %3.0f, Height = %3.0f", size.width, size.height);
}

@end
