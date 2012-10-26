//
//  SoundSensor.m
//  EBook ClickAnimate
//
//  Created by Mac06 on 12/10/1.
//
//

#import "SoundSensor.h"

@implementation SoundSensor

-(id) init
{
    if (self = [super init]) {
        soundLimit = 0.06f;
        enable = YES;
        NSURL *url = [NSURL fileURLWithPath:@"/dev/null"];
        
        
        [[AVAudioSession sharedInstance] setActive:YES error:nil];
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        
        NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                                  [NSNumber numberWithFloat: 44100.0],                 AVSampleRateKey,
                                  [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
                                  [NSNumber numberWithInt: 1],                         AVNumberOfChannelsKey,
                                  [NSNumber numberWithInt: AVAudioQualityLow],         AVEncoderAudioQualityKey,
                                  nil];
        
        NSError *error;
        
        recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
        
        if (recorder) {
            [recorder prepareToRecord];
            recorder.meteringEnabled = YES;
            [recorder record];

        } else
            NSLog(@"%@",[error description]);
    }
    return self;
}

-(void) update
{
    //NSLog(@"sound update");
    [recorder updateMeters];
    
	//const double ALPHA = 0.05;
	double peakPowerForChannel = pow(10, (0.05 * [recorder peakPowerForChannel:0]));
    double avgPoserForChannel = pow(10, (0.05 * [recorder averagePowerForChannel:0]));
    double differ = peakPowerForChannel - avgPoserForChannel;
    
    NSLog(@"Sound power: %f", peakPowerForChannel);
    NSLog(@"Sound avg: %f", avgPoserForChannel);
	NSLog(@"Sound differ: %f", differ);
    
    //Log 聲音內容
    //NSLog(@"Average input: %f Peak input: %f", [recorder averagePowerForChannel:0], [recorder peakPowerForChannel:0]);
    //NSLog(@"Average input: %f Peak input: %f", avgPoserForChannel, peakPowerForChannel);
    //NSLog(@"Differ: %f", differ);
    //NSLog(@"Average input: %d Peak input: %d", avgPoserForChannel, peakPowerForChannel);
    //if ((lowPassResults > soundLimit) & enable){
    if (differ > LIMIT_DIFFER) {
        enable = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_SOUND object:self];
    }
}

-(void) dealloc
{
    [super dealloc];
    recorder = nil;
}

-(void) enableFlag
{
    enable = YES;
}
@end
