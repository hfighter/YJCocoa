//
//  YJSecondViewController.m
//  YJUITableViewFactory
//
//  Created by 阳君 on 16/3/26.
//  Copyright © 2016年 YJCocoa. All rights reserved.
//

#import "YJSecondViewController.h"
#import "YJTestTableViewCell.h"
#import "UIView+YJUIViewGeometry.h"
#import "YJUITableView.h"

@interface YJSecondViewController () <UITableViewDelegate, YJUITableViewManagerDelegate>

@property (nonatomic, strong) YJUITableView *tableView;

@end

@implementation YJSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[YJUITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.widthFrame, self.view.heightFrame) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, CGFLOAT_MIN)];
    self.tableView.manager.delegateManager.cacheHeightStrategy = YJUITableViewCacheHeightIndexPath;
    self.tableView.manager.delegate = self;
    [self.tableView.manager addTableViewAOPDelegate:self];
    // 测试数据
    for (int i=0; i<3; i++) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
        for (int j=0; j<30; j++) {
            // 封装模型
            YJTestTableCellModel *cellModel = [[YJTestTableCellModel alloc] init];
            cellModel.userName = [NSString stringWithFormat:@"阳君-%d", j];
            YJUITableCellObject *co = [YJTestTableViewCell cellObjectWithCellModel:cellModel];
            // 填充数据源
            [array addObject:co];
        }
        [self.tableView.dataSourceGrouped addObject:array];
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)tableViewManager:(YJUITableViewManager *)manager didSelectCellWithCellObject:(YJUITableCellObject *)cellObject {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
