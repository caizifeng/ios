//
//  getData.h
//  githu2
//
//  Created by ibokan on 15/11/2.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol getDataDelegate;

@interface GetData : NSObject

@property (nonatomic , weak) id<getDataDelegate> delegate;

-(void)dataWithString:(NSString *)stringURL;

@end

@protocol getDataDelegate
//下载完回调函数
-(void)succeedCallBack:(NSData *)Data;

@end