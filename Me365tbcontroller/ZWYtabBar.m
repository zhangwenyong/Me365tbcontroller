//
//  ZWYtabBar.m
//  HFAPP
//
//  Created by 张文勇 on 2016/11/21.
//  Copyright © 2016年 张文勇. All rights reserved.
//

#import "ZWYtabBar.h"
#import "ZWYTabBarButton.h"

@interface ZWYtabBar()

@property (nonatomic ,strong)UIButton *selectedButton;
@property (nonatomic,strong)NSMutableArray *animationArray;


@end


@implementation ZWYtabBar

-(id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if(self)
    {
        _animationArray=[[NSMutableArray alloc]init];
        
    }
    return self;
    
}

-(void)addtabBarterm:(UITabBarItem *)Item
{
    
    ZWYTabBarButton *HFTabBarButton = [[ZWYTabBarButton alloc]init];
    HFTabBarButton.item =Item;
    [self addSubview:HFTabBarButton];
    [HFTabBarButton addTarget:self action:@selector(buttonclick:) forControlEvents:UIControlEventTouchUpInside];
    [_animationArray addObject:HFTabBarButton];
    
}
-(void)buttonclick:(UIButton *)button
{
     _selectedButton.selected=NO;
    
    if([self.delegate respondsToSelector:@selector(ZWYtabBar:from:to:)])
    {
        
        [self.delegate ZWYtabBar:self from:_selectedButton.tag to:button.tag];
    }
    
     button.selected = YES;
    
    _selectedButton=button;
   
    
    [self animationWithIndex:button.tag];

    
    
}
-(void)animationWithIndex:(NSInteger)index
{
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animation];
    animation.keyPath =@"transform.scale";
    animation.values=@[@1.0,@1.2,@0.9,@1.15,@0.95,@1.02,@1.0];
    animation.duration=1.0;
    animation.calculationMode =kCAAnimationCubic;
    [[_animationArray[index] layer] addAnimation:animation forKey:nil];

}
-(void)layoutSubviews
{
    CGFloat viewW =self.frame.size.width/self.subviews.count;
    CGFloat viewH =self.frame.size.height;
    CGFloat viewY =0;
    for (int i =0; i<self.subviews.count;i++){
        CGFloat viewX =viewW*i;
        UIButton *button =(UIButton *)self.subviews[i];
        button.tag= i;
        button.frame = CGRectMake(viewX, viewY, viewW, viewH);
        if(i==0)
        {
        [self buttonclick:button];
        }
        
        
    }
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
