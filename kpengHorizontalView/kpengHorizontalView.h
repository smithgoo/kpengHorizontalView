//
//  kpengHorizontalView.h
//  SegmentDemo
//
//  Created by 王朋 on 2018/3/4.
//  Copyright © 2018年 王朋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface kpengHorizontalView : UIScrollView <UIScrollViewDelegate>


-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSArray*)titleArr;


@property (nonatomic,strong) NSArray *localListArr;

@property (nonatomic,strong) NSMutableArray <UIButton*>*localBtnListArr;


@property (nonatomic,copy) void(^itemClickCallBack)(NSInteger itemIndex,NSString*title);

@property (nonatomic,assign) NSInteger localIndex;

@end
