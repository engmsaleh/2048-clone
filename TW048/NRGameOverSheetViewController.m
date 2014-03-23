//
//  NRGameOverSheetViewController.m
//  TW048
//
//  Created by Niklas Riekenbrauck on 22.03.14.
//  Copyright (c) 2014 Niklas Riekenbrauck. All rights reserved.
//

#import "NRGameOverSheetViewController.h"
#import "MZFormSheetController.h"
#import <Social/Social.h>

@interface NRGameOverSheetViewController ()

@end

@implementation NRGameOverSheetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.restartButton.layer.cornerRadius = 4.0;
    self.restartButton.layer.masksToBounds = YES;
    self.tweetButton.layer.cornerRadius = 4.0;
    self.tweetButton.layer.masksToBounds = YES;
    self.facebookButton.layer.cornerRadius = 4.0;
    self.facebookButton.layer.masksToBounds = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pushedRestart:(UIButton *)sender {
    MZFormSheetController *parent = (MZFormSheetController*)[self mz_parentTargetViewController];
    [parent mz_dismissFormSheetControllerAnimated:YES completionHandler:^(MZFormSheetController *formSheetController) {
        // do sth
    }];
}

- (IBAction)pushedTweet:(UIButton *)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:[NSString stringWithFormat:@"I scored %i points in 2048 for iPhone. 2048 can be downloaded from http://nikriek.de/2048",(int)self.score]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
}

- (IBAction)pushedFacebook:(UIButton *)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:[NSString stringWithFormat:@"I scored %i points in 2048 for iPhone. 2048 can be downloaded from http://nikriek.de/2048",(int)self.score]];
        [self presentViewController:controller animated:YES completion:Nil];
    }
}
@end