//
//  PieView.m
//  画饼状图
//
//  Created by ZKJ on 16/8/29.
//  Copyright © 2016年 ZKJ. All rights reserved.
//

#import "PieView.h"

@implementation PieView

- (NSArray *)arrayRandom
{
    int total = 100;
    int temp = 0;
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < arc4random_uniform(10) + 1; i ++) {
        temp = arc4random_uniform(total) + 1;
        [array addObject:@(temp)];
        
        if (total == temp) {
            break;
        }
        total -= temp;
    }
    
    if (total) {
        [array addObject:@(total)];
    }
    return array;
}

- (void)drawRect:(CGRect)rect
{
    NSArray *array = [self arrayRandom];
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    
    CGFloat begin = 0;
//    CGFloat angle = 0;
    CGFloat end = 0;
    
    for (int i = 0; i < array.count; i++) {
        begin = end;
        end = begin + [array[i] integerValue] / 100.0 * M_PI * 2;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:begin endAngle:end clockwise:YES];
        [path addLineToPoint:center];
        [[self colorRandom] set];
        [path fill];
    }
}

- (UIColor *)colorRandom
{
    CGFloat r = arc4random_uniform(256)/255.0;
    CGFloat g = arc4random_uniform(256)/255.0;
    CGFloat b = arc4random_uniform(256)/255.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}

#pragma mark - 1. 画饼图
- (void)drawPie1
{
    CGFloat pointXY = self.bounds.size.width * 0.5;
    CGPoint center = CGPointMake(pointXY, pointXY);
    
    CGFloat begin = 0;
    CGFloat angle = 0;
    CGFloat end = 0;
    
    angle = 30 /100.0 * M_PI *2;
    end = begin + angle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:pointXY - 10 startAngle:begin endAngle:end clockwise:YES];
    [path addLineToPoint:center];
    [[UIColor redColor] set];
    [path fill];
    
    begin = end;
    angle = 50 /100.0 * M_PI *2;
    end = begin + angle;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:pointXY - 10 startAngle:begin endAngle:end clockwise:YES];
    [path1 addLineToPoint:center];
    [[UIColor blueColor] set];
    [path1 fill];
    
    
    begin = end;
    angle = 20 /100.0 * M_PI *2;
    end = begin + angle;
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:center radius:pointXY - 10 startAngle:begin endAngle:end clockwise:YES];
    [path2 addLineToPoint:center];
    [[UIColor yellowColor] set];
    [path2 fill];
}

@end
