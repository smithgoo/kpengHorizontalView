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

@end
@implementation kpengHorizontalView

-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSArray*)titleArr {
    
    self =[super initWithFrame:frame];
    
    if (self) {
       
        self.showsVerticalScrollIndicator =NO;
        self.showsHorizontalScrollIndicator =NO;
        _localListArr =titleArr;
        _localBtnListArr =[NSMutableArray array];
//        self.pagingEnabled =YES;
        self.delegate =self;
         [self setupUIWithFrame:frame];
    }
    
    return self;
}


- (void)setupUIWithFrame:(CGRect)frame{
    if (_localListArr.count<=6 ) {
        self.contentSize =CGSizeMake(frame.size.width, frame.size.height);
        
    } else   {
        
        CGFloat W = frame.size.width+frame.size.width/6*(_localListArr.count-6);
        self.contentSize =CGSizeMake(W, frame.size.height);
    }
    UIButton *btn;
    for (int index =0; index <_localListArr.count; index++) {
        btn =[UIButton new];
        [btn setTitle:[NSString stringWithFormat:@"%@",_localListArr[index]] forState:UIControlStateNormal];
        btn.titleLabel.textAlignment =NSTextAlignmentCenter;
        btn.titleLabel.font =[UIFont systemFontOfSize:14];
        btn.frame =CGRectMake(frame.size.width/6*index, 0, frame.size.width/6, frame.size.height-1);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_localBtnListArr addObject:btn];
        [self addSubview:btn];
        btn.tag =index;
        [btn addTarget:self action:@selector(btnHitAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    _line =[UIView new];
    [self addSubview:_line];
    _line.frame =CGRectMake(0, frame.size.height-1, frame.size.width/6, 1);
    _line.backgroundColor =[UIColor redColor];
}

- (void)btnHitAction:(UIButton*)sender {
    [_localBtnListArr enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        obj.titleLabel.font =[UIFont systemFontOfSize:14];
    }];
    [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    sender.titleLabel.font =[UIFont systemFontOfSize:15];
    _line.frame =CGRectMake(self.frame.size.width/6*sender.tag, self.frame.size.height-1, self.frame.size.width/6, 1);

    if (_itemClickCallBack) {
        _itemClickCallBack(sender.tag,sender.titleLabel.text);
    }
    
}






@end
