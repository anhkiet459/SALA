//
//  SLHomeController.m
//  Sala
//
//  Created by banto515 on 10/28/13.
//  Copyright (c) 2013 conpany. All rights reserved.
//

#import "SLHomeController.h"
#import "SLVideoController.h"

@interface SLHomeController ()
{
    NSMutableArray *_author;
    NSMutableArray *_searchAuthor;
}
@end

@implementation SLHomeController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"home";
    _author = [[NSMutableArray alloc] init];
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.qiqi.vn/ebook/admin/video/author"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];

    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        _author = [JSON objectForKey:@"results"];
        [self.homeTableView reloadData];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
    }];
    
    [operation start];
}

#pragma mark -Search config
-(void)searchAuthor:(NSString*)keyword{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i = 0; i<[_author count]; i++) {
        if([[[_author objectAtIndex:i]objectForKey:@"name"] rangeOfString:keyword options:NSCaseInsensitiveSearch].length>0){
            [result addObject:[_author objectAtIndex:i]];
        }
    }
    _searchAuthor = result;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [_searchAuthor removeAllObjects];
    [self searchAuthor:searchString];
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self searchAuthor:[self.searchDisplayController.searchBar text]];
    return  YES;
}

#pragma mark - Table Views functions
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(tableView == self.searchDisplayController.searchResultsTableView){   
        return [_searchAuthor count];
    }else{
        return [_author count];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"SLHomeViewCell";
    SLHomeCellController *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"SLHomeViewCell" owner:nil options:nil];
        cell = [nib objectAtIndex:0];
    }
    if(tableView == self.searchDisplayController.searchResultsTableView){
        NSDictionary *author = [_searchAuthor objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setAuthorInfo:author];
        
    }else{
        NSDictionary *author = [_author objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setAuthorInfo:author];
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLVideoController *videoController = [[SLVideoController alloc] initWithNibName:@"SLVideoView" bundle:nil];
    [_author objectAtIndex:indexPath.row];
    if(tableView == self.searchDisplayController.searchResultsTableView){
        videoController.currentAuthor = [_searchAuthor objectAtIndex:indexPath.row];
    }else{
        videoController.currentAuthor = [_author objectAtIndex:indexPath.row];
    }
    
    [self.navigationController pushViewController:videoController animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
