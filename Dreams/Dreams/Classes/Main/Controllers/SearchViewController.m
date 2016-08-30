//
//  SearchViewController.m
//  Dreams
//
//  Created by HYRLoveQi on 16/8/30.
//  Copyright © 2016年 黄永锐. All rights reserved.
//

#import "SearchViewController.h"
#import "HttpTools.h"


@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchTF;
- (IBAction)SearchDream:(UIButton *)sender;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)SearchDream:(UIButton *)sender {
    
    [HttpTools requestDreamDetailInfoWithSomething:self.searchTF.text andSuccess:^(id obj) {
        //
    } andFail:^(id obj) {
        //
    }];
    
}
@end
