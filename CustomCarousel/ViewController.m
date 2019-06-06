//
//  ViewController.m
//  CustomCarousel
//
//  Created by Albert on 2019/6/6.
//  Copyright © 2019年 Albert. All rights reserved.
//

#import "ViewController.h"
#import "CarouselView.h"

@interface ViewController ()<iCarouselDataSource, iCarouselDelegate>

//轮盘
@property (nonatomic, strong) CarouselView *carousel;

@property (nonatomic, strong) NSArray *menuList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuList = @[@"icon_check", @"icon_child",@"icon_contact", @"icon_kq",@"icon_my", @"icon_qj",];
    
    self.carousel = [[CarouselView alloc] init];
    self.carousel.type = iCarouselTypeInvertedWheel;
    self.carousel.vertical = YES;
    self.carousel.dataSource = self;
    self.carousel.delegate = self;
    self.carousel.centerItemWhenSelected = NO;
    self.carousel.frame = CGRectMake(self.view.bounds.size.width *0.28, self.view.bounds.size.height *0.25, self.view.bounds.size.width *0.5, 300);
    [self.view addSubview:self.carousel];
    
}


- (NSInteger)numberOfItemsInCarousel:(__unused CarouselView *)carousel{
    return self.menuList.count;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(CarouselView *)carousel {
    return 3;
}

- (UIView *)carousel:(__unused CarouselView *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    }
    NSString *imgStr = self.menuList[index];
    ((UIImageView *)view).image = [UIImage imageNamed:imgStr];
    
    
    return view;
}


- (CGFloat)carouselItemWidth:(CarouselView *)carousel
{
    return self.carousel.frame.size.height/4;
}

- (CGFloat)carousel:(CarouselView *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    //    NSLog(@"value：%f",value);
    return value;
}

- (CGFloat)carousel:(CarouselView *)carousel itemAlphaForOffset:(CGFloat)offset {
    return 1.0f - fminf(fmaxf(offset, 0.0f), 1.0f);
}


- (void)carouselCurrentItemIndexDidChange:(__unused CarouselView *)carousel
{
    NSLog(@"Index: %@", @(self.carousel.currentItemIndex));
}

#pragma mark -
#pragma mark iCarousel taps

- (void)carousel:(__unused CarouselView *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"Tapped view type: %zd", index);
    
    
}

@end
