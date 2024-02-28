//
//  ViewController.m
//  dragon-ios-app
//
//  Created by fangyp on 2023/11/29.
//

#import "RootViewController.h"
#import "WebViewRootController.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Tools"];
    self.tableView.rowHeight = 44;
    self.dataArray = [[NSMutableArray alloc] init];
    [self.dataArray addObject:@"WebView"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // 设置表格的分区数
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count]; // 返回每个分区的行数
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // 配置cell的内容
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 处理选中某一行的操作
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WebViewRootController *webContoller = [[WebViewRootController alloc] initWithNibName:@"WebViewRootController" bundle:Nil];
    [self.navigationController pushViewController:webContoller animated:YES];
}
@end
