//
//  ClassController.m
//  SnackForYou
//
//  Created by JinWei on 15/8/19.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import "ClassController.h"
#import "ClassModel.h"

@interface ClassController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UITableView *LeftTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *RightCollectionView;
@property (nonatomic,strong)AFHTTPRequestOperationManager * manager;
@property (nonatomic,strong)NSMutableArray * dataArray;
@property (nonatomic,assign)NSInteger index;
@property (nonatomic,strong)NSMutableArray * collectionDataArray;
@end



static NSString * ID1 =@"cellId1";
static NSString * ID2 = @"collID";


@implementation ClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.LeftTableView.separatorStyle = 0;
    [self.RightCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID2];
    self.LeftTableView.backgroundColor = [UIColor colorWithRed:236/256.0 green:236/256.0 blue:236/256.0 alpha:1];;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSMutableArray *)dataArray{
    
    if (!_dataArray ) {
        _dataArray = [NSMutableArray array];
        self.manager =  [AFHTTPRequestOperationManager manager];
        [self.manager POST:@"http://api.lingshi.cccwei.com:8888/?cid=109&uid=0&tms=20150807100838&sig=8abf727b40b65a29&wssig=a38e79a45dfa2cf3&os_type=3&version=6&srv=1203" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary  * dict= responseObject;
            NSArray * array = dict[@"data"][@"items"];
            for (NSDictionary * dict1 in array) {
                ClassModel * model = [ClassModel classWithDict:dict1];
                
                [_dataArray  addObject:model];
            }
            
            [self.LeftTableView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            SKLog(@"解析失败");
        }];
        
    }
    //    SKLog(@"%lu---------",(unsigned long)_dataArray.count);
    return _dataArray;
}

-(NSMutableArray *)collectionDataArray{
    
    if (!_collectionDataArray) {
        _collectionDataArray = [NSMutableArray array];
        
    }
    
    return  _collectionDataArray;
}

#pragma mark  tabelView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return   self.dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID1];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID1];
    }
    if (indexPath.row ==0 ) {
        cell.backgroundColor = [UIColor whiteColor];
    }
    ClassModel * model = self.dataArray[indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:236/256.0 green:236/256.0 blue:236/256.0 alpha:1];
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor] ;
    cell.textLabel.text = model.name;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId1" forIndexPath:indexPath];
    self.index = indexPath.row;
    //    SKLog(@"%ld",self.index);
    ClassModel * model = self.dataArray[self.index];
    
    self.collectionDataArray = model.categories;
    SKLog(@"%ld",self.collectionDataArray.count);
    [self.RightCollectionView reloadData];
    
    
}

#pragma mark   collection的代理


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID2 forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    //    ClassModel * model = self.dataArray[self.index];
    //    SKLog(@"%ld",model.categories.count);
    return _collectionDataArray.count;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat insets = ([UIScreen mainScreen].bounds.size.width - 100 - 120 * 2) / 3;
    return UIEdgeInsetsMake(10, insets, 10, insets);
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(120, 110);
    
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
