//
//  TableViewController.m
//  XLogo
//
//  Created by GnuHua on 15/3/22.
//  Copyright (c) 2015年 jiaxianhua. All rights reserved.
//

#import "TableViewController.h"
#import "LogoDocument.h"

@interface TableViewController ()
@property (nonatomic) NSArray *names;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _simples = [NSMutableArray array];
    
    NSString *resourcePath;
    NSError *error=nil;
    NSString *str;
    
    _names = @[
               @"The 'Sample.xlogo' file, fixed color for 256 colors:",
               @"# Prettier sample with 7 turtles...",
               @"#Some silly stuff... A quick little colorful demo...",
               @"#Repeat creating turtles test...",
               @"#Not possible yet:",
               @"#Another colorful test. ",
               @"#Demo of how slow NSBezierPath is for the drawing...",
               @"An optimized version of the above sample; the lines are also shorter, which makes the output prettier:",
               @"#Turtle race by Lasse...",
               @" nice quickie:",
               @"#Another quickie:",
               @"#Uhm, one more, this time for testing line width :)",
               @"23 Star",
               @"Square",
               ];
    
    for (int i = 0; i < _names.count; ++i) {
        resourcePath =[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d", i] ofType:@"txt"];
        str = [NSString stringWithContentsOfFile:resourcePath encoding:NSUTF8StringEncoding error:&error];
        
        [_simples addObject:str];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _simples.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _names[indexPath.row]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    LogoDocument *logoDocument = segue.destinationViewController;
    logoDocument.code = _simples[indexPath.row];
}


@end
