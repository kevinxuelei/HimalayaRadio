//
//  FoundViewController.m
//  Himalaya
//
//  Created by lanou3g on 15/10/26.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "FoundViewController.h"
#import "ToolBar.h"
#import "NetWorkHandle.h"
#import "FoundCollectionViewCell.h"
#import "RecommendModel.h"
#import "CategoryModel.h"
#import "Enums.h"
#import "CategoryListModel.h"
#import "LiveModel.h"
#import "BoZhuModel.h"
#import "MBProgressHUD+NJ.h"
#import "RankingModel.h"


@interface FoundViewController ()<UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;


@property (weak, nonatomic) IBOutlet UIView *Toobar;

@property (nonatomic, strong) NSArray *categoryArray;

@property (nonatomic, strong) NSMutableDictionary *dataDict;

@property (nonatomic, strong) NSMutableArray *focusImagesArr;

@property (nonatomic, strong) NSMutableArray *rankingArr;

@property (nonatomic, assign) NSNumber *maxPageId;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation FoundViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self loadViewAndSettings];
    
}

- (void)loadViewAndSettings {
    ToolBar *tooBar = [[ToolBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    tooBar.block = ^(NSInteger index) {
        self.CollectionView.contentOffset = CGPointMake(self.view.frame.size.width * index, 0);
    };
    
    [NetWorkHandle getDataWithURLString:@"http://mobile.ximalaya.com/mobile/discovery/v1/tabs?device=iphone" compare:^(id object) {
        _categoryArray = object[@"tabs"][@"list"];
        
        for (NSDictionary *dict in _categoryArray) {
            [tooBar addItemWithName:dict[@"title"]];
        }
        [self.CollectionView reloadData];
        
        [self.Toobar addSubview:tooBar];
    }];
    self.navigationController.navigationBar.translucent = NO;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = self.view.frame.size;
    layout.minimumLineSpacing = 0;

    self.CollectionView.collectionViewLayout = layout;
    self.CollectionView.bounces = NO;
    self.CollectionView.pagingEnabled = YES;
    self.CollectionView.showsHorizontalScrollIndicator = NO;
}

- (void)loadData {

    [MBProgressHUD showMessage:@"正在加载数据" toView:self.view];
    __weak typeof(self) mSelf = self;
    self.dataDict = [NSMutableDictionary dictionary];


        [NetWorkHandle getDataWithURLString:@"http://mobile.ximalaya.com/mobile/discovery/v1/recommends?channel=and-a1&device=iphone&includeActivity=true&includeSpecial=true&scale=2&version=4.3.20.2" compare:^(id object) {
            
            RecommendModel *model = [RecommendModel recommendModelWithDict:object];
            
            mSelf.focusImagesArr = model.focusImagesArr;
            [mSelf.dataDict setObject:model.dataArr forKey:@"RecommendModel"];
            [mSelf.CollectionView reloadData];
        }];

    [NetWorkHandle getDataWithURLString:@"http://mobile.ximalaya.com/mobile/discovery/v1/categories?device=iphone&picVersion=10&scale=2                                     " compare:^(id object) {
        
        NSArray *array = object[@"list"];
        NSMutableArray *arr = [NSMutableArray array];
        CategoryListModel *listModel = nil;
        for (int i = 0; i < array.count; i++) {
            NSDictionary *dict = array[i];
            
            if (i%6 == 0) {
                listModel = [[CategoryListModel alloc] init];
                listModel.species = CellTypeCategoryModelCell;
                [arr addObject:listModel];
            }
            
            CategoryModel *model = [CategoryModel categoryModelWithDict:dict];
            
            [listModel.dataArr addObject:model];
        }
        
        [mSelf.dataDict setObject:arr forKey:@"CategoryModel"];
        [mSelf.CollectionView reloadData];
    }];

    [NetWorkHandle getDataWithURLString:@"http://live.ximalaya.com/live-web/v1/getHomePageRadiosList?device=iphone" compare:^(id object) {
        NSDictionary *dict = [object valueForKey:@"result"];
        LiveModel *model = [LiveModel liveModelWithDict:dict];
        [mSelf.dataDict setObject:model.dataArr forKey:@"LiveModel"];
        [mSelf.CollectionView reloadData];
    }];


        [NetWorkHandle getDataWithURLString:@"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group?channel=and-c57&device=iphone&includeActivity=true&includeSpecial=true&scale=2&version=4.3.20.2" compare:^(id object) {
        
            RankingModel *model = [RankingModel rankingModelWithDict:object];
            mSelf.rankingArr = model.focusImagesArr;
            [mSelf.dataDict setObject:model.datas forKey:@"RankingModel"];
            [mSelf.CollectionView reloadData];
    }];


    [NetWorkHandle getDataWithURLString:@"http://mobile.ximalaya.com/m/explore_user_index?device=iphone&page=1" compare:^(id object) {
        
        mSelf.maxPageId = object[@"maxPageId"];
        NSArray *array = object[@"list"];
        NSMutableArray *dataArr = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            BoZhuModel *model = [BoZhuModel boZhuModelWithDict:dict];
            [dataArr addObject:model];
            model.species = CellTypeBoZhuModelCell;
        }
        [mSelf.dataDict setObject:dataArr forKey:@"BoZhuModel"];
    }];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _categoryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FoundCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coll" forIndexPath:indexPath];

//    cell.dataArr = self.dataArr[indexPath.item];
    
        switch (indexPath.item) {
            case 0:{
                cell.focusImagesArr = self.focusImagesArr;
                cell.dataArr = [self.dataDict valueForKey:@"RecommendModel"];
                [MBProgressHUD hideHUDForView:self.view];
            }
                break;
            case 1: {
                cell.focusImagesArr = nil;
                cell.dataArr = [self.dataDict valueForKey:@"CategoryModel"];
            }
                break;
            case 2:
                cell.focusImagesArr = nil;
                cell.dataArr = [self.dataDict valueForKey:@"LiveModel"];
                break;
            case 3:
//                [self performSelector:@selector(message) withObject:self afterDelay:0.1];
               
                cell.focusImagesArr = self.rankingArr;
                cell.dataArr = [self.dataDict valueForKey:@"RankingModel"];
                return cell;
                break;
            case 4:
                self.maxPageId = self.maxPageId;
                cell.dataArr = self.dataDict[@"BoZhuModel"];
                cell.focusImagesArr = nil;
                break;
            default:
                break;
        }


//     [self.view insertSubview:self.messageLabel belowSubview:self.CollectionView];

    
    return cell;
}

- (void)message {
    [self.view insertSubview:self.CollectionView belowSubview:self.messageLabel];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.Toobar.subviews[0] headerViewDidScroll:scrollView.contentOffset.x];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
