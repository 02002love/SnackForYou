//
//  ClassModel.h
//  SnackForYou
//
//  Created by JinWei on 15/8/19.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassModel : NSObject

@property (nonatomic,strong)NSNumber  * classID;
@property (nonatomic,strong)NSString * name;
@property (nonatomic,strong)NSMutableArray * categories;


+(instancetype)classWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;
@end
