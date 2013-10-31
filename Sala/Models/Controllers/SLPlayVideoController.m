//
//  SLPlayVideoController.m
//  Sala
//
//  Created by banto515 on 10/30/13.
//  Copyright (c) 2013 conpany. All rights reserved.
//

#import "SLPlayVideoController.h"

@interface SLPlayVideoController ()

@end

@implementation SLPlayVideoController

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
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.youtube.com/watch?v=zoKj7TdJk98"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
