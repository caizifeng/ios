//
//  ViewController1ViewController.m
//  githu2
//
//  Created by ibokan on 15/11/3.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",_dict);
    [_scrollView_View initWithDict:_dict];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)flashData{
    self.watchLabel.text = _scrollView_View.watch;
    self.starLabel.text =  _scrollView_View.star;
    self.forkLabel.text = _scrollView_View.fork;
    self.updateLabel.text = _scrollView_View.updated;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
