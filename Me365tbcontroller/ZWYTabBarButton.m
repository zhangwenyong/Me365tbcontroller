//
//  ZWYTabBarButton.m
//  HFAPP
//
//  Created by 张文勇 on 2016/11/21.
//  Copyright © 2016年 张文勇. All rights reserved.
//

#import "ZWYTabBarButton.h"

#define  COLOR5 [UIColor blackColor]
#define NAVCOLOR1 [UIColor redColor]


@implementation ZWYTabBarButton

-(id)initWithFrame:(CGRect)frame
{

    
    self=[super initWithFrame:frame];
    
    if(self){
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font =[UIFont systemFontOfSize:11];
        [self setTitleColor:COLOR5 forState:UIControlStateSelected];
        [self setTitleColor: NAVCOLOR1 forState:UIControlStateNormal];
    }
    
    return self;
    
    
}
-(void)setHighlighted:(BOOL)highlighted
{
    

    
}
-(void)setItem:(UITabBarItem *)item
{
    _item =item;
    
    [self setTitle:_item.title forState:UIControlStateNormal];
 
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage: _item.selectedImage forState:UIControlStateSelected];
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
     CGFloat  titleH = contentRect.size.height *0.4;
     CGFloat  titleX = 0;
     CGFloat  titleY = contentRect.size.height *0.6;
     CGFloat  titleW = contentRect.size.width;
     return CGRectMake(titleX,titleY, titleW, titleH);
    
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat  imageH = contentRect.size.height *0.6;
    CGFloat  imageX = 0;
    CGFloat  imageY = 0;
    CGFloat  imageW = contentRect.size.width;
    return CGRectMake(imageX, imageY, imageW, imageH);
}


@end
