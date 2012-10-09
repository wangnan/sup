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

#import "DetailController.h"
#import "SUP101SUP101DB.h"
#import "CallbackHandler.h"
#import "SUP101KeyGenerator.h"


@interface DetailController (hidden)

- (void)setupNotification;
@end


@implementation DetailController
@synthesize fname, lname, phone, originalObj, submitButton, deleteButton,label,callbackHandler;
//@synthesize address,city,state,zip,;




- (void) reeplaySuccess:(NSNotification *)notification
{
    // 'replay success' means the server accepted the changes. Refresh
    // the in-memory object so it's in sync with the local database,
    // and re-enable the submit button so additional changes can be made.
    // In case of delete operation bo back to the previous screen
    // Remove observer
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ON_REPLAY_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ON_REPLAY_FAILURE object:nil];
    
    SUP101Customer *successObj = (SUP101Customer *)[notification object];
    if (successObj.id_ == self.originalObj.id_) {
 
        [self.originalObj refresh];
        self.submitButton.enabled = YES;
        [label setText:@"done"];
    }
    else if(successObj.id_ == 0)
    {        
        if(deleteRecord)
        {
            deleteRecord = NO;
            self.deleteButton.enabled = YES;
            [[self navigationController] popViewControllerAnimated:TRUE];
        }
    }
}

- (void) reeplayFailure:(NSNotification *)notification
{
    // 'replay failure' means the server rejected the changes. Refresh
    // the object from the local database and restore the text fields,
    // and re-enable the submit button so additional changes can be made.
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ON_REPLAY_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ON_REPLAY_FAILURE object:nil];
    
    SUP101Customer *failedObj = (SUP101Customer *)[notification object];
    if (failedObj.id_ == self.originalObj.id_) {

        [self.originalObj refresh];
        fname.text = originalObj.fname;
        lname.text = originalObj.lname;
        phone.text = originalObj.phone;
        self.submitButton.enabled = YES;
    }
    else if(failedObj.id_ == 0)
    {        
        if(deleteRecord)
        {
            deleteRecord = NO;
            [label setText:@"failed to delete record"];
            self.deleteButton.enabled = YES;
        }
        
        
    }

}



- (IBAction)buttonPressed:(id)sender
{
    
    
    [self keyBoardOff];
    if(sender == submitButton)
    {
        [self setupNotification];
        deleteRecord = NO;
        
        // for update
        if(originalObj)
        {
            self.originalObj.id_ = [originalObj id_];
            
            if (([lname.text compare:originalObj.fname] != NSOrderedSame) ||
            ([fname.text compare:originalObj.lname] != NSOrderedSame) || 
            ([phone.text compare:originalObj.phone] != NSOrderedSame))
            {
                @try {
                    SUP101Customer *newCustomer = [SUP101Customer find:[originalObj _pk]];
                    if (newCustomer) {
                        newCustomer.lname = lname.text;
                        newCustomer.fname = fname.text;
                        newCustomer.phone = phone.text;
                        // After saving changes and sending them to the server
                        // disable the 'submit' button so the object won't be changed
                        // while there are pending changes.
                        [newCustomer save];
                        [newCustomer submitPending];
                        
                        [sender setEnabled:NO];
                        [label setText:@"updating record..."];
                        
                        [SUP101SUP101DB synchronize];

                    }                    
                }
                @catch (NSException *exception) {
                    [label setText:@"FAILED: updating record"];
                    NSLog(@"%@: %@", [exception name],[exception reason]);
                    return;
                }
            }
        }
        else // for create
        {
            if (([lname text] != nil) ||
                ([fname text] != nil) || 
                ([phone text] != nil))
            {                
                @try {
                    SUP101Customer *newCustomer = [SUP101Customer getInstance];
                    [newCustomer setId_:[SUP101KeyGenerator generateId]];
                    [newCustomer setFname:fname.text];
                    [newCustomer setLname:lname.text];
                    [newCustomer setPhone:phone.text];
                    
                    // we need to fill out these fields for create to work. These are required fields. 
                    // sinc once the keyboard comes up in the ui, it hids these fields, for now hiding these fields
                    // and manually populating these fields while creating new records. need to scroll the view out of the
                    // keyboard.

                    [newCustomer setAddress:[NSString stringWithFormat:@"sample %@",[[NSDate date] description]]];
                    
                    // since these are required fields, manually generating them with data. 
                    // these should also be coming from ui form
                    [newCustomer setCity: @"Dublin"];
                    [newCustomer setState: @"CA"];
                    [newCustomer setZip: @"94568"];
                    
                    [newCustomer create];
                    
                    self.originalObj = [SUP101Customer getInstance];
                    self.originalObj.id_ = [newCustomer id_];
                    
                    [newCustomer submitPending];
                    
                    [sender setEnabled:NO];
                    [label setText:@"creating record..."];
                    
                    [SUP101SUP101DB synchronize];

                }
                @catch (NSException *exception) {
                    [label setText:@"FAILED: creating new record"];
                    NSLog(@"%@: %@", [exception name],[exception reason]);
                    return;
                }
            }

        }
        
    }
    else if( sender == deleteButton)
    {
        [self setupNotification];
        deleteRecord = YES;
        [label setText:@"deleting record..."];
        
        @try {
            SUP101Customer *newCustomer = [SUP101Customer find:[originalObj _pk]];
            
            self.originalObj.id_ = [newCustomer id_];
            
            [newCustomer delete];
            [newCustomer submitPending];
            [sender setEnabled:NO];
        
            [SUP101SUP101DB synchronize];
            
        }
        @catch (NSException *exception) {
            [label setText:@"unable to delete record"];
            NSLog(@"%@: %@", [exception name], [exception reason]);
        }
       
    }
}

- (void)setupNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reeplaySuccess:) name:ON_REPLAY_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reeplayFailure:) name:ON_REPLAY_FAILURE object:nil];
    
    CallbackHandler *ch = [CallbackHandler getInstance];
    [self setCallbackHandler:ch];
    
    [SUP101SUP101DB registerCallbackHandler:[self callbackHandler]];
    deleteRecord = NO;
    

}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated {
    
        
    // update
    if(originalObj)
    {
        [submitButton setEnabled:YES];
        [deleteButton setEnabled:YES];
        [submitButton setTitle:@"Update" forState:UIControlStateNormal];
        
        fname.text = originalObj.fname;
        lname.text = originalObj.lname;
        phone.text = originalObj.phone;
    }
    else // create
    {
        [self cleanForm];
        [deleteButton setHidden:TRUE];
        [submitButton setEnabled:YES];
        [submitButton setTitle:@"Create" forState:UIControlStateNormal];
        
    }  

    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

 
-(IBAction) keyBoardOff : (id) sender{
    [sender resignFirstResponder];

}

-(void)cleanForm
{
    [fname setText:@""];
    [lname setText:@""];
    [phone setText:@""];

}


-(void)keyBoardOff
{
    [fname resignFirstResponder];
    [lname resignFirstResponder];
    [phone resignFirstResponder];

     
}

- (void)dealloc {
    self.originalObj = nil;    
    [super dealloc];
}


@end
