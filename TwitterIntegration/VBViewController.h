//
//  VBViewController.h
//  TwitterIntegration
//
//  Created by Ariel Rodriguez on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TWTweetComposeViewController; 

@interface VBViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton *tweetButton; 
@property (nonatomic, strong) TWTweetComposeViewController *tweetSheet; 

- (IBAction)tweetButtonTapped:(id)sender; 
@end
