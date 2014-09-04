//
//  AlSlideAnimation.m
//  Animation
//
//  Created by Alekh on 21/08/14.
//  Copyright (c) 2014 Alekh. All rights reserved.
//


#define DegreesToRadians(x) ((x) * M_PI / 180.0)


#define GAP_BETWEEN_TABS 10

#define NO_OF_TABS 4

#define HEADER_MARGIN 7

#define FOOTER_MARGIN 5


#define HEIGHT_OF_TAB 40


#define WIDTH_OF_SLIDE_VIEW 400

#define HEIGHT_OF_SLIDE_VIEW 670

#define INITIAL_POSITION_X 905

#define INITIAL_POSITION_Y 70


#define ANIMATION_TIME 1.0

#define IS_MUTUALLY_EXCLUSIVE 1








#import "AlSlideAnimation.h"

#import "AlButton.h"

#import "AlView.h"

#import "AnimateUtility.h"
#import "AddIntakeColorCodes.h"

@interface AlSlideAnimation ()<AIButtonDelegate,AIViewDelegate>

@property(nonatomic,assign)float heightOftab;

@property(nonatomic,strong)UIView *baseView;

@property(nonatomic,assign)float leftDisplacement;

@property(nonatomic,strong)UIView *leftView;


@property(nonatomic,weak)AlButton *currBtn;

@property(nonatomic,weak)AlButton *outBtn;





@property(nonatomic,strong,readwrite)NSMutableArray *tabsArray;


@property(nonatomic,assign,readwrite)int opentabscount;


@property(nonatomic,assign,readwrite)int tobeanimatedCount;


@end

@implementation AlSlideAnimation

@synthesize noOfTabs,gapBwTabs,initialPosition;
@synthesize height,width;
@synthesize leftDisplacement;
@synthesize delegate;
@synthesize currBtn;
@synthesize tabsArray;
@synthesize outBtn;
@synthesize willAnimate;

@synthesize tabsNameArray;

@synthesize tobeanimatedCount;


@synthesize opentabscount;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        width = WIDTH_OF_SLIDE_VIEW;
        height = HEIGHT_OF_SLIDE_VIEW;
        initialPosition.x = INITIAL_POSITION_X;
        initialPosition.y = INITIAL_POSITION_Y;
        
        
        //setting frame
        self.frame = CGRectMake(initialPosition.x, initialPosition.y, width, height);
        
        
        _heightOftab = HEIGHT_OF_TAB;
        
        
        //displacement would be eqaual to width
        leftDisplacement = width;
        
        leftDisplacement  = width;
        
     
        
        
       CGRect selfframe = CGRectMake(initialPosition.x, initialPosition.y, width, height);
        
        
        self.frame = selfframe;
        
        
        
        
        UIView *baseView = [[UIView alloc]initWithFrame:selfframe];
        [baseView setBackgroundColor:[[UIColor grayColor] colorWithAlphaComponent:0.4]] ;
        //_baseView = baseView;
        //[self addSubview:baseView];
        
        
        NSMutableArray *array = [NSMutableArray array];
        tabsArray = array;

        
        
        for(int i = 0;i < NO_OF_TABS ;i++){
            
           AlButton * alBtn  = [self addTabForindex:i atView:self];
            
            [tabsArray addObject:alBtn];
            
            
            
            
        }
        
        [self initializeLeftView];
        
        
        opentabscount = 0;
        
        //animation settings
        AnimateUtility *shared = [AnimateUtility sharedManager];
        shared.animationtime = ANIMATION_TIME;
        
        
        willAnimate = NO;

        
    }
    return self;
}




//Create a left view 

-(void)initializeLeftView{
    
    UIView *leftsideView = [[UIView alloc]initWithFrame:CGRectMake(_heightOftab, 0, width, height)];
    leftsideView.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.0];
    
    CGPoint ownCentre  = self.center;
    
    leftsideView.center = CGPointMake(ownCentre.x-width, ownCentre.y);
    
    
    
    _leftView = leftsideView;
    
    
    //rotating
    
    //[self rotateView:_leftView ToDegree:90];
    
    
}









-(AlButton*)addTabForindex:(int)index atView:(UIView*)view{
    
    float widthOftabs = ((height - (HEADER_MARGIN+FOOTER_MARGIN)-(NO_OF_TABS-1)*GAP_BETWEEN_TABS))/NO_OF_TABS;
    

    
    AlButton  *button = [[AlButton alloc]initWithFrame:CGRectMake(0, 0, widthOftabs, _heightOftab)];
    
    
    button.delegate = self;
    
    button.state = INSIDE;
    
    button.tag = index;
    
    tabsNameArray = @[@"PROFILE",@"HEART FAILURE",@"BASELINE",@"LABS"];
    
    [button setTitle:[tabsNameArray objectAtIndex:index] forState:UIControlStateNormal];
    
    [button setCenter:[self centerOfButtonAtIndex:index]];
    

    //rotating
    
    button.transform = CGAffineTransformMakeRotation(DegreesToRadians(90));
    
    [view addSubview:button];
    
    
    return button;
}




-(void)rotateView:(UIView*)view ToDegree:(int)degree{
    
    
    view.transform = CGAffineTransformMakeRotation(DegreesToRadians(90));
    
    
}


//Set the center of button
-(CGPoint)centerOfButtonAtIndex:(NSInteger)index{
    
    
    float widthOftabs = ((height - (HEADER_MARGIN+FOOTER_MARGIN)-(NO_OF_TABS-1)*GAP_BETWEEN_TABS))/NO_OF_TABS;
    
    float ycenter = HEADER_MARGIN + index*(widthOftabs+GAP_BETWEEN_TABS) + widthOftabs/2;
    
    
    return CGPointMake(_heightOftab/2,ycenter);
    
    
    
}


