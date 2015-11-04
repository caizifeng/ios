//
//  ScrollViewView.m
//  githu2
//
//  Created by ibokan on 15/11/3.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import "ScrollViewView.h"

@implementation ScrollViewView

/*
 @property (nonatomic , copy) NSString *watch;
 @property (nonatomic , copy) NSString *star;
 @property (nonatomic , copy) NSString *fork;
 @property (nonatomic , copy) NSString *updated;
 */

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initWithDict:self.dict];
    }
    return self;
}

-(void)initWithDict:(NSDictionary *)dict{
    
    self.watch = [NSString stringWithFormat:@"%d",[dict[@"watchers_count"] intValue]];
    self.star = [NSString stringWithFormat:@"%d",[dict[@"stargazers_count"] intValue]];
    self.fork = [NSString stringWithFormat:@"%d",[dict[@"forks_count"] intValue]];
    self.updated = dict[@"updated_at"];
    
}



@end
