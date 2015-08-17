//
//  SubjectCell.m
//  SnackForYou
//
//  Created by JinWei on 15/8/17.
//  Copyright (c) 2015年 SongJinWei. All rights reserved.
//

#import "SubjectCell.h"



@interface SubjectCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIButton *hotButton;

- (IBAction)subjectBtnClick:(id)sender;

@end

@implementation SubjectCell

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)cellFillWithModel:(SubjectModel *)model{

    [self.iconImageView setImageWithURL:[NSURL URLWithString:model.img_url]];
    self.descLabel.text = model.desc ;
    [self.hotButton setTitle:[model.hotindex stringValue]  forState:UIControlStateNormal];

}

- (IBAction)subjectBtnClick:(id)sender {
    
    SKLog(@"跳转到详情~~~");
}
@end
