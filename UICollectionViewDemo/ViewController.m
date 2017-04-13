//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by Leviduan on 2017/2/16.
//  Copyright © 2017年 Leviduan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择背景图片";
//    self.navigationController.navigationBar.
//    [self.view setBackgroundColor:[UIColor redColor]];
    //创建一个layout布局类
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    //设置布局方向为垂直流布局
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置布局方向为水平流布局
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    //设置每个item的大小为180*100
//    layout.itemSize = CGSizeMake(175, 100);
    layout.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
    
//左右间距
    layout.minimumInteritemSpacing = 5;
//上下间距
    layout.minimumLineSpacing = 5;
    
    
//    layout.sectionHeadersPinToVisibleBounds = YES;
//    layout.sectionFootersPinToVisibleBounds = YES;
//    layout.headerReferenceSize = CGSizeMake(170, 80);
    
//    UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    //创建collectionView 通过一个布局策略layout来创建
    UICollectionView * collect = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    //代理设置
    collect.delegate=self;
    collect.dataSource=self;
    //注册item类型 这里使用系统的类型
    
    [collect setBackgroundColor:[UIColor whiteColor]];
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    [collect registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Newcellid"];
    
    
    [self.view addSubview:collect];
    // Do any additional setup after loading the view, typically from a nib.
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row <= 1 ) {
        return CGSizeMake( (CGRectGetWidth(self.view.frame) - 15) / 2, 40);
    } else {
//        return CGSizeMake(175, 100);
        return CGSizeMake( (CGRectGetWidth(self.view.frame) - 15) / 2,100);
//        NSLog(@"%@", (CGRectGetWidth(self.view.frame) - 15) / 2);
    }

}

// 是否可以被选择

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths NS_AVAILABLE_IOS(10_0){
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    UICollectionViewCell * cell1  = [collectionView dequeueReusableCellWithReuseIdentifier:@"Newcellid" forIndexPath:indexPath];
    
    if (indexPath.row == 0 ) {
        cell1.backgroundColor = [UIColor orangeColor];
        return cell1;
    } else if(indexPath.row == 1 ) {
        cell1.backgroundColor = [UIColor blueColor];
        return cell1;
    }else{
        
//        UIButton *cellBt = [[UIButton alloc] initWithFrame:cell.bounds];
        
        UIImageView *cellImage = [[UIImageView alloc] initWithFrame:cell.bounds];
        cellImage.image = [UIImage imageNamed:@"tmp03687dc2"];
//        [cell setBackgroundImage:[UIImage imageNamed:@"tmp03687dc2"] forState:UIControlStateNormal];
        
//        cellBt.backgroundColor = [UIColor purpleColor];
//        [cell addSubview:cellBt];
        
        [cell.contentView addSubview:cellImage];
//        [self addSubview:imageView];
//        cell.backgroundColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:50];
        return cell;
    }
    
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//返回每个分区的item个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 50;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


@end
