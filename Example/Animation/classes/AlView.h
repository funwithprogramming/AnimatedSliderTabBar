//
//  AlView.h
//  Animation
//
//  Created by Alekh on 8/22/14.
//  Copyright (c) 2014 Alekh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AIViewDelegate <NSObject>

-(void)subViewAdded:(UIView*)subview;

@end

@interface AlView : UIView

@property(nonatomic,assign)id <AIViewDelegate> delegate;

@end
