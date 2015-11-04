//
//  FlashView.h
//  githu2
//
//  Created by ibokan on 15/11/3.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlashView : UIView

@property (nonatomic , strong) UITableView *table;
-(instancetype)initWithDelegate:(UITableView *)table;
@property (nonatomic ) CGFloat height;
@end
