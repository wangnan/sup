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

#import "SubscribeController.h"
#import "SUP101SUP101DB.h"
#import "CallbackHandler.h"
#import "Sup101AppDelegate.h"
#import "SUPSyncStatusInfo.h"

@implementation SubscribeController

@synthesize button, menuController;

- (void) showListController {
    Sup101AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	//[delegate.navController pushViewController:self.listController animated:YES];
    [delegate.navController pushViewController:self.menuController animated:YES];
}


- (IBAction)buttonPressed:(id)sender
{
    if (self.menuController != nil) {
        [self showListController];
    } else {
        @try {
            
            // [SUP101SUP101DB synchronize] will be a blocking call. So using a non blocking call. 
            // we cna track the sync status thrgouh onGetSyncStatusChange from SUPSyncStatusListener protocol.
            // this way we are not blocking the UI thread
            [SUP101SUP101DB  synchronizeWithListener:self];
        }
        @catch (NSException *exception) {
            MBOLogError(@"%@: %@", [exception name], [exception reason]);
        }
    }
}

-(void) onGetSyncStatusChange:(SUPSyncStatusInfo*)info
{
    switch(info.state)
    {     
        case SYNC_STATE_NONE:
            MBOLogDebug(@"SYNC_STATE_NONE");
            break;
        case SYNC_STATE_STARTING:
            MBOLogDebug(@"SYNC_STATE_STARTING");
            break;
        case SYNC_STATE_CONNECTING:
            MBOLogDebug(@"SYNC_STATE_CONNECTING");
            break;
        case SYNC_STATE_SENDING_HEADER:
            MBOLogDebug(@"SYNC_STATE_SENDING_HEADER");
            break;
        case SYNC_STATE_SENDING_TABLE:
            MBOLogDebug(@"SYNC_STATE_SENDING_TABLE");
            break;
        case SYNC_STATE_SENDING_DATA:
            MBOLogDebug(@"SYNC_STATE_SENDING_DATA");
            break;
        case SYNC_STATE_FINISHING_UPLOAD:
            MBOLogDebug(@"SYNC_STATE_FINISHING_UPLOAD");
            break;
        case SYNC_STATE_RECEIVING_UPLOAD_ACK:
            MBOLogDebug(@"SYNC_STATE_RECEIVING_UPLOAD_ACK");
            break;
        case SYNC_STATE_RECEIVING_TABLE:
            MBOLogDebug(@"SYNC_STATE_RECEIVING_TABLE");
            break;
        case SYNC_STATE_RECEIVING_DATA:
            MBOLogDebug(@"SYNC_STATE_RECEIVING_DATA");
            break;
        case SYNC_STATE_COMMITTING_DOWNLOAD:
            MBOLogDebug(@"SYNC_STATE_COMMITTING_DOWNLOAD");
            break;
        case SYNC_STATE_SENDING_DOWNLOAD_ACK:
            MBOLogDebug(@"SYNC_STATE_SENDING_DOWNLOAD_ACK");
            break;
        case SYNC_STATE_DISCONNECTING:
            MBOLogDebug(@"SYNC_STATE_DISCONNECTING");
            break;
        case SYNC_STATE_DONE:
            MBOLogDebug(@"SYNC_STATE_DONE");
            self.menuController = [[MenuListController alloc] initWithStyle:UITableViewStylePlain];
            [self showListController];
            break;           
        case SYNC_STATE_ERROR:
            MBOLogDebug(@"SYNC_STATE_ERROR");
            break;
        case SYNC_STATE_ROLLING_BACK_DOWNLOAD:
            MBOLogDebug(@"SYNC_STATE_ROLLING_BACK_DOWNLOAD");
            break;
        case SYNC_STATE_UNKNOWN:
            MBOLogDebug(@"SYNC_STATE_UNKNOWN");
            break;
        default:
            MBOLogDebug(@"DEFAULT");
            break;       
            
            
            
            
            
    }
}

- (void)onLoginSuccess:(NSNotification *)notification {
    self.button.enabled = YES;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ON_LOGIN_SUCCESS object:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.button.enabled = NO;
    if (self.menuController == nil) {
        // The application cannot subscribe to data updates until login has completed. Wait for an ON_LOGIN_SUCCESS notification
        // to arrive before enabling the 'Subscribe' button
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onLoginSuccess:) name:ON_LOGIN_SUCCESS object:nil];

    } else {
        // Already subscribed, and a list controller has been created. Just show it again.
        [self.button setTitle:@"Show List" forState:UIControlStateNormal];
        self.button.enabled = YES;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    self.title = @"Synchronize";
    [super viewDidLoad];
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


- (void)dealloc {
    self.menuController = nil;
    [super dealloc];
}


@end
