//
//  ViewController.m
//  MitBarrageCircleView
//
//  Created by Meng,Chen on 2017/4/13.
//  Copyright © 2017年 mcmengchen. All rights reserved.
//

#import "ViewController.h"
#import "MitBarrageCircleView.h"
#import "MitBarrageItem.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __block NSArray * arr = @[@"aaa",@"啊啊啊啊",@"白八河出轨啦啦啦",@"乱起八早",@"xxxxxxxx",@"腾通讯",@"阿里巴巴",@"呵呵额",@"好歌曲",@"吾问无为谓无无",@"1111",@"线下啊啊啊",@"养花教程",@"测试测试测试"];
    NSMutableArray *data = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * tempArr = [NSMutableArray arrayWithCapacity:0];
    tempArr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i<arr.count; i++) {
        MitBarrageItem * mol = [MitBarrageItem new];
        mol.contentFont = 14;
        mol.contentHeight = 28;
        mol.content = arr[i];
        if (i % 3 == 0) {
            mol.isHighLighted = true;
        }
        mol.highlightedTxtColor = [UIColor brownColor];
        mol.highlightedBorderColor = [UIColor brownColor];
        mol.normalTxtColor = [UIColor blackColor];
        mol.normalBorderColor = [UIColor blackColor];
        [tempArr addObject:mol];
    }
    [data addObject:[tempArr copy]];
    
    tempArr = [NSMutableArray arrayWithCapacity:0];
    for (int j = (int)arr.count -1; j>0; j--) {
        MitBarrageItem * mol = [MitBarrageItem new];
        mol.contentFont = 14;
        mol.contentHeight = 28;
        mol.content = arr[j];
        if (j % 3 == 0) {
            mol.isHighLighted = true;
        }
        mol.highlightedTxtColor = [UIColor brownColor];
        mol.highlightedBorderColor = [UIColor brownColor];
        mol.normalTxtColor = [UIColor blackColor];
        mol.normalBorderColor = [UIColor blackColor];
        [tempArr addObject:mol];
    }
    [data addObject:[tempArr copy]];
    
    
    MitBarrageCircleView * vi = [MitBarrageCircleView viewWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300) alignType:MitAlignTypeDefault];
    vi.dataSource = [data copy];
    vi.clickBack = ^(MitBarrageItem *item, NSInteger currentIndex) {
        NSLog(@"%@",item);
    };
    [self.view addSubview:vi];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
