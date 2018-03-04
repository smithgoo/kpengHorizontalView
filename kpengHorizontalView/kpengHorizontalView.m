//
//  kpengHorizontalView.m
//  SegmentDemo
//
//  Created by 王朋 on 2018/3/4.
//  Copyright © 2018年 王朋. All rights reserved.
//

#import "kpengHorizontalView.h"
@interface kpengHorizontalView ()
@property (nonatomic,strong) UIView *line;
@property (nonatomic,strong) UIButton *btn;
@end
@implementation kpengHorizontalView

-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSArray*)titleArr {
    
    self =[super initWithFrame:frame];
    
    if (self) {
       
        self.showsVerticalScrollIndicator =NO;
        self.showsHorizontalScrollIndicator =NO;
        _localListArr =titleArr;
        _localBtnListArr =[NSMutableArray array];
        self.delegate =self;
         [self setupUIWithFrame:frame];
    }
    
    return self;
}

#pragma ---- mark 初始化UI 元素
- (void)setupUIWithFrame:(CGRect)frame{
    if (_localListArr.count<=6 ) {
        self.contentSize =CGSizeMake(frame.size.width, frame.size.height);
        
    } else   {
        
        CGFloat W = frame.size.width+frame.size.width/6*(_localListArr.count-6);
        self.contentSize =CGSizeMake(W, frame.size.height);
    }
  
    for (int index =0; index <_localListArr.count; index++) {
        _btn =[UIButton new];
        [_btn setTitle:[NSString stringWithFormat:@"%@",_localListArr[index]] forState:UIControlStateNormal];
        _btn.titleLabel.textAlignment =NSTextAlignmentCenter;
        _btn.titleLabel.font =[UIFont systemFontOfSize:14];
        _btn.frame =CGRectMake(frame.size.width/6*index, 0, frame.size.width/6, frame.size.height-1);
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_localBtnListArr addObject:_btn];
        [self addSubview:_btn];
        _btn.tag =index;
        [_btn addTarget:self action:@selector(btnHitAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    _line =[UIView new];
    [self addSubview:_line];
    _line.frame =CGRectMake(0, frame.size.height-1, frame.size.width/6, 1);
    _line.backgroundColor =[UIColor redColor];
}

#pragma ---- mark 点击事件的回调
- (void)btnHitAction:(UIButton*)sender {
    [_localBtnListArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        obj.titleLabel.font =[UIFont systemFontOfSize:14];
    }];
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    sender.titleLabel.font =[UIFont boldSystemFontOfSize:15];
    _line.frame =CGRectMake(self.frame.size.width/6*sender.tag, self.frame.size.height-1, self.frame.size.width/6, 1);

    if (_itemClickCallBack) {
        _itemClickCallBack(sender.tag,sender.titleLabel.text);
    }
    
}

#pragma  --mark 外部滑动的时候那个线显示的位置
-(void)setLocalIndex:(NSInteger)localIndex {
    [_localBtnListArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx ==localIndex) {
            [obj setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            obj.titleLabel.font =[UIFont boldSystemFontOfSize:15];
        }
    }];
   
    _line.frame =CGRectMake(self.frame.size.width/6*localIndex, self.frame.size.height-1, self.frame.size.width/6, 1);
}






@end
