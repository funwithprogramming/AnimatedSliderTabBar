//
//  AnimateUtility.m
//  Animation
//
//  Created by Alekh on 8/23/14.
//  Copyright (c) 2014 Alekh. All rights reserved.
//

#import "AnimateUtility.h"



@implementation AnimateUtility

@synthesize animationtime;

+ (id)sharedManager {
    static AnimateUtility *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil)
            sharedMyManager = [[self alloc] init];
    }
    return sharedMyManager;
}



-(void)animateToPushOutside:(NSArray*)viewArray forDisplacement:(int)displacement completion:(CompletionBlock)completed{
    
    
    
    
    [UIView animateWithDuration:animationtime
                          delay:0.0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         for(UIView *view in viewArray){
                             
                             
                             CGRect origFrame = view.frame;
                             
                             view.frame = CGRectMake(origFrame.origin.x-displacement, origFrame.origin.y, origFrame.size.width, origFrame.size.height);
                             
                        }
                         
                         
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                         
                         
                         completed(viewArray);
                         

                         
                         
                     }];
    
    
    
    
    
}


-(void)animateToPushInside:(NSArray*)viewArray forDisplacement:(int)displacement completion:(CompletionBlock)completed{
    
    [UIView animateWithDuration:animationtime
                          delay:0.0
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         for(UIView *view in viewArray){
                             
                             
                             CGRect origFrame = view.frame;
                             
                             view.frame = CGRectMake(origFrame.origin.x+displacement, origFrame.origin.y, origFrame.size.width, origFrame.size.height);
                             
                             
                             
                         }
                         
                         
                         
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                         
                         
                         
                         completed(viewArray);
                         
                         
                         
                         
                     }];

    
    
    
}


@end
