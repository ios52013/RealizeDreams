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


@interface DisplayDreamInfoTableViewController ()
@property(nonatomic, strong)NSMutableArray *datasourceArr;
@end

@implementation DisplayDreamInfoTableViewController

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
