//
//  SubjectModel.h
//  SnackForYou
//
//  Created by JinWei on 15/8/17.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubjectModel : NSObject
@property (nonatomic,strong)NSNumber * subID;//头视图 和 体视图 共有
@property (nonatomic,copy)NSString * desc;//体视图
@property (nonatomic,strong)NSNumber * hotindex;//体视图
@property (nonatomic,strong)NSNumber * shareindex;//体视图
@property (nonatomic,copy)NSString * img_url; //头视图 和 体视图 共有

//@property (nonatomic,strong)NSString * info;//头视图



+(instancetype)subjectWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
