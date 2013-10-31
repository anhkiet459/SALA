//
//  SLVideoController.h
//  Sala
//
//  Created by banto515 on 10/29/13.
//  Copyright (c) 2013 conpany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLVideoController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelAuthor;
@property(strong,nonatomic) NSDictionary *currentAuthor;
@property (weak, nonatomic) IBOutlet UILabel *labelVideo;
@property (weak, nonatomic) IBOutlet UILabel *labelPlaylist;
@property (weak, nonatomic) IBOutlet UIImageView *imgAuthor;
@property (weak, nonatomic) IBOutlet UITableView *videoTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segVideo;
//@property (weak, nonatomic) NSMutableArray *countTotal;

- (IBAction)segVideo:(id)sender;

@end
