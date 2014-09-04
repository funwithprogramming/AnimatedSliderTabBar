//
//  AlButton.m
//  Animation
//
//  Created by Alekh on 8/22/14.
//  Copyright (c) 2014 Alekh. All rights reserved.
//

#import "AlButton.h"


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

        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}





-(void)buttonClicked{
    
    
    
    if([self.delegate respondsToSelector:@selector(tabClicked:)]){
        [self.delegate tabClicked:self];
        }
    
    state = (state == INSIDE?OUTSIDE:INSIDE);
    
    
}



@end
