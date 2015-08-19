//
//  SubjectController.m
//  SnackForYou
//
//  Created by JinWei on 15/8/17.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import "SubjectController.h"
//#import "SubjectModel.h"
#import "SubjectCell.h"
#import "SubjectCollectionCell.h"


@interface SubjectController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSMutableArray * dataArray;
@property (nonatomic,strong)NSMutableArray * collectionDataArray;
@property (nonatomic,strong)AFHTTPRequestOperationManager * manager;
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionForScrollView;

@property (nonatomic,strong)NSTimer * timer;

@end

@implementation SubjectController

-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
        // 体视图
        self.manager = [AFHTTPRequestOperationManager manager];
        [self.manager POST:@"http://api.lingshi.cccwei.com:8888/?cid=109&uid=0&tms=20150807090740&sig=2db822a22f494fb7&wssig=45698887272e6ca3&os_type=3&version=6&srv=1312&pg_cur=1&pg_size=20" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary  * dict= responseObject;
            NSArray * array = dict[@"data"][@"items"];
            for (NSDictionary * dict1 in array) {
                SubjectModel * model = [SubjectModel subjectWithDict:dict1];
                
                [self.dataArray addObject:model];
            }
            [self.tableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            SKLog(@"解析失败");
        }];
        
    }
    
    return _dataArray;
}

- (NSMutableArray *)collectionDataArray
{

    if (!_collectionDataArray) {
        self.collectionDataArray = [NSMutableArray array];
        //头视图
        [self.manager POST:@"http://api.lingshi.cccwei.com:8888/?cid=109&uid=0&tms=20150807102433&sig=8df03729d3090cf8&wssig=e48b94634ff10c61&os_type=3&version=6&srv=1311&channel_name=QQyingyongbao" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary  * dict= responseObject;
            NSArray * array = dict[@"data"][@"items"];
            for (NSDictionary * dict1 in array) {
                SubjectModel * model = [SubjectModel subjectWithDict:dict1];
                
                [_collectionDataArray addObject:model];
            }
            [self.CollectionForScrollView reloadData];
            [self changeItem];

        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            SKLog(@"解析失败");
        }];
        
    }
    
    
    return _collectionDataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = 0;
    [self addTimer];
 
}

-(void)addTimer{
    
  NSTimer * time =   [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(changePostion) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:time forMode:NSRunLoopCommonModes];
    self.timer = time;
}

//-(void)changePostion{
//    
//    SKLog(@"110;");
//    
//    
//}


- (NSIndexPath *)resetIndexPath
{
    // 当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.CollectionForScrollView indexPathsForVisibleItems] lastObject];
    // 马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:0];
    [self.CollectionForScrollView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    return currentIndexPathReset;
}

/**
 *  下一页
 */
- (void)changePostion
{
    // 1.马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [self resetIndexPath];
    
    // 2.计算出下一个需要展示的位置
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem == self.collectionDataArray.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    // 3.通过动画滚动到下一个位置
    [self.CollectionForScrollView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}


-(void)changeItem{
    [self.CollectionForScrollView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:150 inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
 
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * ID = @"subcell";
    SubjectCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    // Configure the cell...
    SubjectModel * model = self.dataArray[indexPath.row];
    [cell cellFillWithModel:model];
    
    return cell;
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}

#pragma mark   ==colletion 的代理方法==

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SubjectCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"coll" forIndexPath:indexPath];
    SKLog(@"%ld============",(long)indexPath.row);
    SubjectModel * model = self.collectionDataArray[indexPath.item %self.collectionDataArray.count];
   
    [cell.iconImage setImageWithURL:[NSURL URLWithString:model.img_url]];
    
    return cell;
    
}


-(NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    
    
    return  1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.collectionDataArray.count*1000;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SubjectCollectionCell * cepll = ( SubjectCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    NSLog(@"%f",cepll.frame.size.width);
    
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    

    return collectionView.frame.size;
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
    
}

@end
