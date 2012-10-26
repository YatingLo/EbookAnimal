//
//  EALayer.h
//  EbookAnimal
//
//  Created by Mac06 on 12/10/25.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SoundSensor.h"
#import "MotionSensor.h"
#import "AppDelegate.h"
#import "RootViewController.h"

@interface EALayer : CCLayer {
    NSMutableArray *tapObjectArray;
    NSMutableArray *swipeObjectArray;
    NSMutableArray *panObjectArray;
    NSMutableArray *moveSprites;
    
    GamePoint *gamepoint;
    AppDelegate *delegate;
    
    BOOL touchEnable;
    BOOL soundEnable;
    
    SoundSensor *soundDetect;
    MotionSensor *motionDetect;
    
    UITapGestureRecognizer *tapgestureRecognizer;
    UISwipeGestureRecognizer *swipegestureRecognizerLeft;
    UISwipeGestureRecognizer *swipegestureRecognizerRight;
    UIPanGestureRecognizer *pangestureRecognizer;
}

+(CCScene *) scene;
-(id) init;
-(void) dealloc;

-(void) addObjects;
@end
