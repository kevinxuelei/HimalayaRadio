//
//  SpecialDetailController.m
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "SpecialDetailController.h"
#import "NetWorkHandle.h"
#import "SpecialTracksModel.h"
#import "SpecialDetailCell.h"
#import "NSString+Extension.h"
#import "MJRefresh.h"

@interface SpecialDetailController ()

@property (nonatomic, strong) SpecialTracksModel *model;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) NSInteger currentPageId;

@end

@implementation SpecialDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self loadNewData];
    [self setupRefresh];

}

- (void)initView {
    self.dataArray = [NSMutableArray array];
    
    self.navigationItem.title = @"专辑详情";
    [self.tableView registerClass:[SpecialDetailCell class]forCellReuseIdentifier:@"SpecialDetailCell"];
    self.navigationItem.hidesBackButton = YES;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 20, 20);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"iconfont-zuojiantou"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_nav"] forBarMetrics:UIBarMetricsDefault];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,100)];
    self.tableView.tableHeaderView = view;

}

- (void)back {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController popViewControllerAnimated:YES];

}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SpecialDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialDetailCell" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.dataArray[indexPath.row] title] sizeWithFont:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(self.view.frame.size.width - 80, MAXFLOAT)].height + 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.borderColor = [UIColor grayColor].CGColor;
    view.layer.borderWidth = 0.3;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 20)];
    label.font = [UIFont systemFontOfSize:14];
    label.text = [NSString stringWithFormat:@"共%ld集",self.model.totalCount];
    
    [view addSubview:label];
    return view;
}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    
//        if (scrollView.contentOffset.y + self.tableView.frame.size.height - 49 > scrollView.contentSize.height + 50 ) {
//            self.tableView.tableFooterView.hidden = NO;
//            UILabel *label = (UILabel *)self.tableView.tableFooterView;
//            if (self.currentPageId < self.model.maxPageId) {
//                label.text = @"正在加载中...";
//                self.currentPageId ++;
//                [self loadData];
//            }else {
//                label.text = @"没有更多数据";
//            }
//        
//        }
//}

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
//     1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
    __weak __typeof(self) weakSelf = self;
    
//    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
//    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        
//        [weakSelf loadNewData];
//    }];
    
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];


    }];
}

#pragma mark 下拉刷新数据
- (void)loadNewData
{
    self.currentPageId = 1;
    __weak typeof(self) mSelf = self;
    [NetWorkHandle getDataWithURLString:[NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/364178/true/%ld/20",_currentPageId] compare:^(id object) {
        mSelf.model = [SpecialTracksModel specialTracksModelWithDict:object[@"tracks"]];
        mSelf.dataArray = self.model.list;
        [mSelf.tableView reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
//        [self.tableView.header endRefreshing];
//        [self.tableView.footer resetNoMoreData];
    }];
    

}

#pragma mark 上拉加载更多数据
- (void)loadMoreData
{
    self.currentPageId ++;
    __weak typeof(self) mSelf = self;
    [NetWorkHandle getDataWithURLString:[NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/364178/true/%ld/20",_currentPageId] compare:^(id object) {
        mSelf.model = [SpecialTracksModel specialTracksModelWithDict:object[@"tracks"]];
        [mSelf.dataArray addObjectsFromArray:self.model.list];
        [mSelf.tableView reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        if (self.currentPageId < self.model.maxPageId) {
            [self.tableView.footer endRefreshing];
        }else {
            [self.tableView.footer endRefreshingWithNoMoreData];
        }
        
    }];
}
@end
