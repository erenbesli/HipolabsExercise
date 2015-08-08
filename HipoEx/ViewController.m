//
//  ViewController.m
//  HipoEx
//
//  Created by Obase Bilgisayar on 08/08/15.
//  Copyright (c) 2015 HipoLabs. All rights reserved.
//

#import "ViewController.h"
#import "ExApiMedia.h"
#import "TableViewCell.h"
#import "ExApiTag.h"

@interface ViewController ()

@property NSMutableArray *data;
@property NSDictionary *data1;
@property NSMutableArray *data2;
@property NSMutableArray *ImageArray;
@property NSMutableArray *userNames;
@property NSMutableArray *publisedTimes;
@property NSMutableArray *profileImages;

@property (strong, nonatomic) NSArray *searchResults;
@property (nonatomic, strong) NSArray *filteredTableViewData;

@end

@implementation ViewController

@synthesize ImageArray,searchResults,filteredTableViewData;

UITableView *tableView;
UISearchBar *testbar;
BOOL isFilltered;


- (void)viewDidLoad
{
    

    [super viewDidLoad];

    
    
    [self getPublicPhotos];
    
    CGRect frame = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y+20, self.view.bounds.size.width, self.view.bounds.size.height);
    
    
    // init table view
    tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    
    testbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 70, 320, 44)];
    [tableView setTableHeaderView:testbar];
    
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    tableView.delegate = self;
    tableView.dataSource = self;
    testbar.delegate =self;
    
    tableView.backgroundColor = [UIColor whiteColor];
    
    // add to canvas
    [self.view addSubview:tableView];
    
    
    
    //[[self tableView] setTableHeaderView:testbar];
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    if(!isFilltered)
        return _data.count;
    else
        return filteredTableViewData.count;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if(!isFilltered){
    
    static NSString *cellIdentifier = @"ImageCell";
    
    // Similar to UITableViewCell, but
    TableViewCell *cell = (TableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    ImagesModel *imageModel =[ImageArray objectAtIndex:indexPath.row];
    
    //username
    cell.labelUserName.text = imageModel.user.username;
    
    //pulised_image
    cell.publishedImage.image=imageModel.publised_image;
    
    //profile image
    cell.profileImage.image=imageModel.user.profile_image;
    
    //created_time
    
    cell.labelPublisedTime.text=imageModel.created_time;
    
        
        return cell;
        
    }else
        
    {
    
        static NSString *cellIdentifier = @"Filtercell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
        }
        cell.textLabel.text=[[filteredTableViewData objectAtIndex:indexPath.row] objectForKey:@"name"];

        return cell;
    }
    
    
    
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    if(!isFilltered)
        return 400.0;
    else
        return 25;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)getPublicPhotos{
    
    ExApiMedia * mediaApi = [ExApiMedia new];
    ExApiGetPublicPhotosRequestModel * request = [ExApiGetPublicPhotosRequestModel new];
    
    [mediaApi GetPublicPhotos:request GetPublicPhotosCompleted:^(int status, ExApiGetPublicPhotosResponseModel *response, NSError *err) {
        
        
        _data = [[NSMutableArray alloc] initWithArray:response.data];
        
        [self loadImages:_data];
        
        
        
        //loadImages
        
        
    } ShowServiceError:YES];
    
}



-(UITableView *)tableView{
    if(!tableView){
    
        tableView = [UITableView new];
        [tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    }
    
        return tableView;
   
}

-(void)loadImages:(NSArray *)data {

    ImageArray = [[NSMutableArray alloc] init];
    
    
    
    
    for (int i=0; i<data.count; i++) {
        
        
        
        ImagesModel *image = [[ImagesModel alloc] init];
        
        _data1 = [_data objectAtIndex:i];
        
        //Image
        NSDictionary *images=[_data1 objectForKey:@"images"];
        NSDictionary *standard = [images objectForKey:@"standard_resolution"];
        NSString *image_url = [standard objectForKey:@"url"];

        //publised_image
        NSURL *url = [NSURL URLWithString:image_url];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        
        

        
        //User
        NSDictionary *user=[_data1 objectForKey:@"user"];
        NSString *profile_picture_url = [user objectForKey:@"profile_picture"];
        NSString *username = [user objectForKey:@"username"];
        NSString *created_time = [_data1 objectForKey:@"created_time"];
        
        //profile_image
        NSURL *profile_image_url = [NSURL URLWithString:profile_picture_url];
        NSData *profile_image_data = [NSData dataWithContentsOfURL:profile_image_url];
        UIImage *profile_img = [[UIImage alloc] initWithData:profile_image_data];

        UserModel *userModel = [[UserModel alloc] init];
        userModel.username = username;
        userModel.profile_image =profile_img;
        
        image.publised_image = img;
        image.created_time=created_time;
        image.user = userModel;
        image.user.profile_image=profile_img;
        
        
        
        [ImageArray addObject:image];;
        
    }
    

    [tableView reloadData];
    
}






-(void)searchTags:tagKey{

    
    ExApiTag * tagApi = [ExApiTag new];
    searchTagRequestModel * request = [searchTagRequestModel new];
    
    request.q=tagKey;
    request.client_id=@"029a204b95604a2981f7ddde6ea6dc0c";
    
    [tagApi searchTags:request searchTagCompleted:^(int status, searchTagResponseModel *response, NSError *err) {
        
        filteredTableViewData=response.data;
        [tableView reloadData];
        
    } ShowServiceError:YES];
    

}



 - (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
 {
 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchText];
 //    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"contains[c] %@", searchText];
 searchResults = [self.filteredTableViewData filteredArrayUsingPredicate:predicate];
 }
 

/*

-(BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[UISearchController.SEA scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}
*/

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [tableView resignFirstResponder];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if(searchText.length <=3)
    {
        isFilltered = NO;
    }else
    {
        isFilltered = YES;

        [self searchTags:searchText];
        
    }
    [tableView reloadData];
}




@end
