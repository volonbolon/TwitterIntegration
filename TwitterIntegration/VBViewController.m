//
//  VBViewController.m
//  TwitterIntegration
//
//  Created by Ariel Rodriguez on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "VBViewController.h"
#import <Twitter/TWTweetComposeViewController.h>

@implementation VBViewController
@synthesize tweetButton; 
@synthesize tweetSheet; 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
    if ( [TWTweetComposeViewController class] != nil ) {
        if ( ![TWTweetComposeViewController canSendTweet] ) {
            [[self tweetButton] setEnabled:NO]; 
        } else {
            [[self tweetButton] setEnabled:YES]; 
            
            [self setTweetSheet:[[TWTweetComposeViewController alloc] init]]; 
        }
    }
}

- (IBAction)tweetButtonTapped:(id)sender {
    BOOL errorWithInitialText = [[self tweetSheet] setInitialText:@"Some Initial Text. No more than 140 chars."]; 
    BOOL errorWithImage = [[self tweetSheet] addImage:[UIImage imageNamed:@"MS_Monster_Guy_Fawkes.png"]]; 
    BOOL errorWithURL = [[self tweetSheet] addURL:[NSURL URLWithString:@"http:volonbolon.net/"]]; 
    
    if ( errorWithURL || errorWithInitialText || errorWithImage ) {
        UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Something Went wrong" 
                                                                 message:@"Something went wrong adding content to the tweet"
                                                                delegate:nil
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil]; 
        [errorAlertView show]; 
    }
    
    [self presentModalViewController:[self tweetSheet] 
                            animated:YES]; 
}

@end
