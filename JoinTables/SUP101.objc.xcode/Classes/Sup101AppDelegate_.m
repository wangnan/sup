/*
 
 Copyright (c) Sybase, Inc. 2010   All rights reserved.
 
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


#import "Sup101AppDelegate.h"
#import "SUP101SUP101DB.h"
#import "CallbackHandler.h"
#import "SUPApplication.h"

@implementation Sup101AppDelegate

@synthesize window, navController, connectStartTime, callbackHandler;

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    exit (0);
}

- (void)showNoTransportAlert:(NSInteger) ret
{
    NSString *message = nil;
    
    UIAlertView * noTransportAlert = [[UIAlertView alloc] initWithTitle:@"Unable to start message server" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [noTransportAlert performSelectorOnMainThread:@selector(show) withObject:self waitUntilDone:YES];
    [noTransportAlert release];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

 
    [MBOLogger setLogLevel:LOG_INFO];
    
    // Initialize Application settings
    SUPApplication* app = [SUPApplication getInstance];
    app.applicationIdentifier = @"SUP101";
    
    @try {
        
        if ([SUPApplication registrationStatus] != SUPRegistrationStatus_REGISTERED && 
            [SUPApplication registrationStatus] != SUPRegistrationStatus_REGISTERING ) 
        {
            SUPConnectionProperties* props = app.connectionProperties;
            [props setServerName:@"nrezaxp-vm5"];
            [props setPortNumber:5001];
            [props setUrlSuffix:@""];
            [props setFarmId:@"0"];
            SUPLoginCredentials* login = [SUPLoginCredentials getInstance];
            login.username = @"sup101";
            login.password = nil;
            props.loginCredentials = login;
            props.activationCode = @"123";
            
        }
    }
    @catch (SUPPersistenceException * pe) {
        NSLog(@"%@: %@", [pe name],[pe message]);
    }
    
    SUPConnectionProfile *cp = [SUP101SUP101DB getConnectionProfile];
    [cp enableTrace:YES];
    
    
    // Normally you would not delete the local database. But for this sample application
    // we will delete and create an empty database. Later the first synchronization will 
    // bring down data from server
    
    if ([SUP101SUP101DB databaseExists])
    {
        [SUP101SUP101DB deleteDatabase];
    }
    [SUP101SUP101DB createDatabase];
    
    
    CallbackHandler* databaseCH = (CallbackHandler*)[CallbackHandler getInstance];
    [SUP101SUP101DB registerCallbackHandler:databaseCH];
    
    // Initialize generated package database class with this Application instance
    [SUP101SUP101DB setApplication:app];
    
    @try {
        [app registerApplication:0]; 
    }
    @catch (NSException *exception) {
        NSLog(@"%@: %@",[exception name],[exception reason]);
    }
    
    
    
    // make sure connection established
    while ([SUPApplication connectionStatus] != SUPConnectionStatus_CONNECTED) {
        NSLog(@"waiting to connect...");
        sleep(2);
    }
    
    NSLog(@"connection established");
    
    while ([SUPApplication registrationStatus] != SUPRegistrationStatus_REGISTERED) {
        NSLog(@"waiting to register...");
        sleep(2);
    }
    
    NSLog(@"registration completed");
        
    // subscribe to database:
    // make sure the databse connection profile has correct username and password
    SUPConnectionProfile *sp = [SUP101SUP101DB getSynchronizationProfile];
    // by default the AsyncReplay is enabled. We will turn it off. This will make the next syncrhonization a blocking call.
    // to make the 
    [sp setAsyncReplay:NO];
    [sp setUser:@"supAdmin"];
    [sp setPassword:@"s3pAdmin"];
    
    
    @try {
        [SUP101SUP101DB subscribe]; 
    }
    @catch (NSException *exception) {
        MBOLogError(@"%@: %@", [exception name], [exception reason]);
    }
    

    // Create the main UI for the application. We will update it as we receive messages from the server.
    [window addSubview:navController.view];
    [window makeKeyAndVisible];
 
}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

- (void)dealloc {
    self.navController = nil;
    self.window = nil;
    self.callbackHandler = nil;
    self.connectStartTime = nil;
    
    [super dealloc];
}

@end
