//
//  FoundCollectionViewCell.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "FoundCollectionViewCell.h"
#import "Advertisement.h"
#import "NetWorkHandle.h"
#import "RecommendTableView.h"
#import "ListModel.h"
#import "DiscoveryColumnsModel.h"
#import "EntrancesModel.h"
#import "SpecialColumnModel.h"
#import <UIImageView+WebCache.h>
#import "CollectionTableViewCell.h"
#import "DiscoverHeaderView.h"
#import "SpecialColumnCell.h"
#import "DiscoveryColumnsListModel.h"
#import "DiscoveryColumnsCell.h"
#import "CategoryModel.h"
#import "Enums.h"
#import "CategoryTableViewCell.h"
#import "SpecialDetailController.h"


@interface FoundCollectionViewCell ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) NSInteger currentPageId;

@end

@implementation FoundCollectionViewCell

- (void)awakeFromNib {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 130)];
    label.text = @"正在加载中...";
    label.textAlignment = NSTextAlignmentCenter;
    self.tableView.tableFooterView = label;
    self.tableView.tableFooterView.hidden = YES;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.currentPageId = 1;
    self.dataArr = [NSMutableArray array];
    [self.tableView registerClass:[CollectionTableViewCell class] forCellReuseIdentifier:@"collTableView"];
    [self.tableView registerClass:[DiscoveryColumnsCell class] forCellReuseIdentifier:@"DiscoveryColumns"];
    [self.tableView registerClass:[CategoryTableViewCell class] forCellReuseIdentifier:@"Category"];
    
    UINib *nib = [UINib nibWithNibName:@"SpecialColumnCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"SpecialColumnCell"];

}


- (void)setTitle:(NSString *)title {
    _title = title;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch ([self.dataArr[section] species]) {
        case CellTypeListModelCell:
            return 1;
            break;
        case CellTypeEntrancesModelCell :
            return 1;
            break;
        case CellTypeCategoryModelCell:
            return 1;
            break;
        case CellTypeRecommandRadioListCell:
            return 1;
            break;
        case CellTypeBoZhuModelCell:
            return 1;
            break;


        default:
            break;
    }

        return [self.dataArr[section] list].count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch ([self.dataArr[indexPath.section] species]) {
        case CellTypeDiscoveryColumnsModelCell: {
            DiscoveryColumnsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DiscoveryColumns" forIndexPath:indexPath];
            cell.model = [self.dataArr[indexPath.section] list][indexPath.row];
            return cell;
        }
            break;
        case CellTypeSpecialColumnModelCell: {
            SpecialColumnCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialColumnCell" forIndexPath:indexPath];
            cell.block = ^{
//                   [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
            };
            cell.model = [self.dataArr[indexPath.section] list][indexPath.row];
            
            return cell;
        }
            break;
        case CellTypeListModelCell: {
            CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collTableView" forIndexPath:indexPath];
            cell.model = self.dataArr[indexPath.section];
            return cell;
        }
            break;
        case CellTypeCategoryModelCell: {
            CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Category" forIndexPath:indexPath];
            cell.dataArr = [self.dataArr[indexPath.section] dataArr];
            return cell;

        }
            break;
        case CellTypeTopRadioListModelCell: {
            SpecialColumnCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialColumnCell" forIndexPath:indexPath];
            cell.block = ^{
//                 [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationAutomatic];
            };
            cell.topRadioModel = [self.dataArr[indexPath.section] list][indexPath.row];
            
            return cell;
        }
            break;
        case CellTypeRecommandRadioListCell: {
            CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collTableView" forIndexPath:indexPath];
            cell.recommendModel = self.dataArr[indexPath.section];
            return cell;
        }
        case CellTypeBoZhuModelCell: {
            CollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collTableView" forIndexPath:indexPath];
            cell.boZhuModel = self.dataArr[indexPath.section];
            return cell;
        }
            
        default:
            break;
    }
    
    

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"table" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataArr[indexPath.section] title];
    if ([self.dataArr[indexPath.section] coverPath] == nil ) {
        cell.imageView.image = [UIImage imageNamed:@"iconfont-iconfontfenleihuaban"];
    }else {
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[self.dataArr[indexPath.section] coverPath]]];
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    switch ([self.dataArr[section] species]) {
        case CellTypeCategoryModelCell:
            return nil;
            break;
        case CellTypeEntrancesModelCell: {
            DiscoverHeaderView *view = [[DiscoverHeaderView alloc] init];
            view.title = [self.dataArr[section] title];
            view.hidden = YES;
            return view;
        }
        case CellTypeRecommandRadioListCell: {
            DiscoverHeaderView *view = [[DiscoverHeaderView alloc] init];
            view.title = [self.dataArr[section] title];
            [view setRightBtnIsHidden:YES];
            return view;
        }

        default:
            break;
    }
    DiscoverHeaderView *view = [[DiscoverHeaderView alloc] init];
    view.title = [self.dataArr[section] title];
    return view;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    switch ([self.dataArr[section] species]) {
        case CellTypeCategoryModelCell:
            return 0;
            break;
        case CellTypeEntrancesModelCell:
            return 0;
            break;
        default:
            break;
    }

    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    switch ([self.dataArr[section] species]) {
        case CellTypeCategoryModelCell:
            return 5;
            break;
            
        default:
            break;
    }
    
    return 10;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch ([self.dataArr[indexPath.section] species]) {
        case CellTypeListModelCell:
            return 180;
            break;
        case CellTypeRecommandRadioListCell:
            return 180;
            break;
        case CellTypeBoZhuModelCell:
            return 180;
            break;
        case CellTypeCategoryModelCell:
            return 120;
            break;
        case CellTypeEntrancesModelCell:
            return 40;
            break;
        default:
            break;
    }

    return 60;
}

