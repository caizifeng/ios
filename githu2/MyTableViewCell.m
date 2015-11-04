//
//  MyTableViewCell.m
//  githu2
//
//  Created by caizifeng on 15/11/2.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

-(void)initWithDict:(NSDictionary *)dict{
    self.name.text = dict[@"name"];
    self.star.text = [NSString stringWithFormat:@"%d",((NSNumber *)dict[@"stargazers_count"]).intValue];
    self.other.text = [NSString stringWithFormat:@"%d",((NSNumber *)dict[@"forks_count"]).intValue];
    self.body.text = dict[@"description"];
    self.icon.image = [UIImage imageNamed:@"icon"];
//    NSLog(@"%@",self.name.text);
    
}


@end
