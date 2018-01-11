//
//  ME365BaseTabBarViewController.m
//  Baseviewcontroller
//
//  Created by 张文勇 on 2018/1/11.
//  Copyright © 2018年 张文勇. All rights reserved.
//

#import "ME365BaseTabBarViewController.h"
#import "ZWYtabBar.h"
#import<CTMediator+ME365.h>
@interface ME365BaseTabBarViewController ()<ZWYtabBarDelegate>
@property(nonatomic,strong)NSArray *imageNormalArr;
@property(nonatomic,strong)NSArray *imageSeclectionArry;
@property (nonatomic,strong)NSArray *titleArry;
@property (nonatomic,strong)ZWYtabBar *ZWTabBar ;

@end

@implementation ME365BaseTabBarViewController

//-(instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    self =[super initWithCoder:aDecoder];
//
//
//    if(self)
//    {
//
//    }
//
//    return self;
//
//
//}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for(UIView *view in self.tabBar.subviews){
        if([view isKindOfClass: [UIControl class]])
        {
            view.hidden = YES;
        }
    }
    [self  SetupTabBar];
    [self addtabBartem];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *nv1 = [[[CTMediator alloc]init]Z_ViewControlller1:nil];
    
    UIViewController *nv2 = [[[CTMediator alloc]init]Z_ViewControlller2:nil];;

    UIViewController *nv3 = [[[CTMediator alloc]init]Z_ViewControlller3:nil];;

    UIViewController *nv4 = [[[CTMediator alloc]init]Z_ViewControlller4:nil];;
    
    
    self.viewControllers = @[nv1,nv2,nv3,nv4];
    
    self.view.backgroundColor = [UIColor redColor];
}
-(void)ZWYtabBar:(ZWYtabBar *)tabBar from:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}
-(void)addtabBartem
{
    _imageNormalArr = @[@"normal-home",@"normal-interests",@"normal-card",@"normal-personal"];
    _imageSeclectionArry =@[@"abnormal-home",@"abnormal-interests",@"abnormal-card",@"abnormal-mine"];
    _titleArry =@[@"首页",@"活动",@"购物车",@"我的"];
    for(int index = 0; index<=3;index++){
        self.tabBarItem.title= _titleArry[index];
        self.tabBarItem.image= [UIImage imageNamed:_imageNormalArr[index]];
        self.tabBarItem.selectedImage = [UIImage imageNamed:_imageSeclectionArry[index]];
        [_ZWTabBar addtabBarterm:self.tabBarItem];
    }
    for (int  i=0;i<self.viewControllers.count;i++)
    {
        

    }
    
}

-(void)SetupTabBar
{
    ZWYtabBar *ZWTabBar = [[ZWYtabBar alloc]init];
    ZWTabBar.frame= self.tabBar.bounds;
    ZWTabBar.backgroundColor =[UIColor whiteColor];
    ZWTabBar.delegate=self;
    [self.tabBar addSubview:ZWTabBar];
    _ZWTabBar =ZWTabBar;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
