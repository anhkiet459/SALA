//
//  SLHomeCellController.h
//  Sala
//
//  Created by banto515 on 10/29/13.
//  Copyright (c) 2013 conpany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLHomeCellController : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelAuthor;

@property (weak, nonatomic) IBOutlet UIImageView *imgAuthor;


- (void)setAuthorInfo:(NSDictionary *)author;
@end
