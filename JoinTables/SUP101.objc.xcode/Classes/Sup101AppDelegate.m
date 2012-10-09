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
//
//  Sup101AppDelegate.m
//  Sup101
//
//  Created by Jane Yang on 5/10/10.
//  Copyright Sybase, Inc. 2012. All rights reserved.
//

#import "Sup101AppDelegate.h"
#import "SUPApplication.h"
#import "SUPApplicationCallback.h"
#import "SUPRegistrationStatus.h"

#import "SUP101SUP101DB.h"
#import "CallbackHandler.h"
#import "SUPEngine.h"
#import "SUPDataVault.h"
#import "SUPConnectionProfile.h"
#import "SUP101LocalKeyGenerator.h"

#define kSUP101DataVaultID @"SUP101DataVaultID"
#define kSUP101DataVaultSalt @"SUP101DataVaultSalt"

#define kSUP101ErrorBadPin -11111
#define kSUP101ErrorNoSettings -11112
#define kSUP101ErrorKeyNotAvailable -11113
#define kSUP101ErrorFailure -11114



@implementation Sup101AppDelegate

@synthesize window, navController, connectStartTime, callbackHandler, firstrun, pin;

@synthesize passwordAlert, noTransportAlert;

@synthesize PINField, SUPPasswordField;

@synthesize SUPServerName, SUPServerPort, SUPUserName, SUPConnectionName, SUPPassword, SUPFarmID, SUPActivationCode, SUPManualRegistration;


- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(actionSheet == self.noTransportAlert)
    {
        
    }else
    {
        if(buttonIndex == 1)
        {
            self.pin = [NSString stringWithString:self.PINField.text];
            if(self.firstrun)
                self.SUPPassword = [NSString stringWithString:self.SUPPasswordField.text];
            [self initializeSUP101];
        }
    }
}

- (id)init
{
    [super init];
    self.passwordAlert = nil;
    self.noTransportAlert = nil;
    return self;
}

