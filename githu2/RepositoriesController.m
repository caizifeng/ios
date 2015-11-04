//
//  RepositoriesController.m
//  githu2
//
//  Created by ibokan on 15/11/2.
//  Copyright © 2015年 ibokan. All rights reserved.
//

#import "RepositoriesController.h"
#import "JsonData.h"
#import "GetData.h"
#import "MyTableViewCell.h"
#import "FlashView.h"
#import "TableViewController1.h"
#import "ViewController1.h"

@interface RepositoriesController ()<getDataDelegate>
@property (nonatomic , strong) JsonData *analyzData;
@property (nonatomic , copy) NSString *path;
@property (nonatomic , copy) GetData *getData;
@property (nonatomic , copy) NSArray *dataArray;
@property (nonatomic , strong) FlashView *flashView;

@end

@implementation RepositoriesController

-(NSString *)path{
    if (!_path) {
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *plistPath = [doc stringByAppendingPathComponent:@"data.json"];
        _path = plistPath;
    }
    return _path;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //读取数据并解析
    _analyzData = [JsonData jsonDataWithData:[NSKeyedUnarchiver unarchiveObjectWithFile:self.path]];
    //解析仓库数据
    NSLog(@"***%@",_analyzData.repos_url);
    
    _getData = [[GetData alloc]init];
    _getData.delegate = self;
    //网络请求数据
    [_getData dataWithString:_analyzData.repos_url];
    _flashView = [[FlashView alloc]initWithDelegate:self.tableView];
//    _flashView.table = self.tableView;
    self.tableView.tableHeaderView = _flashView;
    
}
//请求完成的数据
-(void)succeedCallBack:(NSData *)Data{
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:Data options:0 error:nil];
    NSLog(@"解析完的地址:%ld",jsonArray.count);
    _dataArray = jsonArray;
    [self.tableView reloadData];
    
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MyTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"firstCell"];
    }
    [cell initWithDict:_dataArray[indexPath.row]];
    
    
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
//    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentInset));
    [_flashView setNeedsDisplay];
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (_flashView.height <= -100) {
        //下拉网络请求数据
        [_getData dataWithString:_analyzData.repos_url];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //跳转前
    ViewController1 *table1 = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    table1.dict = _dataArray[indexPath.row];
}


//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
