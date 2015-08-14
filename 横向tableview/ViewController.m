//
//  ViewController.m
//  横向tableview
//
//  Created by qianfeng01 on 15-8-14.
//  Copyright (c) 2015年 zg. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalTableView.h"
@interface ViewController ()<HorizontalTableViewDelegate>
{
    HorizontalTableView *_tableView;
}
@property (nonatomic ,strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTableView];
    [self loadData];
}

- (void)createTableView{
    _tableView = [[HorizontalTableView alloc]initWithFrame:self.view.frame];
    _tableView.delegate =self;
    [self.view addSubview:_tableView];
}

- (void)loadData{
    self.dataArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < 1000; i++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [_tableView refreshData];
}


#pragma mark --delegate
- (NSInteger)numberOfColumnsForTableView:(HorizontalTableView *)tableView{
    return self.dataArray.count;
}

- (UIView *)tableView:(HorizontalTableView *)tableView viewForIndex:(NSInteger)index{
    UIView *view = [tableView dequeueColumnView];
    if (view == nil) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        label.tag = 100;
        [view addSubview:label];
    }
    //每一页的颜色都不一样
    float r = arc4random()%256/255.0;
    float g = arc4random()%256/255.0;
    float b = arc4random()%256/255.0;
    view.backgroundColor = [UIColor colorWithRed:r  green:g blue:b  alpha:1];
    
    UILabel *label = (UILabel *)[view viewWithTag:100];
    label.text = self.dataArray[index];
    
    
    return view;
}

- (CGFloat)columnWidthForTableView:(HorizontalTableView *)tableView{
    return self.view.frame.size.width;
}


@end
