//
//  SLHomeCellController.m
//  Sala
//
//  Created by banto515 on 10/29/13.
//  Copyright (c) 2013 conpany. All rights reserved.
//

#import "SLHomeCellController.h"

@implementation SLHomeCellController

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

- (void)setAuthorInfo:(NSDictionary *)author{
    self.labelAuthor.text = [author objectForKey:@"name"];
    NSURL *url = [NSURL URLWithString:[author objectForKey:@"picture"]];
    
    //NSData *img = [[NSData alloc]initWithContentsOfURL:url];
    
    //NSLog(@"string:",[author objectForKey:@"picture"]);
     
    //self.imageView.image = [UIImage imageWithData:img];
    [self.imgAuthor setImageWithURL:url placeholderImage:[UIImage imageNamed:@"imgAuthor"]];
}

@end
