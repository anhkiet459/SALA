//
//  SLVideoCellController.h
//  Sala
//
//  Created by banto515 on 10/30/13.
//  Copyright (c) 2013 conpany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLVideoCellController : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelVideo;

- (void)setVideoInfo:(NSDictionary *)video;
@end
