#import "SUP101CustomerMetaData.h"

#import "SUPRelationshipMetaData.h"
#import "SUPParameterMetaData.h"
#import "SUPIndexMetaData.h"
#import "SUPAttributeMap.h"
#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "SUP101Customer.h"
#import "SUPOperationMap.h"
#import "SUP101SUP101DB.h"
#import "SUPDataType.h"

@implementation SUP101CustomerMetaData

+ (SUP101CustomerMetaData*)getInstance
{
    return [[[SUP101CustomerMetaData alloc] init] autorelease];
}

- (id)init
{
    if (self = [super init]) {
		self.id = _ENTITY_NUMBER_FOR_SUP101Customer_;
		self.name = @"Customer";
		self.klass = [SUP101Customer class];
 		self.allowPending = YES;;

		self.isClientOnly = NO;

		SUPObjectList *attributes = [SUPObjectList getInstance];
		SUPAttributeMetaDataRBS* a_id = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			0:
			[SUPDataType forName:@"int"]:@"integer":@"id":@"":@"a":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_id setColumn:@"a"];
		SUPAttributeMetaDataRBS* a_fname = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			1:
			[SUPDataType forName:@"string"]:@"varchar(60)":@"fname":@"":@"b":
			@"":60:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_fname setColumn:@"b"];
		SUPAttributeMetaDataRBS* a_lname = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			2:
			[SUPDataType forName:@"string"]:@"varchar(80)":@"lname":@"":@"c":
			@"":80:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_lname setColumn:@"c"];
		SUPAttributeMetaDataRBS* a_address = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			3:
			[SUPDataType forName:@"string"]:@"varchar(140)":@"address":@"":@"d":
			@"":140:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_address setColumn:@"d"];
		SUPAttributeMetaDataRBS* a_city = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			4:
			[SUPDataType forName:@"string"]:@"varchar(80)":@"city":@"":@"e":
			@"":80:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_city setColumn:@"e"];
		SUPAttributeMetaDataRBS* a_state = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			5:
			[SUPDataType forName:@"string"]:@"varchar(8)":@"state":@"":@"f":
			@"":8:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_state setColumn:@"f"];
		SUPAttributeMetaDataRBS* a_zip = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			6:
			[SUPDataType forName:@"string"]:@"varchar(40)":@"zip":@"":@"g":
			@"":40:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_zip setColumn:@"g"];
		SUPAttributeMetaDataRBS* a_phone = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			7:
			[SUPDataType forName:@"string"]:@"varchar(48)":@"phone":@"":@"h":
			@"":48:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_phone setColumn:@"h"];
		SUPAttributeMetaDataRBS* a_company_name = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			8:
			[SUPDataType forName:@"string?"]:@"varchar(140)":@"company_name":@"":@"i":
			@"":140:0:0:
			@"null":NO:@"":
			NO:NO:YES:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_company_name setColumn:@"i"];
		SUPRelationshipMetaData* a_customerSalesOrders = [SUPRelationshipMetaData attributeMetaDataWith:
			10:
			[SUPDataType forName:@"Sales_order*"]:@"LONG VARCHAR":@"customerSalesOrders":@"":@"l":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:YES:YES:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_customerSalesOrders setColumn:nil];
		SUPAttributeMetaDataRBS* a_pending = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20001:
			[SUPDataType forName:@"boolean"]:@"tinyint":@"pending":@"":@"_pf":
			@"default 'N'":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_pending setColumn:@"_pf"];
		SUPAttributeMetaDataRBS* a_pendingChange = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20002:
			[SUPDataType forName:@"char"]:@"char(1)":@"pendingChange":@"":@"_pc":
			@"":1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_pendingChange setColumn:@"_pc"];
		SUPAttributeMetaDataRBS* a_replayPending = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20005:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"replayPending":@"":@"_rp":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_replayPending setColumn:@"_rp"];
		SUPAttributeMetaDataRBS* a_replayFailure = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20006:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"replayFailure":@"":@"_rf":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_replayFailure setColumn:@"_rf"];
		SUPAttributeMetaDataRBS* a_surrogateKey = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			9:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"surrogateKey":@"":@"j":
			@"":-1:0:0:
			@"null":NO:@"":
			YES:NO:NO:NO:NO:NO:
			GeneratedScheme_GLOBAL:
			NO:SUPPersonalizationType_None:NO];
		[a_surrogateKey setColumn:@"j"];
		SUPAttributeMetaDataRBS* a_replayCounter = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20004:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"replayCounter":@"_rc":@"_rc":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_replayCounter setColumn:@"_rc"];
		SUPAttributeMetaDataRBS* a_disableSubmit = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20003:
			[SUPDataType forName:@"boolean"]:@"tinyint":@"disableSubmit":@"":@"_ds":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_disableSubmit setColumn:@"_ds"];
 		
		[attributes addThis:a_id];
		[attributes addThis:a_fname];
		[attributes addThis:a_lname];
		[attributes addThis:a_address];
		[attributes addThis:a_city];
		[attributes addThis:a_state];
		[attributes addThis:a_zip];
		[attributes addThis:a_phone];
		[attributes addThis:a_company_name];
		[attributes addThis:a_customerSalesOrders];
		[attributes addThis:a_pending];
		[attributes addThis:a_pendingChange];
		[attributes addThis:a_replayPending];
		[attributes addThis:a_replayFailure];
		[attributes addThis:a_surrogateKey];
		[attributes addThis:a_replayCounter];
		[attributes addThis:a_disableSubmit];
		self.attributes = attributes;
		
		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
   		[attributeMap setAttributes:attributes];
	   	self.attributeMap = attributeMap;

 		SUPOperationMetaData* o_create_0 = [SUPOperationMetaData createOperationMetaData:1:(SUPString)@"create":[SUPDataType forName:@"void"]:true];
		[o_create_0 setIsStatic:NO];
		[o_create_0 setIsCreate:YES];
		[o_create_0 setIsUpdate:NO];
		[o_create_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_update_0 = [SUPOperationMetaData createOperationMetaData:2:(SUPString)@"update":[SUPDataType forName:@"void"]:true];
		[o_update_0 setIsStatic:NO];
		[o_update_0 setIsCreate:NO];
		[o_update_0 setIsUpdate:YES];
		[o_update_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_delete_0 = [SUPOperationMetaData createOperationMetaData:3:(SUPString)@"delete":[SUPDataType forName:@"void"]:true];
		[o_delete_0 setIsStatic:NO];
		[o_delete_0 setIsCreate:NO];
		[o_delete_0 setIsUpdate:NO];
		[o_delete_0 setIsDelete:YES]; 		
 		SUPOperationMetaData* o_findAll_0 = [SUPOperationMetaData createOperationMetaData:4:(SUPString)@"findAll":[SUPDataType forName:@"Customer*"]:true];
		[o_findAll_0 setIsStatic:YES];
		[o_findAll_0 setIsCreate:NO];
		[o_findAll_0 setIsUpdate:NO];
		[o_findAll_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findByPrimaryKey_1 = [SUPOperationMetaData createOperationMetaData:5:(SUPString)@"findByPrimaryKey":[SUPDataType forName:@"Customer"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_findByPrimaryKey_id = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"id":[SUPDataType forName:@"int"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_findByPrimaryKey_id];
			o_findByPrimaryKey_1.parameters = parameters_list;
	 	}
		[o_findByPrimaryKey_1 setIsStatic:YES];
		[o_findByPrimaryKey_1 setIsCreate:NO];
		[o_findByPrimaryKey_1 setIsUpdate:NO];
		[o_findByPrimaryKey_1 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_refresh_0 = [SUPOperationMetaData createOperationMetaData:6:(SUPString)@"refresh":[SUPDataType forName:@"void"]:true];
		[o_refresh_0 setIsStatic:NO];
		[o_refresh_0 setIsCreate:NO];
		[o_refresh_0 setIsUpdate:NO];
		[o_refresh_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o__pk_0 = [SUPOperationMetaData createOperationMetaData:7:(SUPString)@"_pk":[SUPDataType forName:@"long?"]:true];
		[o__pk_0 setIsStatic:NO];
		[o__pk_0 setIsCreate:NO];
		[o__pk_0 setIsUpdate:NO];
		[o__pk_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_submitPending_0 = [SUPOperationMetaData createOperationMetaData:8:(SUPString)@"submitPending":[SUPDataType forName:@"void"]:true];
		[o_submitPending_0 setIsStatic:NO];
		[o_submitPending_0 setIsCreate:NO];
		[o_submitPending_0 setIsUpdate:NO];
		[o_submitPending_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_cancelPending_0 = [SUPOperationMetaData createOperationMetaData:9:(SUPString)@"cancelPending":[SUPDataType forName:@"void"]:true];
		[o_cancelPending_0 setIsStatic:NO];
		[o_cancelPending_0 setIsCreate:NO];
		[o_cancelPending_0 setIsUpdate:NO];
		[o_cancelPending_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_submitPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:10:(SUPString)@"submitPendingOperations":[SUPDataType forName:@"void"]:true];
		[o_submitPendingOperations_0 setIsStatic:YES];
		[o_submitPendingOperations_0 setIsCreate:NO];
		[o_submitPendingOperations_0 setIsUpdate:NO];
		[o_submitPendingOperations_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_cancelPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:11:(SUPString)@"cancelPendingOperations":[SUPDataType forName:@"void"]:true];
		[o_cancelPendingOperations_0 setIsStatic:YES];
		[o_cancelPendingOperations_0 setIsCreate:NO];
		[o_cancelPendingOperations_0 setIsUpdate:NO];
		[o_cancelPendingOperations_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_save_0 = [SUPOperationMetaData createOperationMetaData:12:(SUPString)@"save":[SUPDataType forName:@"void"]:true];
		[o_save_0 setIsStatic:NO];
		[o_save_0 setIsCreate:NO];
		[o_save_0 setIsUpdate:NO];
		[o_save_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findWithQuery_1 = [SUPOperationMetaData createOperationMetaData:13:(SUPString)@"findWithQuery":[SUPDataType forName:@"Customer*"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_findWithQuery_query = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"query":[SUPDataType forName:@"com.sybase.persistence.Query"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_findWithQuery_query];
			o_findWithQuery_1.parameters = parameters_list;
	 	}
		[o_findWithQuery_1 setIsStatic:YES];
		[o_findWithQuery_1 setIsCreate:NO];
		[o_findWithQuery_1 setIsUpdate:NO];
		[o_findWithQuery_1 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_getSize_1 = [SUPOperationMetaData createOperationMetaData:14:(SUPString)@"getSize":[SUPDataType forName:@"int"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_getSize_query = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"query":[SUPDataType forName:@"com.sybase.persistence.Query"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_getSize_query];
			o_getSize_1.parameters = parameters_list;
	 	}
		[o_getSize_1 setIsStatic:YES];
		[o_getSize_1 setIsCreate:NO];
		[o_getSize_1 setIsUpdate:NO];
		[o_getSize_1 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_getCustomerSalesOrdersFilterBy_1 = [SUPOperationMetaData createOperationMetaData:15:(SUPString)@"getCustomerSalesOrdersFilterBy":[SUPDataType forName:@"Sales_order*"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_getCustomerSalesOrdersFilterBy_query = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"query":[SUPDataType forName:@"com.sybase.persistence.Query"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_getCustomerSalesOrdersFilterBy_query];
			o_getCustomerSalesOrdersFilterBy_1.parameters = parameters_list;
	 	}
		[o_getCustomerSalesOrdersFilterBy_1 setIsStatic:NO];
		[o_getCustomerSalesOrdersFilterBy_1 setIsCreate:NO];
		[o_getCustomerSalesOrdersFilterBy_1 setIsUpdate:NO];
		[o_getCustomerSalesOrdersFilterBy_1 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_getCustomerSalesOrdersSize_1 = [SUPOperationMetaData createOperationMetaData:16:(SUPString)@"getCustomerSalesOrdersSize":[SUPDataType forName:@"int"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_getCustomerSalesOrdersSize_query = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"query":[SUPDataType forName:@"com.sybase.persistence.Query"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_getCustomerSalesOrdersSize_query];
			o_getCustomerSalesOrdersSize_1.parameters = parameters_list;
	 	}
		[o_getCustomerSalesOrdersSize_1 setIsStatic:NO];
		[o_getCustomerSalesOrdersSize_1 setIsCreate:NO];
		[o_getCustomerSalesOrdersSize_1 setIsUpdate:NO];
		[o_getCustomerSalesOrdersSize_1 setIsDelete:NO]; 		
 
  		SUPObjectList *operations = [SUPObjectList listWithCapacity:16];
 		[operations addThis:o_create_0];
 		[operations addThis:o_update_0];
 		[operations addThis:o_delete_0];
 		[operations addThis:o_findAll_0];
 		[operations addThis:o_findByPrimaryKey_1];
 		[operations addThis:o_refresh_0];
 		[operations addThis:o__pk_0];
 		[operations addThis:o_submitPending_0];
 		[operations addThis:o_cancelPending_0];
 		[operations addThis:o_submitPendingOperations_0];
 		[operations addThis:o_cancelPendingOperations_0];
 		[operations addThis:o_save_0];
 		[operations addThis:o_findWithQuery_1];
 		[operations addThis:o_getSize_1];
 		[operations addThis:o_getCustomerSalesOrdersFilterBy_1];
 		[operations addThis:o_getCustomerSalesOrdersSize_1];
	 	self.operations = operations;
 	
		SUPOperationMap *operationMap = [SUPOperationMap getInstance];
		[operationMap setOperations:operations];
		self.operationMap = operationMap;		
		self.table = @"sup101_1_0_customer";
		self.synchronizationGroup = @"default";

		SUPIndexMetaData *i_findByPrimaryKeyIndex = [[[SUPIndexMetaData alloc] init] autorelease];
		i_findByPrimaryKeyIndex.name = @"findByPrimaryKeyIndex";
		[i_findByPrimaryKeyIndex.attributes add:a_id];
	
		[self.indexList add:i_findByPrimaryKeyIndex];
			
		[self.keyList add:a_surrogateKey];

    	a_customerSalesOrders.cascadeString = @"save,create,update,delete";
		a_customerSalesOrders.inverseEntity = @"Sales_order";
		a_customerSalesOrders.inverseAttribute = @"customer";
        [self.relationList add:a_customerSalesOrders];
        [self.relationMap setObject:a_customerSalesOrders forKey:a_customerSalesOrders.name];
        

        self.useOldValue = YES;
    }
    return self;
}
@end