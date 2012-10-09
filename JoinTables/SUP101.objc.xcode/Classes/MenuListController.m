/*
 
 Copyright (c) Sybase, Inc. 2012   All rights reserved.
 
 In addition to the license terms set out in the Sybase License Agreement for
 the Sybase Unwired Platform (Program), the following additional or different
 rights and accompanying obligations and restrictions shall apply to the source
 code in this file (Code).  Sybase grants you a limited, non-exclusive,
 non-transferable, revocable license to use, reproduce, and modify the Code
 solely for purposes of (i) maintaining the Code as reference material to better
 understand the operation of the Program, and (ii) development and testing of
 applications created in connection with your licensed use of the Program.
 The Code may not be transferred, sold, assigned, sublicensed or otherwise
 conveyed (whether by operation of law or otherwise) to another party without
 Sybase's prior written consent.  The following provisions shall apply to any
 modifications you make to the Code: (i) Sybase will not provide any maintenance
 or support for modified Code or problems that result from use of modified Code;
 (ii) Sybase expressly disclaims any warranties and conditions, express or
 implied, relating to modified Code or any problems that result from use of the
 modified Code; (iii) SYBASE SHALL NOT BE LIABLE FOR ANY LOSS OR DAMAGE RELATING
 TO MODIFICATIONS MADE TO THE CODE OR FOR ANY DAMAGES RESULTING FROM USE OF THE
 MODIFIED CODE, INCLUDING, WITHOUT LIMITATION, ANY INACCURACY OF DATA, LOSS OF
 PROFITS OR DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES, EVEN
 IF SYBASE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES; (iv) you agree
 to indemnify, hold harmless, and defend Sybase from and against any claims or
 lawsuits, including attorney's fees, that arise from or are related to the
 modified Code or from use of the modified Code.
 
 */

#import "MenuListController.h"
#import "Sup101AppDelegate.h"
#import "SUPAttributeTest.h"
#import "SUPQuery.h"
#import "SUP101SUP101DB.h"
#import "SUPDataValue.h"
#import "SUPDataValueList.h"

@implementation MenuListController

@synthesize listController;
@synthesize menuList;
@synthesize detailController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Menu";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setMenuList:[NSArray arrayWithObjects:@"List",@"Create",@"Find By PrimaryKey", @"join two tables", @"join three tables", nil]];
    
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    int count = 0;
    if (menuList) {
        count = [menuList count];
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSUInteger row = [indexPath row];
    cell.textLabel.text = (NSString*)[menuList objectAtIndex:row];
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    switch ([indexPath row]) {
        case 0:
            listController = [[CustomerListController alloc] initWithStyle:UITableViewStylePlain];
           // [listController setFindByPrimaryKey:false];
            [self.navigationController pushViewController:listController animated:YES];
            [listController release];
            
            break;
        case 1:
            if (detailController == nil)
                detailController = [[DetailController alloc] 
                                   initWithNibName:@"CustomerDetail" bundle:nil];
            detailController.originalObj = nil;
            
            Sup101AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
            [delegate.navController pushViewController:detailController animated:YES];
            break;           
        case 2:
            listController = [[CustomerListController alloc] initWithStyle:UITableViewStylePlain];
            [listController setFindByPrimaryKey:true];
            [self.navigationController pushViewController:listController animated:YES];
            [listController release];
            break; 
        case 3:
            [self joinTwoTables];
            break;
        case 4:
            [self joinThreeTables];
            break;
        default:
            break;
    }

        
     
}

- (void)joinTwoTables {
    SUPQuery *query = [SUPQuery getInstance];
    [query select:@"c.fname,c.lname,s.order_date,s.region"];
//    [query select:@"c.fname,c.lname"];
    [query from:@"Customer":@"c"];
    [query join:@"Sales_order":@"s":@"s.cust_id":@"c.id"];
    query.testCriteria = [SUPAttributeTest match:@"c.lname":@"Devlin"];
    SUPQueryResultSet* resultSet = [SUP101SUP101DB executeQuery:query];
    if(resultSet == nil)
    {
        MBOLog(@"executeQuery Failed !!");
        return;
    }
    for(SUPDataValueList* result in resultSet)
    {
        MBOLog(@"Firstname,lastname,order date,region = %@ %@ %@ %@",
               [SUPDataValue getNullableString:[result item:0]],
               [SUPDataValue getNullableString:[result item:1]],
               [[SUPDataValue getNullableDate:[result item:2]] description],
               [SUPDataValue getNullableString:[result item:3]]);
    }
    
}

- (void)joinThreeTables{
    
    SUPQuery *query = [SUPQuery getInstance];
    [query select:@"c.fname,c.lname,s.order_date,s.region, i.quantity"];
    //    [query select:@"c.fname,c.lname"];
    [query from:@"Customer":@"c"];
    [query join:@"Sales_order":@"s":@"s.cust_id":@"c.id"];
    [query join:@"Sales_order_items":@"i":@"s.id":@"i.id"];
    query.testCriteria = [SUPAttributeTest match:@"c.lname":@"Devlin"];
    SUPQueryResultSet* resultSet = [SUP101SUP101DB executeQuery:query];
    if(resultSet == nil)
    {
        MBOLog(@"executeQuery Failed !!");
        return;
    }
    for(SUPDataValueList* result in resultSet)
    {
        MBOLog(@"Firstname,lastname,order date,region = %@ %@ %@ %@ %d",
               [SUPDataValue getNullableString:[result item:0]],
               [SUPDataValue getNullableString:[result item:1]],
               [[SUPDataValue getNullableDate:[result item:2]] description],
               [SUPDataValue getNullableString:[result item:3]],
               [SUPDataValue getInt:[result item:4]]);
    }
}

@end
