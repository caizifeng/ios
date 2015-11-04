//
//  ScrollViewView.h
//  githu2
//
//  Created by ibokan on 15/11/3.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewView : UIView





@property (nonatomic , strong) NSDictionary *dict;
@property (nonatomic , copy) NSString *watch;
@property (nonatomic , copy) NSString *star;
@property (nonatomic , copy) NSString *fork;
@property (nonatomic , copy) NSString *description;

@property (nonatomic , copy) NSString *updated;


-(void)initWithDict:(NSDictionary *)dict;



@end
