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
#import "CustomerListController.h"
#import "Sup101AppDelegate.h"
#import "DetailController.h"

#import "SUP101Customer.h"


@implementation CustomerListController
@synthesize customerList, childController, findByPrimaryKey;




-(id) initWithStyle:(UITableViewStyle)style
{
    [self setFindByPrimaryKey:false];
    return [super initWithStyle:style];
    
}


- (void)viewWillAppear:(BOOL)animated {

    self.title = @"Customers";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    SUP101CustomerList *customers = [SUP101Customer findAll];
    if ([customers length] > 0)
    {
        for (SUP101Customer * oneRec in customers)
        {
            [array addObject:oneRec];
        }
    }
    
    if (findByPrimaryKey) {
        SUP101Customer* cus = [array objectAtIndex:0];
        @try {
            SUP101Customer* customer = [SUP101Customer findByPrimaryKey:[cus id_]];
            if (customer) {
                NSLog(@"fname: %@", [customer fname]);
                customerList = [[NSArray alloc]initWithObjects:customer, nil]; //[NSArray arrayWithObject:customer];
            }
        }
        @catch (NSException *exception) {
            NSLog(@"%@: %@",[exception name],[exception reason]);
        }
    }
    else
    {
        
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"fname"
                                                      ascending:YES] autorelease];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray *sortedArray;
        sortedArray = [array sortedArrayUsingDescriptors:sortDescriptors];
        
        self.customerList = sortedArray;
    }

    [array release];
    [[self tableView] reloadData];
    [super viewWillAppear:animated];    
}



/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.customerList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	NSUInteger row = [indexPath row];
    SUP101Customer *customer = [customerList objectAtIndex:row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@%@%@", [customer fname], @" ", [customer lname]];
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];    
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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
/*
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDisclosureIndicator;
}
*/
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	if (childController == nil)
		childController = [[DetailController alloc] 
						   initWithNibName:@"CustomerDetail" bundle:nil];
	
	NSUInteger row = [indexPath row];
	
	SUP101Customer *selectedCustomer = [customerList objectAtIndex:row];
	childController.title = [NSString stringWithFormat:@"%d", [selectedCustomer _pk]];
    childController.originalObj = selectedCustomer;
    
	Sup101AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	[delegate.navController pushViewController:childController animated:YES];
	
}


- (void)dealloc {
    self.customerList = nil;
    self.childController = nil;
    [super dealloc];
}


@end

