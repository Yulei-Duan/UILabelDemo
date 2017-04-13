//
//  TWO_ViewController.m
//  UICollectionViewDemo
//
//  Created by Leviduan on 2017/2/16.
//  Copyright © 2017年 Leviduan. All rights reserved.
//

#import "TWO_ViewController.h"

#define SCREEN_Width [[UIScreen mainScreen] bounds].size.width

@interface TWO_ViewController ()

@end

@implementation TWO_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UIView *headerView = [[UIView alloc] init];
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, SCREEN_Width - 40, 20)];
    image1.backgroundColor = [UIColor redColor];
    
    UILabel *ddlabel = [[UILabel alloc] init];
    [ddlabel setText:@"根据文字 高度进行适应根据文字高度 进行自适应根据文适应 根据文字高度进行自适应根据文自适应根据文字高度进行自适应根据文字高度进行自适应根据文字高度进行自适应根据文字高度进行自适应"];
    ddlabel.numberOfLines = 4;
    ddlabel.font = [UIFont systemFontOfSize:24];
    
    CGRect rect = [ddlabel.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: ddlabel.font} context:nil];
    
    ddlabel.frame = CGRectMake(20, CGRectGetMaxY(image1.frame),SCREEN_Width - 40,rect.size.height);
    
    [self setLineSpacing:20 label:ddlabel];
    
    //[ddlabel sizeToFit];
    
    
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(ddlabel.frame), SCREEN_Width - 40, 20)];
    image2.backgroundColor = [UIColor blueColor];
    
    headerView.frame = CGRectMake(0, 64, SCREEN_Width, CGRectGetMaxY(image2.frame)+20);
    NSLog(@"test height = %f", ddlabel.frame.size.height);
    headerView.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:image1];
    [headerView addSubview:ddlabel];
    [headerView addSubview:image2];
    [self.view addSubview:headerView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLineSpacing:(CGFloat)spacing label:(UILabel *)label
{
    if(!label.text.length) return;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    [label setAttributedText:attributedString];
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    [label sizeToFit];
    
    
    //[attributeString setAttributes:@{NSForegroundColorAttributeName:NF_Color_C19,NSFontAttributeName:[UIFont systemFontOfSize:Near_Final_Font_T9]} range:NSMakeRange(i, 1)];
}


@end









