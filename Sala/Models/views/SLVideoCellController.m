//
//  SLVideoCellController.m
//  Sala
//
//  Created by banto515 on 10/30/13.
//  Copyright (c) 2013 conpany. All rights reserved.
//

#import "SLVideoCellController.h"

@implementation SLVideoCellController

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setVideoInfo:(NSDictionary *)video{
    self.labelVideo.text = [video objectForKey:@"name"];
    //NSURL *url = [NSURL URLWithString:[author objectForKey:@"picture"]];

    //[self.imgAuthor setImageWithURL:url placeholderImage:[UIImage imageNamed:@"imgAuthor"]];
}@end
