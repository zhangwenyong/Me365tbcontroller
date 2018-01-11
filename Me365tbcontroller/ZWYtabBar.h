//
//  ZWYtabBar.h
//  HFAPP
//
//  Created by 张文勇 on 2016/11/21.
//  Copyright © 2016年 张文勇. All rights reserved.
// 自定义 tabBar

#import <UIKit/UIKit.h>


@class ZWYtabBar;

@protocol ZWYtabBarDelegate <NSObject>

-(void)ZWYtabBar:(ZWYtabBar *)tabBar from:(NSInteger)from to:(NSInteger)to;


@end

@interface ZWYtabBar : UIView

@property (nonatomic,weak)id<ZWYtabBarDelegate>delegate;

/**
 根据传过来的item来设置title 和image;
 */
-(void)addtabBarterm:(UITabBarItem *)Item;

@end