- (void)showNoTransportAlert:(NSInteger) ret
{
    NSString *message = nil;
    
    if (ret == kSUP101ErrorNoSettings) {
        message = @"The connection settings have not been filled in for this application. Go to Settings, enter the connection information, and restart this app.";
    } else if (ret == kSUP101ErrorKeyNotAvailable) {
        message = @"Unable to access the key.";
    } else if (ret == kSUP101ErrorBadPin) {
        message = @"Incorrect PIN entered.";
    } else {
        message = @"An error occurred attempting to log in.";
    }
    
    self.noTransportAlert = [[UIAlertView alloc] initWithTitle:@"Unable to start message server" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [self.noTransportAlert performSelectorOnMainThread:@selector(show) withObject:self waitUntilDone:YES];
    [self.noTransportAlert release];
}

- (void)showPasswordDialog
{
    NSString *message = nil;
    if(self.firstrun)
        message = @"Create a new PIN:";
    else
        message = @"Enter your PIN to unlock:";
    
    self.passwordAlert = [[UIAlertView alloc] initWithTitle:@"SUP101" 
                                                            message:@"\n\n\n\n"
                                                           delegate:self 
                                                  cancelButtonTitle:NSLocalizedString(@"Cancel",nil) 
                                                  otherButtonTitles:NSLocalizedString(@"OK",nil), nil];
    
    float y = 30;
    
    UILabel *PINFieldLabel = [[UILabel alloc] initWithFrame:CGRectMake(12,y,260,23)];
    PINFieldLabel.font = [UIFont systemFontOfSize:16];
    PINFieldLabel.textColor = [UIColor whiteColor];
    PINFieldLabel.backgroundColor = [UIColor clearColor];
    PINFieldLabel.shadowColor = [UIColor blackColor];
    PINFieldLabel.shadowOffset = CGSizeMake(0,-1);
    PINFieldLabel.textAlignment = UITextAlignmentCenter;
    PINFieldLabel.text = message;
    [passwordAlert addSubview:PINFieldLabel];
    
    y += 25;
    
    PINField = [[UITextField alloc] initWithFrame:CGRectMake(16,y,252,23)];
    PINField.font = [UIFont systemFontOfSize:16];
    PINField.backgroundColor = [UIColor whiteColor];
    PINField.secureTextEntry = YES;
    PINField.keyboardAppearance = UIKeyboardAppearanceAlert;
    
    [PINField becomeFirstResponder];
    [passwordAlert addSubview:PINField];
    
    UILabel *SUPPasswordFieldLabel;
    
    if(self.firstrun)
    {
        
        y += 25;

        SUPPasswordFieldLabel = [[UILabel alloc] initWithFrame:CGRectMake(12,y,260,23)];
        SUPPasswordFieldLabel.font = [UIFont systemFontOfSize:16];
        SUPPasswordFieldLabel.textColor = [UIColor whiteColor];
        SUPPasswordFieldLabel.backgroundColor = [UIColor clearColor];
        SUPPasswordFieldLabel.shadowColor = [UIColor blackColor];
        SUPPasswordFieldLabel.shadowOffset = CGSizeMake(0,-1);
        SUPPasswordFieldLabel.textAlignment = UITextAlignmentCenter;
        SUPPasswordFieldLabel.text = @"Enter your SUP password:";
        [passwordAlert addSubview:SUPPasswordFieldLabel];
        
        y += 25;
        
        SUPPasswordField = [[UITextField alloc] initWithFrame:CGRectMake(16,y,252,23)];
        SUPPasswordField.font = [UIFont systemFontOfSize:16];
        SUPPasswordField.backgroundColor = [UIColor whiteColor];
        SUPPasswordField.secureTextEntry = YES;
        SUPPasswordField.keyboardAppearance = UIKeyboardAppearanceAlert;
        
        //[SUPPasswordField becomeFirstResponder];
        [passwordAlert addSubview:SUPPasswordField];
        

    }
    [passwordAlert show];
    [passwordAlert release];
    [PINField release];
    [PINFieldLabel release];
    if(self.firstrun)
    {
        [SUPPasswordField release];
        [SUPPasswordFieldLabel release];
    }
}

- (BOOL)testForRequiredSettings
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
   
    
    
    self.SUPServerName = [defaults stringForKey:@"supservername_preference"];
    self.SUPServerPort = [defaults stringForKey:@"supserverport_preference"];
    if(self.SUPServerPort == nil)
        self.SUPServerPort = @"5001";
    
    self.SUPUserName = [defaults stringForKey:@"supusername_preference"];
    self.SUPFarmID = [defaults stringForKey:@"supfarmid_preference"];
    if(self.SUPFarmID == nil)
        self.SUPFarmID = @"0";
    
    self.SUPManualRegistration = [defaults boolForKey:@"manualregistration_preference"];
    if(self.SUPManualRegistration)
    {
        self.SUPConnectionName = [defaults stringForKey:@"connectionname_preference"];
        self.SUPActivationCode = [defaults stringForKey:@"activationcode_preference"];
    }
    self.SUPServerName = @"10.80.1.18";
    self.SUPServerPort = @"5001";
    self.SUPFarmID = @"0";
    self.SUPManualRegistration = false;
    self.SUPUserName = @"supAdmin";
    self.SUPPassword = @"s3pAdmin";
    
    if(self.SUPServerName == nil ||
       self.SUPUserName == nil ||
       self.SUPFarmID == nil)
    {
        [self showNoTransportAlert:kSUP101ErrorNoSettings];
        return NO;
    }
    
    if(self.SUPManualRegistration && (self.SUPConnectionName == nil || self.SUPActivationCode == nil))
    {
        [self showNoTransportAlert:kSUP101ErrorNoSettings];
        return NO;        
    }
    
    return YES;
}



-(void)onConnectSuccess:(NSNotification *)obj
{
    // Connection to the server was made, so log in.
    // See [CallbackHandler onLoginSuccess] and [CallbackHandler onLoginFailure]. One of those
    // callbacks will be called at some point in the future.
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ON_CONNECT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:ON_CONNECT_FAILURE object:nil];
    
    NSString *supuser = nil;
    NSString *suppass = nil;
    SUPDataVault *sup101vault = nil;
    @try {
        NSLog(@"Unlock SUP101 vault to get username/password credentials");
        sup101vault = [SUPDataVault getVault:kSUP101DataVaultID];
        [sup101vault unlock:self.pin withSalt:kSUP101DataVaultSalt];
        supuser = self.SUPUserName;
        suppass = [sup101vault getString:@"password"];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception unlocking messaging data vault: %@: %@",[exception name],[exception reason]);
        [self showNoTransportAlert:kSUP101ErrorKeyNotAvailable];
    }
    @finally {
        [sup101vault lock];
    }

        NSLog(@"Running for the first time: check authentication credentials with the server");

        // subscribe to database:
        // make sure the databse connection profile has correct username and password
        SUPConnectionProfile *sp = [SUP101SUP101DB getSynchronizationProfile];
        // by default the AsyncReplay is enabled. We will turn it off. This will make the next syncrhonization a blocking call.
        // to make the 
        [sp setAsyncReplay:NO];
        [sp setUser:supuser];
        [sp setPassword:suppass];
        [sp setServerName:self.SUPServerName];
        
    if(self.firstrun)
    {
        
        @try {
            [SUP101SUP101DB subscribe]; 
        }
        @catch (NSException *exception) {
            MBOLogError(@"%@: %@", [exception name], [exception reason]);
        }
        
    }
    else
    {
        NSLog(@"Application was run before -- set authentication credentials, no need to check with server");
        // Set the credentials in the synchronization profile by calling offlineLogin
        
        SUPConnectionProfile *sp = [SUP101SUP101DB getSynchronizationProfile];
        // by default the AsyncReplay is enabled. We will turn it off. This will make the next syncrhonization a blocking call.
        // to make the 
        [sp setAsyncReplay:NO];
        [sp setUser:supuser];
        [sp setPassword:suppass];

    }
    
    
    // send the notification , so that the UI enables the Subscribe button
    NSNotification *n = [NSNotification notificationWithName:ON_LOGIN_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:n];

    
    
}

