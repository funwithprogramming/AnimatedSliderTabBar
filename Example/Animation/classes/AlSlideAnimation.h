//
//  AlSlideAnimation.h
//  Animation
//
//  Created by Alekh on 21/08/14.
//  Copyright (c) 2014 Alekh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlView.h"

@class AlButton;
@class AlView;

@class AlSlideAnimation;

@protocol AlSlideAnimationDelegate <NSObject>


@required

-(void)addViewForTab:(AlButton*)button withDisplayView:(AlView*)alDisView;

@optional


-(void)alslide:(AlSlideAnimation*)alslide WillpushOutsideTabwithIndex:(NSInteger)index ;

-(void)alslide:(AlSlideAnimation*)alslide WillpushInsideTabwithIndex:(NSInteger)index ;

-(void)alslide:(AlSlideAnimation*)alslide pushedInsideTabwithIndex:(NSInteger)index ;

-(void)alslide:(AlSlideAnimation*)alslide pushedOutsideTabwithIndex:(NSInteger)index ;





@end

@interface AlSlideAnimation : UIView

@property(nonatomic,strong,readonly)NSMutableArray *tabsArray;
@property(nonatomic,assign)int noOfTabs;
@property(nonatomic,assign,readonly)int opentabscount;

@property(nonatomic,assign)int height;
@property(nonatomic,assign)int width;
@property(nonatomic,strong)NSArray *tabsNameArray;;
@property(nonatomic,assign)int gapBwTabs;
@property(nonatomic,assign)BOOL willAnimate;
@property(nonatomic,assign,readonly)int tobeanimatedCount;
@property(nonatomic,assign)id <AlSlideAnimationDelegate> delegate;


-(void)addAnimationToView;

-(void)selectIndex:(NSInteger)integer;



@end
