//
//  DisplayDreamInfoTableViewController.m
//  Dreams
//
//  Created by HYRLoveQi on 16/8/31.
//  Copyright © 2016年 黄永锐. All rights reserved.
//

#import "DisplayDreamInfoTableViewController.h"
#import "HttpTools.h"
#import "DreamInfo.h"
#import "DisplayDreamCell.h"
#import "DreamDetailTableViewController.h"

@interface DisplayDreamInfoTableViewController ()
@property(nonatomic, strong)NSMutableArray *datasourceArr;
@property(nonatomic, strong)UIButton *top_button;//悬浮按钮
@end

@implementation DisplayDreamInfoTableViewController

//
-(UIButton *)top_button{
    if (_top_button == nil) {
        _top_button = [[UIButton alloc] initWithFrame:CGRectMake(260, 400, 60, 60)];
        _top_button.layer.borderColor = [UIColor cyanColor].CGColor;
        _top_button.layer.borderWidth = 1.0;
        _top_button.layer.cornerRadius = 30;
        _top_button.backgroundColor = [UIColor purpleColor];
        _top_button.alpha = 0.5;
        [_top_button setTitle:@"Back" forState:UIControlStateNormal];
        [_top_button addTarget:self action:@selector(topBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _top_button;
}

//悬浮按钮的事件方法
-(void)topBtnAction{
    NSLog(@"返回");
    [self dismissViewControllerAnimated:YES completion:nil];
}



//请求数据
-(void)initData{
    [HttpTools requestDreamDetailInfoWithSomething:_searchText andSuccess:^(id obj) {
        //
        _datasourceArr = obj;
        [self.tableView reloadData];
        
    } andFail:^(id obj) {
        //
    }];

}

static NSString *const reuseIdentifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.top_button];
    //把self.top_button 置顶
    //[self.view bringSubviewToFront:self.top_button];
    
    
    //tableView的可视范围占据整个父控件(或者屏幕)－－设置contentsize滚动范围
    
    
    //所有的cell都可以被看到,也就是说tableView中的cell不会被导航栏,titleView以及TabBar所遮挡－－设置contentInset内边距
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    //register tableView Cell
    [self.tableView registerNib:[UINib nibWithNibName:@"DisplayDreamCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier];
    
    
    //
    [self initData];
    
    //设置tableview的背景图   还要让cell的背景透明  才可以显示图片

    UIImageView *tableBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.jpg"]];
    [self.tableView setBackgroundView:tableBg];
    
}


#pragma mark - 实现了按钮 可以悬浮在列表上面
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _top_button.frame = CGRectMake(260, self.tableView.contentOffset.y+400, 60, 60);
    [self.view bringSubviewToFront:_top_button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _datasourceArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DisplayDreamCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    //让cell的背景透明
    cell.backgroundColor = [UIColor clearColor];
    //
    DreamInfo *dreamInfo = _datasourceArr[indexPath.row];
    cell.DreamTitleLabel.text = dreamInfo.dreamTitle;
    cell.DreamDesTextView.text = dreamInfo.dreamDescripe;
    cell.DreamDesTextView.textColor = [UIColor colorWithRed:0.3 green:0.6 blue:0.8 alpha:1];
    //
    cell.DreamTitleLabel.backgroundColor = [UIColor clearColor];
    cell.DreamDesTextView.backgroundColor = [UIColor clearColor];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0f;
}

#pragma mark - TableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DreamDetailTableViewController *detailTVC = [[DreamDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
    detailTVC.dreamID = [_datasourceArr[indexPath.row] dreamID];
    //模式
    detailTVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self presentViewController:detailTVC animated:YES completion:nil];
    
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
