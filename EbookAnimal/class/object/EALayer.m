//
//  EALayer.m
//  EbookAnimal
//
//  Created by Mac06 on 12/10/25.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "EALayer.h"


@implementation EALayer
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	EALayer *layer = [EALayer node];
    
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
        NSLog(@"Layer");
        [self addObjects];
	}
	return self;
}


-(void) dealloc
{
    [super dealloc];
}

@end
