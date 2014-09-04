//
//  ViewController.m
//  TabeSlider
//
//  Created by Alekh on 9/5/14.
//  Copyright (c) 2014 Fumop. All rights reserved.
//

#import "ViewController.h"
#import "AlSlideAnimation.h"

@interface ViewController ()<AlSlideAnimationDelegate>

//@property(nonatomic,strong)

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //Plese note that frame of below animation view is set from .m file of AlSlideAnimation
    
    AlSlideAnimation *slide = [[AlSlideAnimation alloc]initWithFrame:CGRectMake(500, 60, 200, 400)];
    slide.delegate = self;
   
    //[slide selectIndex:0];
    
    [self.view addSubview:slide];

}




//Delegate method ..Alslideanimation




-(void)addViewForTab:(AlButton *)button withDisplayView:(AlView *)alDisView{
    
    //adding views for tabs
    
    
    UIButton *sample = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 100,50)];
    [sample setBackgroundColor:[UIColor blackColor]];
    [sample setTitle:[NSString stringWithFormat:@"Save"] forState:UIControlStateNormal];
    //[sample addTarget:self action:@selector(meCalled) forControlEvents:UIControlEventTouchUpInside];

    [alDisView addSubview:sample];
    
    
    
}





-(void)alslide:(AlSlideAnimation *)alslide WillpushOutsideTabwithIndex:(NSInteger)index{
    
    NSLog(@"will Pushed Outside %d",index);
    
}

-(void)alslide:(AlSlideAnimation *)alslide WillpushInsideTabwithIndex:(NSInteger)index{
    
    NSLog(@"will Pushed Inside %d",index);
}



-(void)alslide:(AlSlideAnimation *)alslide pushedOutsideTabwithIndex:(NSInteger)index{
    
    NSLog(@"Pushed outside %d",index);
    
}





-(void)alslide:(AlSlideAnimation *)alslide pushedInsideTabwithIndex:(NSInteger)index{
    
    NSLog(@"Pushed Inside %d",index);
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
