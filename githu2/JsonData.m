//
//  JsonData.m
//  githu2
//
//  Created by ibokan on 15/11/2.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import "JsonData.h"

@implementation JsonData

-(instancetype)initWithData:(NSData *)dat{
    if (self = [super init]) {
        //2.把整个JSON数据转换成字典与数组的结构
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:dat options:0 error:nil];
        
        self.avatar_url = jsonDict[@"avatar_url"];//
        self.created_at = jsonDict[@"created_at"];
        self.email =      jsonDict[@"email"];
        self.login = jsonDict[@"login"];
        self.repos_url = jsonDict[@"repos_url"];
        
    }
    return self;
}
+(instancetype)jsonDataWithData:(NSData *)dat{
    return [[self alloc]initWithData:dat];
}

@end
