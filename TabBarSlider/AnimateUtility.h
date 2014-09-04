//
//  AnimateUtility.h
//  Animation
//
//  Created by Alekh on 8/23/14.
//  Copyright (c) 2014 Alekh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ CompletionBlock)(NSArray*);

@interface AnimateUtility : NSObject

@property(nonatomic,assign)int animationtime;


+ (id)sharedManager;


//Methods to Animate

-(void)animateToPushOutside:(NSArray*)viewArray forDisplacement:(int)displacement completion:(CompletionBlock)completed;


-(void)animateToPushInside:(NSArray*)viewArray forDisplacement:(int)displacement completion:(CompletionBlock)completed;

@end
