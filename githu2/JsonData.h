//
//  JsonData.h
//  githu2
//
//  Created by ibokan on 15/11/2.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonData : NSObject

@property (nonatomic , copy)NSString *avatar_url; //图片
@property (nonatomic , copy)NSString *created_at;//创建时间
@property (nonatomic , copy)NSString *email;    //邮箱
//@property (nonatomic , copy)NSString *events_url;
//@property (nonatomic , copy)NSString *followers;
//@property (nonatomic , copy)NSString *followers_url;
//
//@property (nonatomic , copy)NSString *following;
//@property (nonatomic , copy)NSString *following_url;
@property (nonatomic , copy)NSString *login;//用户名
@property (nonatomic , copy)NSString *repos_url;//仓库




-(instancetype)initWithData:(NSData *)dat;
+(instancetype)jsonDataWithData:(NSData *)dat;



@end
