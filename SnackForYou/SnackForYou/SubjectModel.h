//
//  SubjectModel.h
//  SnackForYou
//
//  Created by JinWei on 15/8/17.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubjectModel : NSObject
@property (nonatomic,strong)NSNumber * subID;
@property (nonatomic,copy)NSString * desc;
@property (nonatomic,strong)NSNumber * hotindex;
@property (nonatomic,strong)NSNumber * shareindex;
@property (nonatomic,copy)NSString * img_url;


+(instancetype)subjectWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
