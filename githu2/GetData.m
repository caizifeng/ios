//
//  getData.m
//  githu2
//
//  Created by ibokan on 15/11/2.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import "GetData.h"

@interface GetData()<NSURLSessionDownloadDelegate>{
    NSURLSessionDownloadTask *_downloadTask;
}

@end

@implementation GetData

-(void)dataWithString:(NSString *)stringURL{
    //开始下载
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        //2.使用配置对象，创建会话对象
        //会话对象的作用是创建任务
        NSURLSession *downloadSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
        
        //创建URL对象和请求对象
        NSURL *dataUrl = [NSURL URLWithString:stringURL];
        NSURLRequest *imgRequest = [NSURLRequest requestWithURL:dataUrl];
        
        //由会话对象，根据请求对象，创建下载任务
        _downloadTask = [downloadSession downloadTaskWithRequest:imgRequest];
        
        //4.开始/恢复下载任务
        [_downloadTask resume];
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSData *Data = [NSData dataWithContentsOfURL:location];
//    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:Data options:0 error:nil];
    //回主线程调用回调函数
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.delegate succeedCallBack:Data];
        
    });
    
    
}


@end
