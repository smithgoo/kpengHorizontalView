kpengHorizontalView *H =[[kpengHorizontalView alloc]

initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 40)

andTitle:@[@"武汉",@"北京",@"北京",@"北京",@"北京",@"北京",@"北京",@"北京"]];

[self.view addSubview:H];

H.itemClickCallBack = ^(NSInteger itemIndex, NSString *title) {
NSLog(@"%ld---%@",itemIndex,title);
};

dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
H.localIndex=3;
});
