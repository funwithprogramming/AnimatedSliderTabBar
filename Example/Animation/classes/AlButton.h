//
//  AlButton.h
//  Animation
//
//  Created by Alekh on 8/22/14.
//  Copyright (c) 2014 Alekh. All rights reserved.
//

typedef enum : NSUInteger {
    OUTSIDE,
    INSIDE,
} ButtonState;

@class AlButton;

#import <UIKit/UIKit.h>

#import "AlView.h"


@protocol AIButtonDelegate <NSObject>



-(void)tabClicked:(AlButton*)button;

@end

@interface AlButton : UIButton
@property(nonatomic,assign)ButtonState state;
@property(nonatomic,strong)AlView *displayView;
@property(nonatomic,assign)id <AIButtonDelegate> delegate;

-(void)buttonClicked;


@end
