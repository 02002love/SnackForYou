//
//  SubjectModel.m
//  SnackForYou
//
//  Created by JinWei on 15/8/17.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import "SubjectModel.h"

@implementation SubjectModel

-(instancetype)initWithDict:(NSDictionary *)dict{

    if (self = [super init]) {
        self.subID = dict[@"id"];
        self.img_url = dict[@"thumb_img"][@"img_url"];
//        self.info = dict[@"action"][];
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}


+(instancetype)subjectWithDict:(NSDictionary *)dict{

    return [[self alloc]initWithDict:dict];

}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{


}
@end