-(void)onConnectFailure:(NSNotification *)obj
{
    // Once [SUPMessageClient start] is called, ON_CONNECT_FAILURE is sent from our callback handler
    // until the device is connected or something changes. If we haven't connected in 30 seconds, give up.
    NSDate *now = [NSDate date];
    if ([now timeIntervalSinceDate:self.connectStartTime] > 30) {
        [SUPApplication stopConnection:30];
        [self showNoTransportAlert:kSUP101ErrorFailure];
    }
}


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch

    if([self testForRequiredSettings])
    {
        
        // If messaging DB does not exist yet, we are running the app for the first time since installing it on the device
        self.firstrun = (![MessagingClientLib isMessagingDBExist]);
        
        [self showPasswordDialog];
        
        
    }
    
    // Create the main UI for the application. We will update it as we receive messages from the server.
    [window addSubview:navController.view];
    [window makeKeyAndVisible];
        


}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // In this example, because we delete and recreate the local database, we need to unsubscribe
    // and shut down the app when it is no longer active.  All data will be sent on next launch.
    [SUP101SUP101DB unsubscribe];
    [SUPApplication stopConnection:0];
}

- (void)initializeSUP101
{
    // Set log level (optional -- this will generate a lot of output in the debug console)
    [MBOLogger setLogLevel:LOG_INFO];

    SUPDataVault *sup101vault = nil;
    SUPDataVault *messagingvault = nil;

    if(self.firstrun)
    {
        NSLog(@"Running the app for the first time.");
        
        
        
        // If the application is being run for the first time, we do the following:
        //      1. Remove the messaging data vault created by earlier versions of the application, if it exists.
        //      2. Remove the SUP101 data vault created by earlier versions of the application, if it exists.
        //      3. Create the messaging vault using the PIN as the password, leaving it unlocked for use by the messaging layer.
        //      4. Create the SUP101 data vault using the PIN as the password, and store the SUP username/password credentials 
        //                  and a database encryption key in the vault.
        //      
        @try
        {  
            NSLog(@"Delete preexisting messaging vault");
            [SUPDataVault deleteVault:kMessagingDataVaultID];
        }
        @catch(NSException *e)
        {  
            // Ignore any exception
        }
        @try {
            NSLog(@"Delete preexisting SUP101 data vault");
            [SUPDataVault deleteVault:kSUP101DataVaultID];
        }
        @catch(NSException *e)
        {  
            // Ignore any exception
        }
        
        @try {
            NSLog(@"Create new SUP101 data vault and store credentials and a generated encryption key");
            sup101vault = [SUPDataVault createVault:kSUP101DataVaultID withPassword:self.pin withSalt:kSUP101DataVaultSalt]; // creates the vault
            [sup101vault setString:@"password" withValue:self.SUPPassword];
            [sup101vault lock];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception in creating new SUP101 data vault: %@: %@",[exception name], [exception reason]);
        }
        @try {
            NSLog(@"Create new messaging vault and leave it unlocked");
            messagingvault = [SUPDataVault createVault:kMessagingDataVaultID withPassword:self.pin withSalt:kDVStandardSalt];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception in creating new messaging data vault: %@: %@",[exception name], [exception reason]);                
        }

    }
    else
    {
        // If the application has been run before, we get the PIN from the user, and use it to unlock the existing messaging data vault
        // (otherwise the messaging layer cannot start).
        //
        //
        NSLog(@"App has been run before.");
        @try {
            NSLog(@"Unlock messaging vault");
            messagingvault = [SUPDataVault getVault:kMessagingDataVaultID];
            [messagingvault unlock:self.pin withSalt:kDVStandardSalt];
        }
        @catch (NSException *exception) {
            NSLog(@"Exception unlocking messaging data vault: %@: %@",[exception name],[exception reason]);
            [self showNoTransportAlert:kSUP101ErrorBadPin];
        }
        
    }

    // Start up the messaging client. This will attempt to connect to the server. If a connection was
    // established we can proceed with login. See onConnectFailure: for more information about handling connection failure.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectSuccess:) name:ON_CONNECT_SUCCESS object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onConnectFailure:) name:ON_CONNECT_FAILURE object:nil];
    self.connectStartTime = [NSDate date];
    SUPApplication* app = [SUPApplication getInstance];

    @try {
        sup101vault = [SUPDataVault getVault:kSUP101DataVaultID];
        [sup101vault unlock:self.pin withSalt:kSUP101DataVaultSalt];
        
        // make sure to have the applicationIdentifer same as the project name. This is case sensetive.
        app.applicationIdentifier = @"SUP101";
        CallbackHandler *ch = [CallbackHandler getInstance];
        [self setCallbackHandler:ch];
 
        [app setApplicationCallback:[self callbackHandler]];
        
        // Register a callback handler. This should be done before any other SUP code is called.
       // self.callbackHandler = [[CallbackHandler new] autorelease];
        [SUP101SUP101DB registerCallbackHandler:self.callbackHandler];
        
        
        SUPConnectionProperties* props = app.connectionProperties;
        [props setServerName:self.SUPServerName];
        [props setPortNumber:[self.SUPServerPort intValue]];
        [props setUrlSuffix:@""];
        [props setFarmId:self.SUPFarmID];
        
        SUPLoginCredentials* login = [SUPLoginCredentials getInstance];
        if(self.SUPManualRegistration)
        {
            login.username = self.SUPConnectionName;
            login.password = nil;
            props.activationCode = self.SUPActivationCode;
        }
        else
        {
            login.username = self.SUPUserName;
            login.password = [sup101vault getString:@"password"];   
            props.activationCode = nil;
        }
        props.loginCredentials = login;
        
        

        // Normally you would not delete the local database. For this simple example, though,
        // deleting and creating an empty database will cause all data to be sent from the
        // server, and we can use [CallbackHandler onImportSuccess:] to know when to proceed.        
        [SUP101SUP101DB deleteDatabase];
        [SUP101SUP101DB createDatabase];
        SUPConnectionProfile *cp = [SUP101SUP101DB getConnectionProfile];
        [cp.syncProfile setDomainName:@"default"];
        [cp enableTrace:NO];
        [cp.syncProfile enableTrace:YES];

        // Generate an encryption key for the database.
        [SUP101SUP101DB generateEncryptionKey];
        [SUP101SUP101DB closeConnection];
        // Store the encryption key in the data vault for future use.
        [sup101vault setString:@"encryptionkey" withValue:[cp getEncryptionKey]];
        
        // Since we are creating the database from scratch, we set the encryption key for the new database
        
        // If we were using the database from a previous run of the app and not creating it each time, an application should run the code below instead.
        // To successfully access a previously encrypted database, we set the key used by the connection profile.
        NSString *key = [sup101vault getString:@"encryptionkey"];
        NSLog(@"Got the encryption key: %@",key);
        [cp setEncryptionKey:key];
        [SUP101SUP101DB closeConnection];
        
        [SUP101SUP101DB setApplication:app];

        [app registerApplication:30];
        
        while([app registrationStatus] != SUPRegistrationStatus_REGISTERED)
        {
            NSLog(@"waiting for registration...");
            [NSThread sleepForTimeInterval:1.0];
        }
        while([app connectionStatus] != SUPConnectionStatus_CONNECTED)
        {
            NSLog(@"waiting for connection...");
            [NSThread sleepForTimeInterval:1.0];
        }

    }
    @catch (SUPPersistenceException * pe) {
        NSLog(@"%@: %@", [pe name],[pe message]);
        [self showNoTransportAlert:kSUP101ErrorFailure];
    }
    @finally 
    {
        [sup101vault lock];
    }



}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [SUP101SUP101DB unsubscribe];
    [SUPApplication stopConnection:0];
}



- (void)dealloc {
    self.navController = nil;
    self.window = nil;
    self.callbackHandler = nil;
    self.connectStartTime = nil;
    
    [super dealloc];
}

@end
