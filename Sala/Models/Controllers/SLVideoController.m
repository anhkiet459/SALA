//
//  SLVideoController.m
//  Sala
//
//  Created by banto515 on 10/29/13.
//  Copyright (c) 2013 conpany. All rights reserved.
//

#import "SLVideoController.h"

@interface SLVideoController ()
{
    NSMutableArray *_video;
    NSMutableArray *_searchVideo;
    NSMutableArray *_countTotal;
}

@end

@implementation SLVideoController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    self.segVideo.selectedSegmentIndex = 0;
    self.title = [self.currentAuthor objectForKey:@"name"];
    }
- (void)viewDidLoad
{
    [super viewDidLoad];
    _video = [[NSMutableArray alloc] init];
    NSString *urlVideo = [[NSString alloc] initWithFormat:@"http://www.qiqi.vn/ebook/admin/video/index/id/%@",[self.currentAuthor objectForKey:@"id"]];
    NSURL *url = [[NSURL alloc] initWithString:urlVideo];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        _video = [JSON objectForKey:@"results"];
        _countTotal= [JSON objectForKey:@"total"];
        
        self.labelAuthor.text = [self.currentAuthor objectForKey:@"name"];
        NSString *countVideo = [NSString stringWithFormat:@"video: %d", [[[_countTotal objectAtIndex:0] objectForKey:@"countVideo"] intValue], nil];
        
        NSString *countPlaylist = [NSString stringWithFormat:@"Playlist: %d", [[[_countTotal objectAtIndex:1] objectForKey:@"countPlaylist"] intValue], nil];
        
        self.labelVideo.text = countVideo;
        self.labelPlaylist.text = countPlaylist;
        NSURL *urlimg = [NSURL URLWithString:[self.currentAuthor objectForKey:@"picture"]];
        [self.imgAuthor setImageWithURL:urlimg placeholderImage:[UIImage imageNamed:@"imgAuthor"]];
        [self.videoTableView reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
    }];
    [operation start];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table Views functions
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.searchDisplayController.searchResultsTableView){
        return [_searchVideo count];
    }else{
        return [_video count];
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"SLVideoViewCell";
    SLVideoCellController *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"SLVideoViewCell" owner:nil options:nil];
        cell = [nib objectAtIndex:0];
    }
    if(tableView == self.searchDisplayController.searchResultsTableView){
        NSDictionary *video = [_searchVideo objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setVideoInfo:video];
        
    }else{
        NSDictionary *video = [_video objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setVideoInfo:video];
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLPlayVideoController *playVideoController = [[SLPlayVideoController alloc]initWithNibName:@"SLPlayVideoView" bundle:nil];
    [self.navigationController pushViewController:playVideoController animated:YES];
    
}
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}


- (IBAction)segVideo:(id)sender {
    if(self.segVideo.selectedSegmentIndex == 1){
        SLPlaylistController *playlistController = [[SLPlaylistController alloc]initWithNibName:@"SLPlaylistView" bundle:nil];
        [self.navigationController pushViewController:playlistController animated:YES];

    
    }
}
@end
