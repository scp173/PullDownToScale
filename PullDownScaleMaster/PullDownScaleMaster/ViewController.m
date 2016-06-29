//
//  ViewController.m
//  PullDownScaleMaster
//
//  Created by 李建刚 on 16/6/29.
//  Copyright © 2016年 jiangang.li. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()<UIScrollViewDelegate>
{
    float Mheight;
    float Mwidth;

}
@end

@implementation ViewController
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    Mheight = self.topbg.frame.size.height;
    Mwidth = self.topbg.frame.size.width;
    
}
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yPos = -scrollView.contentOffset.y;
    
    NSLog(@"heightis:%f",self.topbg.frame.size.height);
    NSLog(@"width:%f",self.topbg.frame.size.width);
    
    if (yPos > 0) {
        [self.topbg mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@(Mheight+yPos));
            make.top.mas_equalTo(-yPos);
            make.left.mas_equalTo(-yPos);
            //
            make.width.mas_equalTo(@(Mwidth+yPos*2));
            //make.width.equalTo(self.bgmig.mas_height).with.multipliedBy(300/173);
            [self.scollview setNeedsLayout];
        }];
        //            self.height.constant = Mheight+yPos;
        //            self.left.constant = -yPos;
        //            self.top.constant = -yPos;
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scollview.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
