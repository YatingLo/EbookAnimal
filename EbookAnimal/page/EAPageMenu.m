//
//  EAPageMenu.m
//  EbookAnimal
//
//  Created by Mac06 on 12/10/25.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "EAPageMenu.h"


@implementation EAPageMenu
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	EAPageMenu *layer = [EAPageMenu node];
    
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if (self=[super init])
    {
        NSLog(@"PageMenu");
        
        
        NSString *soundfileName = @"P3-1_owl_word.mp3";
        
        SimpleAudioEngine *sae=[SimpleAudioEngine sharedEngine];
        
        [[CDAudioManager sharedManager]setResignBehavior:kAMRBStopPlay autoHandle:YES];
        
        [sae preloadEffect:soundfileName];
        
        //ALuint soundEffectID=[sae playEffect:soundfileName];
        
        AVAudioPlayer *audioPlayer;
        soundDetect = [[SoundSensor alloc] init];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(soundMove) name:EVENT_SOUND object:soundDetect];
        
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],soundfileName]];
        NSLog(@"play");
        //wordsoundflag = FALSE;
        
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        audioPlayer.numberOfLoops = 0;
        [audioPlayer play];
        //[self schedule:@selector(PlayWordSound:) interval:1];
        //[self addWordImage];
        [url release];
	}
	return self;
}

-(void) addObjects
{
    NSLog(@"add EALayer Object");
    /*
    SoundDetectOB *test = [[SoundDetectOB alloc] initWithFile:Nil];
    [test setTextureRect:CGRectMake(0, 0, 200, 200)];
    [test setPosition:CGPointMake(50, 50)];
    [test setWordimagefileName:@"P3-1_owl_word.mp3"];
    [self addChild:test];
     */
}

-(void) draw
{
    [soundDetect update];
}

-(void) soundMove
{
    printf("sound");
    [soundDetect enableFlag];
}

-(void) dealloc
{
    [super dealloc];
}
@end
