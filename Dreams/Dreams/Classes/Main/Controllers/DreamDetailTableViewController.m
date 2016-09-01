//
//  DreamDetailTableViewController.m
//  Dreams
//
//  Created by aiqiyisheng on 16/8/31.
//  Copyright © 2016年 黄永锐. All rights reserved.



#import "DreamDetailTableViewController.h"
#import "HttpTools.h"
#import "DreamInfo.h"


@interface DreamDetailTableViewController ()
@property(nonatomic,strong)DreamInfo *dream;
@end

@implementation DreamDetailTableViewController

// 根据ID查询解梦信息
-(void)initData{
    [HttpTools requestDreamDetailByDreamID:self.dreamID andSuccess:^(id obj) {
        //
        _dream = obj;
        //
        [self.tableView reloadData];
        
    } andFail:^(id obj) {
        //
    }];
    
}

//
static NSString *const reuseIdentifier = @"Cell";
//
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
    //
    //所有的cell都可以被看到,也就是说tableView中的cell不会被导航栏,titleView以及TabBar所遮挡－－设置contentInset内边距
    self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);
    
    //设置列表的背景图片
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"9.jpg"]];
    //图片显示的模式
    tableBg.contentMode = UIViewContentModeScaleAspectFill;
    [self.tableView setBackgroundView:tableBg];
    
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dream.lists.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //
    cell.textLabel.numberOfLines = 3;
    cell.textLabel.text = _dream.lists[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

//
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80.0f;
}


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
