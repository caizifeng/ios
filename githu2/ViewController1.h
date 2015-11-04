//
//  ViewController1ViewController.h
//  githu2
//
//  Created by ibokan on 15/11/3.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollViewView.h"

@interface ViewController1 : UIViewController
@property (nonatomic , strong) NSDictionary *dict;
@property (weak, nonatomic) IBOutlet ScrollViewView *scrollView_View;

@property (weak, nonatomic) IBOutlet UILabel *watchLabel;

@property (weak, nonatomic) IBOutlet UILabel *starLabel;

@property (weak, nonatomic) IBOutlet UILabel *forkLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *updateLabel;



@end