-(void)selectIndex:(NSInteger)integer{
    
    
    AlButton *button = [tabsArray objectAtIndex:integer];
    
    [button buttonClicked];
    //button.state = OUTSIDE;
    
    //[self tabClicked:button];
    
    
}




-(void)tabClicked:(AlButton*)tab
{
    
    self.currBtn  = tab;
    
    willAnimate = YES;
    
    
    if((opentabscount==1)&&(tab.state ==INSIDE)){
        
        tobeanimatedCount = tobeanimatedCount+2;
        
    }
    else{
        
         tobeanimatedCount++;
        
    }
   
    
    if((IS_MUTUALLY_EXCLUSIVE)&&(opentabscount == 1)&&(currBtn!=outBtn))
    {
        
        
        [self animateInsidePushForButton:self.outBtn];
        outBtn.state = INSIDE;
        return;
        
    }
    
    
    [self performTaskForTab:tab];
    

}
    
    



-(void)performTaskForTab:(AlButton*)tab{
    
    
    self.currBtn = tab;
    
    if(tab.state == INSIDE){
        
        
        [self prepareForOutsideAnimation:tab];


        
        
        
        
        
    }
    
    else if(tab.state == OUTSIDE){
        
        
        [self animateInsidePushForButton:tab];
        
        
        
        
    }

    
}

-(void)prepareForOutsideAnimation:(AlButton*)tab{
    
    AlView *tabRightView = [self addTabRightViewtoView:self WithIndex:tab.tag];
    tabRightView.delegate = self;
    tab.displayView = tabRightView;
    [self.delegate addViewForTab:tab withDisplayView:tabRightView];

    
}




-(void)subViewAdded:(UIView *)subview{
    
    
    [self animateOutsidePushForButton:currBtn];
    
}


-(void)animateOutsidePushForButton:(AlButton*)button{
    
    
    AnimateUtility *shared = [AnimateUtility sharedManager];
    
    if([self.delegate respondsToSelector:@selector(alslide:WillpushOutsideTabwithIndex:)]){
        
        [self.delegate alslide:self WillpushOutsideTabwithIndex:button.tag];
        
        
    }
    
    [shared animateToPushOutside:@[button,button.displayView] forDisplacement:leftDisplacement completion:^(NSArray *viewArray) {
        
        
        AlButton *button = [viewArray objectAtIndex:0];
        button.center = [self centerOfButtonAtIndex:button.tag];
        
        [button removeFromSuperview];
        
        [self.superview addSubview:_leftView];
        
        [_leftView addSubview:button];
        
        
        
        //Now add  display view
        
        AlView *displayview = button.displayView;
        
        [displayview removeFromSuperview];
        
        
        displayview.frame = CGRectMake(_heightOftab, 0, displayview.frame.size.width, displayview.frame.size.height);
        
        
        [_leftView addSubview:displayview];
        
        NSLog(@"Tabs array count %ld",tabsArray.count);
        
        
        willAnimate = NO;
        
        opentabscount++;
        
        outBtn = currBtn;
        
        tobeanimatedCount--;
        
        if([self.delegate respondsToSelector:@selector(alslide:pushedOutsideTabwithIndex:)]){
            
            [self.delegate alslide:self pushedOutsideTabwithIndex:button.tag];
            
            
        }

        
        
        
        
        
        
        
        
        
        
    }];

    
    
    
}

-(void)animateInsidePushForButton:(AlButton*)button{
    
    
    AnimateUtility *shared = [AnimateUtility sharedManager];
    
    if([self.delegate respondsToSelector:@selector(alslide:WillpushInsideTabwithIndex:)]){
        
        [self.delegate alslide:self WillpushInsideTabwithIndex:button.tag];
        
        
    }
    
    [shared animateToPushInside:@[button,button.displayView] forDisplacement:leftDisplacement completion:^(NSArray *viewArray) {
        
        opentabscount--;
        
        AlButton *button = [viewArray objectAtIndex:0];
        button.center =  [self centerOfButtonAtIndex:button.tag];
        [button removeFromSuperview];
        [self addSubview:button];
        
        //test
        [button.displayView removeFromSuperview];
        
        
        if(opentabscount == 0){
            
            [_leftView removeFromSuperview];
            
        }
        
        
        
        tobeanimatedCount--;
        
        if([self.delegate respondsToSelector:@selector(alslide:pushedInsideTabwithIndex:)]){
            
            [self.delegate alslide:self pushedInsideTabwithIndex:button.tag];
            
            
        }
        
        //willAnimate = NO;
        
        if(IS_MUTUALLY_EXCLUSIVE){
            
            if(self.outBtn!=currBtn){
                
                
                
                [self prepareForOutsideAnimation:currBtn];
                
            }
            
        }

        
        
    }];
    
    
    
    
}














-(AlView*)addTabRightViewtoView:(UIView*)view WithIndex:(NSInteger)index{
    
    //size of view which comes with button
    float sideViewWdth  = width - _heightOftab;
    
    
    
    AlView *sideView = [[AlView alloc]initWithFrame:CGRectMake(_heightOftab, 0, sideViewWdth, height)];
    //sideView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:1.0];
    sideView.backgroundColor = [ADD_INTAKE_MAIN_VIEW_COLOR colorWithAlphaComponent:1.0];
    
    sideView.tag = index;
    [view addSubview:sideView];
    
    
    sideView.delegate = self;
    
    //[self rotateView:sideView ToDegree:90];
    
    
    return sideView;

    
    
}
















@end
