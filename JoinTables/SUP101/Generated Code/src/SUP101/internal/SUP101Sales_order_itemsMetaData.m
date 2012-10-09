#import "SUP101Sales_order_itemsMetaData.h"

#import "SUPRelationshipMetaData.h"
#import "SUPParameterMetaData.h"
#import "SUPIndexMetaData.h"
#import "SUPAttributeMap.h"
#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "SUP101Sales_order_items.h"
#import "SUPOperationMap.h"
#import "SUP101SUP101DB.h"
#import "SUPDataType.h"

@implementation SUP101Sales_order_itemsMetaData

+ (SUP101Sales_order_itemsMetaData*)getInstance
{
    return [[[SUP101Sales_order_itemsMetaData alloc] init] autorelease];
}

- (id)init
{
    if (self = [super init]) {
		self.id = _ENTITY_NUMBER_FOR_SUP101Sales_order_items_;
		self.name = @"Sales_order_items";
		self.klass = [SUP101Sales_order_items class];
 		self.allowPending = YES;;

		self.isClientOnly = NO;

		SUPObjectList *attributes = [SUPObjectList getInstance];
		SUPAttributeMetaDataRBS* a_id = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			19:
			[SUPDataType forName:@"int"]:@"integer":@"id":@"":@"a":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_id setColumn:@"a"];
		SUPAttributeMetaDataRBS* a_line_id = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			20:
			[SUPDataType forName:@"short"]:@"smallint":@"line_id":@"":@"b":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_line_id setColumn:@"b"];
		SUPAttributeMetaDataRBS* a_prod_id = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			21:
			[SUPDataType forName:@"int"]:@"integer":@"prod_id":@"":@"c":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_prod_id setColumn:@"c"];
		SUPAttributeMetaDataRBS* a_quantity = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			22:
			[SUPDataType forName:@"int"]:@"integer":@"quantity":@"":@"d":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_quantity setColumn:@"d"];
		SUPAttributeMetaDataRBS* a_ship_date = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			23:
			[SUPDataType forName:@"date"]:@"date":@"ship_date":@"":@"e":
			@"":-1:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
		[a_ship_date setColumn:@"e"];
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
			24:
			[SUPDataType forName:@"long"]:@"decimal(20,0)":@"surrogateKey":@"":@"f":
			@"":-1:0:0:
			@"null":NO:@"":
			YES:NO:NO:NO:NO:NO:
			GeneratedScheme_GLOBAL:
			NO:SUPPersonalizationType_None:NO];
		[a_surrogateKey setColumn:@"f"];
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
		[attributes addThis:a_line_id];
		[attributes addThis:a_prod_id];
		[attributes addThis:a_quantity];
		[attributes addThis:a_ship_date];
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
 		SUPOperationMetaData* o_findAll_0 = [SUPOperationMetaData createOperationMetaData:4:(SUPString)@"findAll":[SUPDataType forName:@"Sales_order_items*"]:true];
		[o_findAll_0 setIsStatic:YES];
		[o_findAll_0 setIsCreate:NO];
		[o_findAll_0 setIsUpdate:NO];
		[o_findAll_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findById_1 = [SUPOperationMetaData createOperationMetaData:5:(SUPString)@"findById":[SUPDataType forName:@"Sales_order_items*"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_findById_id = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"id":[SUPDataType forName:@"int"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_findById_id];
			o_findById_1.parameters = parameters_list;
	 	}
		[o_findById_1 setIsStatic:YES];
		[o_findById_1 setIsCreate:NO];
		[o_findById_1 setIsUpdate:NO];
		[o_findById_1 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findByLine_id_1 = [SUPOperationMetaData createOperationMetaData:6:(SUPString)@"findByLine_id":[SUPDataType forName:@"Sales_order_items*"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_findByLine_id_line_id = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"line_id":[SUPDataType forName:@"short"]];
 			parameters_list = [SUPObjectList listWithCapacity:1];
			[parameters_list addThis:p_findByLine_id_line_id];
			o_findByLine_id_1.parameters = parameters_list;
	 	}
		[o_findByLine_id_1 setIsStatic:YES];
		[o_findByLine_id_1 setIsCreate:NO];
		[o_findByLine_id_1 setIsUpdate:NO];
		[o_findByLine_id_1 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findByPrimaryKey_2 = [SUPOperationMetaData createOperationMetaData:7:(SUPString)@"findByPrimaryKey":[SUPDataType forName:@"Sales_order_items"]:true];
	  	{
			SUPObjectList *parameters_list = nil;
	 		SUPParameterMetaData* p_findByPrimaryKey_id = [SUPParameterMetaData createParameterMetaData:1:(SUPString)@"id":[SUPDataType forName:@"int"]];
	 		SUPParameterMetaData* p_findByPrimaryKey_line_id = [SUPParameterMetaData createParameterMetaData:2:(SUPString)@"line_id":[SUPDataType forName:@"short"]];
 			parameters_list = [SUPObjectList listWithCapacity:2];
			[parameters_list addThis:p_findByPrimaryKey_id];
			[parameters_list addThis:p_findByPrimaryKey_line_id];
			o_findByPrimaryKey_2.parameters = parameters_list;
	 	}
		[o_findByPrimaryKey_2 setIsStatic:YES];
		[o_findByPrimaryKey_2 setIsCreate:NO];
		[o_findByPrimaryKey_2 setIsUpdate:NO];
		[o_findByPrimaryKey_2 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_refresh_0 = [SUPOperationMetaData createOperationMetaData:8:(SUPString)@"refresh":[SUPDataType forName:@"void"]:true];
		[o_refresh_0 setIsStatic:NO];
		[o_refresh_0 setIsCreate:NO];
		[o_refresh_0 setIsUpdate:NO];
		[o_refresh_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o__pk_0 = [SUPOperationMetaData createOperationMetaData:9:(SUPString)@"_pk":[SUPDataType forName:@"long?"]:true];
		[o__pk_0 setIsStatic:NO];
		[o__pk_0 setIsCreate:NO];
		[o__pk_0 setIsUpdate:NO];
		[o__pk_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_submitPending_0 = [SUPOperationMetaData createOperationMetaData:10:(SUPString)@"submitPending":[SUPDataType forName:@"void"]:true];
		[o_submitPending_0 setIsStatic:NO];
		[o_submitPending_0 setIsCreate:NO];
		[o_submitPending_0 setIsUpdate:NO];
		[o_submitPending_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_cancelPending_0 = [SUPOperationMetaData createOperationMetaData:11:(SUPString)@"cancelPending":[SUPDataType forName:@"void"]:true];
		[o_cancelPending_0 setIsStatic:NO];
		[o_cancelPending_0 setIsCreate:NO];
		[o_cancelPending_0 setIsUpdate:NO];
		[o_cancelPending_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_submitPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:12:(SUPString)@"submitPendingOperations":[SUPDataType forName:@"void"]:true];
		[o_submitPendingOperations_0 setIsStatic:YES];
		[o_submitPendingOperations_0 setIsCreate:NO];
		[o_submitPendingOperations_0 setIsUpdate:NO];
		[o_submitPendingOperations_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_cancelPendingOperations_0 = [SUPOperationMetaData createOperationMetaData:13:(SUPString)@"cancelPendingOperations":[SUPDataType forName:@"void"]:true];
		[o_cancelPendingOperations_0 setIsStatic:YES];
		[o_cancelPendingOperations_0 setIsCreate:NO];
		[o_cancelPendingOperations_0 setIsUpdate:NO];
		[o_cancelPendingOperations_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_save_0 = [SUPOperationMetaData createOperationMetaData:14:(SUPString)@"save":[SUPDataType forName:@"void"]:true];
		[o_save_0 setIsStatic:NO];
		[o_save_0 setIsCreate:NO];
		[o_save_0 setIsUpdate:NO];
		[o_save_0 setIsDelete:NO]; 		
 		SUPOperationMetaData* o_findWithQuery_1 = [SUPOperationMetaData createOperationMetaData:15:(SUPString)@"findWithQuery":[SUPDataType forName:@"Sales_order_items*"]:true];
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
 		SUPOperationMetaData* o_getSize_1 = [SUPOperationMetaData createOperationMetaData:16:(SUPString)@"getSize":[SUPDataType forName:@"int"]:true];
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
 
  		SUPObjectList *operations = [SUPObjectList listWithCapacity:16];
 		[operations addThis:o_create_0];
 		[operations addThis:o_update_0];
 		[operations addThis:o_delete_0];
 		[operations addThis:o_findAll_0];
 		[operations addThis:o_findById_1];
 		[operations addThis:o_findByLine_id_1];
 		[operations addThis:o_findByPrimaryKey_2];
 		[operations addThis:o_refresh_0];
 		[operations addThis:o__pk_0];
 		[operations addThis:o_submitPending_0];
 		[operations addThis:o_cancelPending_0];
 		[operations addThis:o_submitPendingOperations_0];
 		[operations addThis:o_cancelPendingOperations_0];
 		[operations addThis:o_save_0];
 		[operations addThis:o_findWithQuery_1];
 		[operations addThis:o_getSize_1];
	 	self.operations = operations;
 	
		SUPOperationMap *operationMap = [SUPOperationMap getInstance];
		[operationMap setOperations:operations];
		self.operationMap = operationMap;		
		self.table = @"sup101_1_0_sales_order_items";
		self.synchronizationGroup = @"default";

		SUPIndexMetaData *i_findByPrimaryKeyIndex = [[[SUPIndexMetaData alloc] init] autorelease];
		i_findByPrimaryKeyIndex.name = @"findByPrimaryKeyIndex";
		[i_findByPrimaryKeyIndex.attributes add:a_id];
		[i_findByPrimaryKeyIndex.attributes add:a_line_id];
	
		[self.indexList add:i_findByPrimaryKeyIndex];
			
		[self.keyList add:a_surrogateKey];


        self.useOldValue = YES;
    }
    return self;
}
@end