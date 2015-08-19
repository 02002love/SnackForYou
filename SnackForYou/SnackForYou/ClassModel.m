//
//  ClassModel.m
//  SnackForYou
//
//  Created by JinWei on 15/8/19.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import "ClassModel.h"

@implementation ClassModel


-(NSMutableArray *)categories{

    if (!_categories) {
        _categories = [NSMutableArray array];
    }

    return _categories;

}

-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        self.classID = dict[@"id"];
        self.name = dict[@"thumb_img"][@"img_url"];
        self.categories = dict[@"categories"];
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}


+(instancetype)classWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

@end
