//
//  FlashView.m
//  githu2
//
//  Created by ibokan on 15/11/3.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import "FlashView.h"

@interface FlashView(){
    NSString *_text;
}

@property (nonatomic) CGFloat width;

@end

@implementation FlashView

-(instancetype)initWithDelegate:(UITableView *)table{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, table.bounds.size.width, 100);
        _width = table.bounds.size.width * 0.5;
        _table = table;
        UIEdgeInsets point = {-100,0,0,0};
        self.table.contentInset =  point;
    }
    self.backgroundColor = [UIColor whiteColor];
    return self;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    _height = self.table.contentOffset.y - 36;
//    NSLog(@"相对高度：%f",_height);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 0, 0, 1, 1);
    CGContextSetLineWidth(context, 2);
    
    CGFloat angle = M_PI * 2 * ( -_height - 50 ) / 50;
    if (_height < -50) {
        CGContextAddArc(context, 100, 75, 25, -M_PI_2, angle-M_PI_2, 0);
        CGContextStrokePath(context);
    }

    NSMutableDictionary *attrDict = [NSMutableDictionary new];
    attrDict[NSForegroundColorAttributeName] = [UIColor blueColor];
    attrDict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    if (_height <= -100) {
        _text = @"释放更新...";
        
    }else   _text = @"下拉更新...";
    [_text drawInRect:CGRectMake(140, 60, 150, 50) withAttributes:attrDict];

}


@end
