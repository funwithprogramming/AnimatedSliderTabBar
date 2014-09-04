//
//  AlButton.m
//  Animation
//
//  Created by Alekh on 8/22/14.
//  Copyright (c) 2014 Alekh. All rights reserved.
//

#import "AlButton.h"
#import "IntakeUtilities.h"
#import "AddIntakeColorCodes.h"

@implementation AlButton

@synthesize  state;
@synthesize delegate;

@synthesize displayView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        state = INSIDE;
        
        [self addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        //self.backgroundColor = ADD_INTAKE_MAIN_VIEW_COLOR;
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setTitleColor:ORANGE_TEXT_COLOR forState:UIControlStateNormal];
        
        [self.titleLabel setFont:kIntakeFontPostBdCn18];

        
        //self.layer.cornerRadius = 10.0;
        
        [self cornerRadius];
    }
    return self;
}

-(void)cornerRadius{
    
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                           cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;

    
    
}



-(void)buttonClicked{
    
    
    
    if([self.delegate respondsToSelector:@selector(tabClicked:)]){
        
         [self.delegate tabClicked:self];
        
        

        
    }
    
    
    
    state = (state == INSIDE?OUTSIDE:INSIDE);
    
    
}



@end