- (void)setFocusImagesArr:(NSMutableArray *)focusImagesArr {
    _focusImagesArr = focusImagesArr;
    if (!focusImagesArr) {
        [self setTableViewHeaderView];
        return;
    }
    Advertisement *av = [[Advertisement alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, kScrollViewH)];
    av.array = focusImagesArr;
    self.tableView.tableHeaderView = av;
    self.tableView.frame = CGRectMake(0, 50, self.frame.size.width, self.frame.size.height);
    [self.tableView reloadData];

    
}

- (void)setDataArr:(NSMutableArray *)dataArr {
    _dataArr = dataArr;
    
    
    [self.tableView reloadData];
}

//取消TableViewHeaderView
- (void)setTableViewHeaderView {
    self.tableView.tableHeaderView = nil;
    self.tableView.frame = CGRectMake(0, 10, self.frame.size.width, self.frame.size.height);
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {

    if ([self.dataArr[0] species] == CellTypeBoZhuModelCell) {
        if (scrollView.contentOffset.y + self.tableView.frame.size.height - 49 > scrollView.contentSize.height + 50 ) {
            self.tableView.tableFooterView.hidden = NO;
            self.currentPageId ++;
            __weak typeof(self) mSelf = self;
            [NetWorkHandle getDataWithURLString:[NSString stringWithFormat:@"http://mobile.ximalaya.com/m/explore_user_index?device=iphone&page=%ld",self.currentPageId]  compare:^(id object) {
                
                NSArray *array = object[@"list"];
                NSMutableArray *dataArr = [NSMutableArray array];
                for (NSDictionary *dict in array) {
                    BoZhuModel *model = [BoZhuModel boZhuModelWithDict:dict];
                    [dataArr addObject:model];
                    model.species = CellTypeBoZhuModelCell;
                }
                [mSelf.dataArr addObjectsFromArray:dataArr];
                [mSelf.tableView reloadData];
                mSelf.tableView.tableFooterView.hidden = YES;
            }];

        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionView *coll = (UICollectionView *)self.superview;
        switch ([self.dataArr[indexPath.section] species]) {
            case CellTypeEntrancesModelCell:
                if ([self.dataArr[indexPath.section] coverPath] == nil ) {
                    
                    [UIView animateWithDuration:0.5 animations:^{
                        coll.contentOffset = CGPointMake(self.frame.size.width, 0);
                    }];
                }else {
                    [UIView animateWithDuration:0.5 animations:^{
                        coll.contentOffset = CGPointMake(self.frame.size.width * 2, 0);
                    }];
                }

                break;
                
            default:
                break;
        }
    

    UINavigationController *navi = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    SpecialDetailController *SD = [[SpecialDetailController alloc] init];
    [navi showViewController:SD sender:self];

   }

@end
