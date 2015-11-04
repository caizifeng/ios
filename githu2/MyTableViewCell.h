//
//  MyTableViewCell.h
//  githu2
//
//  Created by caizifeng on 15/11/2.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *body;
@property (weak, nonatomic) IBOutlet UILabel *star;
@property (weak, nonatomic) IBOutlet UILabel *other;

-(void)initWithDict:(NSDictionary *)dict;





@end
