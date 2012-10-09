#import "SUP101SUP101DBMetaData.h"

#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "SUP101Customer.h"
#import "SUP101Sales_order.h"
#import "SUP101Sales_order_items.h"
#import "SUP101LogRecordImpl.h"
#import "SUP101OperationReplay.h"
#import "SUP101SISSubscriptionKey.h"
#import "SUP101SISSubscription.h"
#import "SUP101PackageProperties.h"
#import "SUP101ChangeLogKey.h"
#import "SUP101ChangeLogImpl.h"
#import "SUP101OfflineAuthentication.h"
#import "SUP101KeyPackageName.h"
#import "SUP101PersonalizationParameters.h"
#import "SUP101KeyGenerator.h"
#import "SUP101KeyGeneratorPK.h"
#import "SUP101LocalKeyGenerator.h"
#import "SUP101LocalKeyGeneratorPK.h"

@implementation SUP101SUP101DBMetaData

+ (SUP101SUP101DBMetaData*)getInstance
{
    return [[[SUP101SUP101DBMetaData alloc] init] autorelease];
}

- (id)init
{
    if (self = [super init]) {
		self.id = 0;
		self.databaseName = @"SUP101SUP101DB";
		self.packageName = @"SUP101";

		SUPObjectList *classList = [SUPObjectList listWithCapacity:18];
		[classList addThis:[SUP101Customer metaData]];
		[SUP101Customer delegate];
		[classList addThis:[SUP101Sales_order metaData]];
		[SUP101Sales_order delegate];
		[classList addThis:[SUP101Sales_order_items metaData]];
		[SUP101Sales_order_items delegate];
		[classList addThis:[SUP101LogRecordImpl metaData]];
		[SUP101LogRecordImpl delegate];
		[classList addThis:[SUP101OperationReplay metaData]];
		[SUP101OperationReplay delegate];
		[classList addThis:[SUP101SISSubscriptionKey metaData]];
		[SUP101SISSubscriptionKey delegate];
		[classList addThis:[SUP101SISSubscription metaData]];
		[SUP101SISSubscription delegate];
		[classList addThis:[SUP101PackageProperties metaData]];
		[SUP101PackageProperties delegate];
		[classList addThis:[SUP101ChangeLogKey metaData]];
		[SUP101ChangeLogKey delegate];
		[classList addThis:[SUP101ChangeLogImpl metaData]];
		[SUP101ChangeLogImpl delegate];
		[classList addThis:[SUP101OfflineAuthentication metaData]];
		[SUP101OfflineAuthentication delegate];
		[classList addThis:[SUP101KeyPackageName metaData]];
		[SUP101KeyPackageName delegate];
		[classList addThis:[SUP101PersonalizationParameters metaData]];
		[SUP101PersonalizationParameters delegate];
		[classList addThis:[SUP101KeyGenerator metaData]];
		[SUP101KeyGenerator delegate];
		[classList addThis:[SUP101KeyGeneratorPK metaData]];
		[SUP101KeyGeneratorPK delegate];
		[classList addThis:[SUP101LocalKeyGenerator metaData]];
		[SUP101LocalKeyGenerator delegate];
		[classList addThis:[SUP101LocalKeyGeneratorPK metaData]];
		[SUP101LocalKeyGeneratorPK delegate];
		self.classList = classList;
		SUPClassMap *classMap = [SUPClassMap getInstance];
		[classMap setClasses:classList];
		self.classMap = classMap;

		SUPObjectList *entityList = [SUPObjectList listWithCapacity:11];
		[entityList addThis:[SUP101Customer metaData]];
		[SUP101Customer delegate];
		[entityList addThis:[SUP101Sales_order metaData]];
		[SUP101Sales_order delegate];
		[entityList addThis:[SUP101Sales_order_items metaData]];
		[SUP101Sales_order_items delegate];
		[entityList addThis:[SUP101LogRecordImpl metaData]];
		[SUP101LogRecordImpl delegate];
		[entityList addThis:[SUP101OperationReplay metaData]];
		[SUP101OperationReplay delegate];
		[entityList addThis:[SUP101SISSubscription metaData]];
		[SUP101SISSubscription delegate];
		[entityList addThis:[SUP101PackageProperties metaData]];
		[SUP101PackageProperties delegate];
		[entityList addThis:[SUP101ChangeLogImpl metaData]];
		[SUP101ChangeLogImpl delegate];
		[entityList addThis:[SUP101OfflineAuthentication metaData]];
		[SUP101OfflineAuthentication delegate];
		[entityList addThis:[SUP101KeyGenerator metaData]];
		[SUP101KeyGenerator delegate];
		[entityList addThis:[SUP101LocalKeyGenerator metaData]];
		[SUP101LocalKeyGenerator delegate];
		self.entityList = entityList;
	    SUPEntityMap *entityMap = [SUPEntityMap getInstance];
    	[entityMap setEntities:entityList];
	    self.entityMap = entityMap;
		SUPObjectList *attributes = [SUPObjectList listWithCapacity:7];
		self.name = @"SUP101DB";
 
       	// Handle attributes
 		self.attributes = attributes;;
 		
 		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
    	[attributeMap setAttributes:attributes];
    	self.attributeMap = attributeMap;

 		// Handle operations
 		int operation_counter = 0;
 		operation_counter++;
 		SUPOperationMetaData* o_createDatabase_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"createDatabase":[SUPDataType forName:@"void"]:true];
 		[o_createDatabase_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_cleanAllData_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"cleanAllData":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_cleanAllData_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"boolean"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_cleanAllData_p0];
 			o_cleanAllData_1.parameters = parameters_list;
 		}
 		[o_cleanAllData_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_cleanAllData_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"cleanAllData":[SUPDataType forName:@"void"]:true];
 		[o_cleanAllData_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_getSyncUsername_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"getSyncUsername":[SUPDataType forName:@"string"]:true];
 		[o_getSyncUsername_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_loginToSync_2 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"loginToSync":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_loginToSync_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_counter++;
 			SUPParameterMetaData* p_loginToSync_p1 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p1":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_loginToSync_p0];
 			[parameters_list addThis:p_loginToSync_p1];
 			o_loginToSync_2.parameters = parameters_list;
 		}
 		[o_loginToSync_2 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_onlineLogin_2 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"onlineLogin":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_onlineLogin_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_counter++;
 			SUPParameterMetaData* p_onlineLogin_p1 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p1":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_onlineLogin_p0];
 			[parameters_list addThis:p_onlineLogin_p1];
 			o_onlineLogin_2.parameters = parameters_list;
 		}
 		[o_onlineLogin_2 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_offlineLogin_2 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"offlineLogin":[SUPDataType forName:@"boolean"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_offlineLogin_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_counter++;
 			SUPParameterMetaData* p_offlineLogin_p1 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p1":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_offlineLogin_p0];
 			[parameters_list addThis:p_offlineLogin_p1];
 			o_offlineLogin_2.parameters = parameters_list;
 		}
 		[o_offlineLogin_2 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_synchronize_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"synchronize":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_synchronize_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_synchronize_p0];
 			o_synchronize_1.parameters = parameters_list;
 		}
 		[o_synchronize_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_submitPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"submitPendingOperations":[SUPDataType forName:@"void"]:true];
 		[o_submitPendingOperations_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_synchronize_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"synchronize":[SUPDataType forName:@"void"]:true];
 		[o_synchronize_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_submitPendingOperations_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"submitPendingOperations":[SUPDataType forName:@"void"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_submitPendingOperations_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_submitPendingOperations_p0];
 			o_submitPendingOperations_1.parameters = parameters_list;
 		}
 		[o_submitPendingOperations_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_cancelPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"cancelPendingOperations":[SUPDataType forName:@"void"]:true];
 		[o_cancelPendingOperations_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_submitLogRecords_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"submitLogRecords":[SUPDataType forName:@"void"]:true];
 		[o_submitLogRecords_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_deleteDatabase_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"deleteDatabase":[SUPDataType forName:@"void"]:true];
 		[o_deleteDatabase_0 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_isSynchronized_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"isSynchronized":[SUPDataType forName:@"boolean"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_isSynchronized_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_isSynchronized_p0];
 			o_isSynchronized_1.parameters = parameters_list;
 		}
 		[o_isSynchronized_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_getLastSynchronizationTime_1 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"getLastSynchronizationTime":[SUPDataType forName:@"dateTime"]:true];
  		{
 			int parameters_counter=0;
 			SUPObjectList *parameters_list = nil;
 			parameters_counter++;
 			SUPParameterMetaData* p_getLastSynchronizationTime_p0 = [SUPParameterMetaData createParameterMetaData:parameters_counter:(SUPString)@"p0":[SUPDataType forName:@"string"]];
 			parameters_list = [SUPObjectList listWithCapacity:parameters_counter];
 			[parameters_list addThis:p_getLastSynchronizationTime_p0];
 			o_getLastSynchronizationTime_1.parameters = parameters_list;
 		}
 		[o_getLastSynchronizationTime_1 setIsStatic:YES];
 		operation_counter++;
 		SUPOperationMetaData* o_getPersonalizationParameters_0 = [SUPOperationMetaData createOperationMetaData:operation_counter:(SUPString)@"getPersonalizationParameters":[SUPDataType forName:@"PersonalizationParameters"]:true];
 		[o_getPersonalizationParameters_0 setIsStatic:YES];
 
  		SUPObjectList *operations = [SUPObjectList listWithCapacity:operation_counter];
 		[operations addThis:o_createDatabase_0];
 		[operations addThis:o_cleanAllData_1];
 		[operations addThis:o_cleanAllData_0];
 		[operations addThis:o_getSyncUsername_0];
 		[operations addThis:o_loginToSync_2];
 		[operations addThis:o_onlineLogin_2];
 		[operations addThis:o_offlineLogin_2];
 		[operations addThis:o_synchronize_1];
 		[operations addThis:o_submitPendingOperations_0];
 		[operations addThis:o_synchronize_0];
 		[operations addThis:o_submitPendingOperations_1];
 		[operations addThis:o_cancelPendingOperations_0];
 		[operations addThis:o_submitLogRecords_0];
 		[operations addThis:o_deleteDatabase_0];
 		[operations addThis:o_isSynchronized_1];
 		[operations addThis:o_getLastSynchronizationTime_1];
 		[operations addThis:o_getPersonalizationParameters_0];
 		self.operations = operations;
 		
		SUPOperationMap *operationMap = [SUPOperationMap getInstance];
		[operationMap setOperations:operations];
		self.operationMap = operationMap;

		SUPStringList *publications = [SUPStringList getInstance];
		NSMutableDictionary *publicationsToEntities = [[[NSMutableDictionary alloc] init] autorelease];
		[publications add:@"default"];
		SUPObjectList *defaultEntities = [SUPObjectList getInstance];
		[defaultEntities add:[SUP101Customer metaData]];
		[defaultEntities add:[SUP101Sales_order metaData]];
		[defaultEntities add:[SUP101Sales_order_items metaData]];
		[defaultEntities add:[SUP101LogRecordImpl metaData]];
		[defaultEntities add:[SUP101OperationReplay metaData]];
		[defaultEntities add:[SUP101SISSubscription metaData]];
		[defaultEntities add:[SUP101PackageProperties metaData]];
		[defaultEntities add:[SUP101ChangeLogImpl metaData]];
		[defaultEntities add:[SUP101KeyGenerator metaData]];
		[publicationsToEntities setObject:defaultEntities forKey:@"default"];
		
		[publications add:@"unsubscribe"];
		SUPObjectList *unsubscribeEntities = [SUPObjectList getInstance];
		[unsubscribeEntities add:[SUP101KeyGenerator metaData]];
		[publicationsToEntities setObject:unsubscribeEntities forKey:@"unsubscribe"];
		
		[publications add:@"system"];
		SUPObjectList *systemEntities = [SUPObjectList getInstance];
		[systemEntities add:[SUP101LogRecordImpl metaData]];
		[systemEntities add:[SUP101OperationReplay metaData]];
		[systemEntities add:[SUP101SISSubscription metaData]];
		[systemEntities add:[SUP101PackageProperties metaData]];
		[systemEntities add:[SUP101KeyGenerator metaData]];
		[publicationsToEntities setObject:systemEntities forKey:@"system"];
		
		[publications add:@"initialSync"];
		SUPObjectList *initialSyncEntities = [SUPObjectList getInstance];
		[initialSyncEntities add:[SUP101PackageProperties metaData]];
		[initialSyncEntities add:[SUP101KeyGenerator metaData]];
		[publicationsToEntities setObject:initialSyncEntities forKey:@"initialSync"];
		
		self.publicationsMap = publicationsToEntities;
		self.publications = publications;
    }
    return self;
}

@end