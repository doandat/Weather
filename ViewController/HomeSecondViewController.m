//
//  HomeSecondViewController.m
//  Weather
//
//  Created by TaiND on 2/19/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeSecondViewController.h"
#import <XCDYouTubeKit/XCDYouTubeKit.h>

#import "MPMoviePlayerController+BackgroundPlayback.h"
#import "ServiceGetDataFromUrl.h"

@interface HomeSecondViewController ()
@property (nonatomic, strong) XCDYouTubeVideoPlayerViewController *videoPlayerViewController;

@end

@implementation HomeSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"Video:--%@--",[ServiceGetDataFromUrl getIdentifierVideoFromUrl]);
    self.videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:[ServiceGetDataFromUrl getIdentifierVideoFromUrl]];
    self.videoPlayerViewController.moviePlayer.backgroundPlaybackEnabled = [[NSUserDefaults standardUserDefaults] boolForKey:@"PlayVideoInBackground"];
//
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(videoPlayerViewControllerDidReceiveVideo:) name:XCDYouTubeVideoPlayerViewControllerDidReceiveVideoNotification object:self.videoPlayerViewController];
    [defaultCenter addObserver:self selector:@selector(moviePlayerPlaybackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.videoPlayerViewController.moviePlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enteredFullscreen:) name:MPMoviePlayerDidEnterFullscreenNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willExitFullscreen:) name:MPMoviePlayerWillExitFullscreenNotification object:nil];
    
    
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPlayerTapped:)];
    singleFingerTap.numberOfTapsRequired = 1;
    singleFingerTap.delegate = self;
    [self.videoPlayerViewController.moviePlayer.view addGestureRecognizer:singleFingerTap];
    
//    self.scrollView.d;
    CGFloat height = self.scrollView.frame.size.height-10;
    CGFloat width = height*2/3;
    _viewDayOne = [[CustomViewChild alloc]initWithFrame:CGRectMake(10, 5,width , height)];
    _viewDayTwo = [[CustomViewChild alloc]initWithFrame:CGRectMake(10*2 + width, 5,width , height)];
    _viewDayThree = [[CustomViewChild alloc]initWithFrame:CGRectMake(10*3 + width*2, 5,width , height)];
    _viewDayfour = [[CustomViewChild alloc]initWithFrame:CGRectMake(10*4 + width*3, 5,width , height)];
    _viewDayfive = [[CustomViewChild alloc]initWithFrame:CGRectMake(10*5 + width*4, 5,width , height)];
    _viewDaysix = [[CustomViewChild alloc]initWithFrame:CGRectMake(10*6 + width*5, 5,width , height)];
//    _viewDayseven = [[CustomViewChild alloc]initWithFrame:CGRectMake(10*7 + width*6, 5,width , height)];

    [self.scrollView addSubview:_viewDayOne];
    [self.scrollView addSubview:_viewDayTwo];
    [self.scrollView addSubview:_viewDayThree];
    [self.scrollView addSubview:_viewDayfour];
    [self.scrollView addSubview:_viewDayfive];
    [self.scrollView addSubview:_viewDaysix];
//    [self.scrollView addSubview:_viewDayseven];

    [self.scrollView setContentSize:CGSizeMake(width*6+10*7, self.scrollView.frame.size.height)];


}
-(void)viewDidAppear:(BOOL)animated{
//    CGFloat height = self.scrollView.frame.size.height-10;
//    CGFloat width = height*2/3;
//    [self.scrollView setContentSize:CGSizeMake(width*6+10*7, self.scrollView.frame.size.height)];
}
- (void)willEnterFullscreen:(NSNotification*)notification {
    NSLog(@"willEnterFullscreen");
//    self.videoPlayerViewController.moviePlayer.view.transform = CGAffineTransformMakeRotation(M_PI_2);
}

- (void)enteredFullscreen:(NSNotification*)notification {
//    self.videoPlayerViewController.moviePlayer.view.transform = CGAffineTransformMakeRotation(M_PI_2);
    self.videoPlayerViewController.modalPresentationStyle = UIModalPresentationFullScreen;

    NSLog(@"enteredFullscreen");
}
- (void)willExitFullscreen:(NSNotification*)notification {
    NSLog(@"willExitFullscreen");
}
- (void) viewWillAppear:(BOOL)animated{
    [self.videoPlayerViewController setVideoIdentifier:[ServiceGetDataFromUrl getIdentifierVideoFromUrl]];

}
-(void) onPlayerTapped:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"onPlayerTapped");
    if (self.videoPlayerViewController.moviePlayer.playbackState == MPMoviePlaybackStatePlaying) {
        NSLog(@"handleSingleTap isPlaying");
        [self.videoPlayerViewController.moviePlayer pause];
    }else if (self.videoPlayerViewController.moviePlayer.playbackState == MPMoviePlaybackStatePaused){
        NSLog(@"handleSingleTap pause");
        [self.videoPlayerViewController.moviePlayer play];
    }
}

#pragma mark - gesture delegate
// this allows you to dispatch touches
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;
}
// this enables you to handle multiple recognizers on single view
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.videoPlayerViewController.moviePlayer pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) load:(NSString *)videoIdentifier
{
//    [self.videoPlayerViewController presentInView:self.viewContainVideo];
//    [self.videoPlayerViewController.moviePlayer play];
//    XCDYouTubeVideoPlayerViewController *videoPlayerViewController = [[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:@"rx6gYTkSJzc"];
    [self.videoPlayerViewController presentInView:self.viewContainVideo];
    [self.videoPlayerViewController.moviePlayer play];
}

#pragma mark - Notifications

- (void) videoPlayerViewControllerDidReceiveVideo:(NSNotification *)notification
{
    XCDYouTubeVideo *video = notification.userInfo[XCDYouTubeVideoUserInfoKey];
    
    NSURL *thumbnailURL = video.mediumThumbnailURL ?: video.mediumThumbnailURL;
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:thumbnailURL] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         self.thumbnails.image = [UIImage imageWithData:data];
         
//         [self.actionButton setTitle:NSLocalizedString(@"Play Video", nil) forState:UIControlStateNormal];
//         [self.btnPLay removeTarget:self action:NULL forControlEvents:UIControlEventAllEvents];
//         [self.btnPLay addTarget:self action:@selector(load:) forControlEvents:UIControlEventTouchUpInside];
     }];
}

- (void)moviePlayerPlaybackDidFinish:(NSNotification*)aNotification
{
    // Obtain the reason why the movie playback finished
//    NSNumber *finishReason = [[aNotification userInfo] objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
//    
//    // Dismiss the view controller ONLY when the reason is not "playback ended"
//    if ([finishReason intValue] != MPMovieFinishReasonPlaybackEnded)
//    {
//        MPMoviePlayerController *moviePlayer = [aNotification object];
//        
//        // Remove this class from the observers
//        [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                        name:MPMoviePlayerPlaybackDidFinishNotification
//                                                      object:moviePlayer];
//        
//        // Dismiss the view controller
//        [self.videoPlayerViewController dismissModalViewControllerAnimated:YES];
//    }
}
@end
