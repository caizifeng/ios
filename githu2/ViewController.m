//
//  ViewController.m
//  githu2
//
//  Created by ibokan on 15/11/2.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import "ViewController.h"
#import "JsonData.h"
static  NSString *CodeId = @"https://github.com/login/oauth/authorize?client_id=3ecaf21bf06f40c0f29e";
static  NSString *Token = @"https://github.com/login/oauth/access_token?client_id=3ecaf21bf06f40c0f29e&client_secret=d87b0efd56b1e271cd9cb89e7be0cc3145bb2a4f&";
static NSString *getJSON = @"https://api.github.com/user?";

@interface ViewController ()<UIWebViewDelegate,NSURLSessionDownloadDelegate,UITabBarDelegate>{
    NSURLSessionDownloadTask *_downloadTask;
}
@property (nonatomic , copy) UIWebView *webView;
@property (nonatomic , copy) NSString *tokenString;
@property (nonatomic , copy) NSString *path;
//@property (nonatomic , strong) JsonData *analyzData;
//授权标志
@property (nonatomic) BOOL empower;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView  = [[UIWebView alloc]initWithFrame:self.view.bounds];
    _webView.delegate = self;
    NSURL *url = [NSURL URLWithString:CodeId];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    [self.view addSubview:_webView];
    
    
    
    
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    // 1 : 用户同意授权之后,返回的URL包含授权的request_code
    NSString *reDirectUrlContainsCode = webView.request.URL.absoluteString;
    NSLog(@"%@",reDirectUrlContainsCode);
    NSRange codeRangeStart = [reDirectUrlContainsCode rangeOfString:@"code="];
    
    if (codeRangeStart.location != NSNotFound) {//能拿到授权
        _webView.hidden = YES;
        //拿到code
        NSString *string = [reDirectUrlContainsCode substringFromIndex:codeRangeStart.location];
        NSLog(@"拿到code: %@",string);
        //拼接URL
        NSString *josn = [Token stringByAppendingString:string];
        NSLog(@"拼接code%@",josn);
        
        //请求数据
        [self startDownload:josn];
        
        
    }else if (!_empower){//拿不到授权
        _webView.hidden = NO;
        NSURL *url = [NSURL URLWithString:reDirectUrlContainsCode];
        NSURLRequest *request =[NSURLRequest requestWithURL:url];
        //让用户授权
        [_webView loadRequest:request];
        //防止不断授权
        _empower = 1;

    }
}

//开始下载
- (void)startDownload:(NSString *)stringURL
{
    
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
    //到此，文件已经完整地下载了，它被保存在tmp文件夹内，其路径用参数location传入
    //location是一个表示本地路径的url
    NSLog(@"location: %@", location);
    
    //位于location的数据只能在这里读取，一旦本方法结束，这个文件将被自动删除
    
    //通过location加载这个数据
    NSData *Data = [NSData dataWithContentsOfURL:location];
    
    if (_tokenString == nil) {
        NSString *string = [[NSString alloc]initWithData:Data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
        
        NSString *josn = [getJSON stringByAppendingString:string];
        NSLog(@"*********%@",josn);
    
        _tokenString = josn;
        
        //继续请求数据
        [self startDownload:josn];
        
    } else {
        NSLog(@"path:%@",self.path);
    //保存数据
    [NSKeyedArchiver archiveRootObject:Data toFile:self.path];
        
    }
    
}

-(NSString *)path{
    if (!_path) {
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *plistPath = [doc stringByAppendingPathComponent:@"data.json"];
        _path = plistPath;
    }
    return _path;
}





@end
