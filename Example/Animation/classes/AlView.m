//
//  AlView.m
//  Animation
//
//  Created by Alekh on 8/22/14.
//  Copyright (c) 2014 Alekh. All rights reserved.
//

#import "AlView.h"

@implementation AlView


@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)didAddSubview:(UIView *)subview{
    
    if([self.delegate respondsToSelector:@selector(subViewAdded:)]){
        
        [self.delegate subViewAdded:subview];
        
    }
    
    
    
    
    
}



@end
