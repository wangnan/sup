/*
 Generated by Sybase Unwired Platform 
 Compiler version - 2.1.3.231
*/ 

#import "SUP101Sales_order_items.h"
#import "SUP101Sales_order_itemsMetaData.h"
#import "SUPJsonObject.h"
#import "SUP101SUP101DB.h"
#import "SUPEntityDelegate.h"
#import "SUPEntityMetaDataRBS.h"
#import "SUPQuery.h"
#import "SUP101KeyGenerator.h"
#import "SUP101LocalKeyGenerator.h"
#import "SUP101LogRecordImpl.h"

@implementation SUP101Sales_order_items

@synthesize id_ = _id;
@synthesize line_id = _line_id;
@synthesize prod_id = _prod_id;
@synthesize quantity = _quantity;
@synthesize ship_date = _ship_date;
@synthesize surrogateKey = _surrogateKey;

- (int64_t)surrogateKey
{
    return _surrogateKey;
}

- (void)setId_:(int32_t)newId_
{
    if (newId_ != self->_id)
    {
        self->_id = newId_;
        self.isDirty = YES;
    }
}

- (void)setLine_id:(short)newLine_id
{
    if (newLine_id != self->_line_id)
    {
        self->_line_id = newLine_id;
        self.isDirty = YES;
    }
}

- (void)setProd_id:(int32_t)newProd_id
{
    if (newProd_id != self->_prod_id)
    {
        self->_prod_id = newProd_id;
        self.isDirty = YES;
    }
}

- (void)setQuantity:(int32_t)newQuantity
{
    if (newQuantity != self->_quantity)
    {
        self->_quantity = newQuantity;
        self.isDirty = YES;
    }
}

- (void)setShip_date:(NSDate*)newShip_date
{
    if (newShip_date != self->_ship_date)
    {
		[self->_ship_date release];
        self->_ship_date = [newShip_date retain];
        self.isDirty = YES;
    }
}

- (void)setSurrogateKey:(int64_t)newSurrogateKey
{
    if (newSurrogateKey != self->_surrogateKey)
    {
        self->_surrogateKey = newSurrogateKey;
        self.isNew = YES;
    }
}

static SUPEntityDelegate *g_SUP101Sales_order_items_delegate = nil;

+ (SUPEntityDelegate *) delegate
{
	@synchronized(self) {
		if (g_SUP101Sales_order_items_delegate == nil) {
			g_SUP101Sales_order_items_delegate = [[SUPEntityDelegate alloc] initWithName:@"SUP101Sales_order_items" clazz:[self class]
				metaData:[self metaData] dbDelegate:[SUP101SUP101DB delegate] database:[SUP101SUP101DB instance]];
		}
	}
	
	return [[g_SUP101Sales_order_items_delegate retain] autorelease];
}

static SUPEntityMetaDataRBS* SUP101Sales_order_items_META_DATA;

+ (SUPEntityMetaDataRBS*)metaData
{
    if (SUP101Sales_order_items_META_DATA == nil) {
		SUP101Sales_order_items_META_DATA = [[SUP101Sales_order_itemsMetaData alloc] init];
	}
	
	return SUP101Sales_order_items_META_DATA;
}

- (SUPClassMetaDataRBS*)getClassMetaData
{
    return [[self class] metaData];
}

- (void)clearRelationshipObjects
{
}

+ (NSObject<SUPCallbackHandler>*)callbackHandler
{
	return [[self delegate] callbackHandler];
}

+ (void)registerCallbackHandler:(NSObject<SUPCallbackHandler>*)newCallbackHandler
{
	[[self delegate] registerCallbackHandler:newCallbackHandler];
}
- (id) init
{
    if ((self = [super init]))
    {
        self.classMetaData = [SUP101Sales_order_items metaData];
        [self setEntityDelegate:(SUPEntityDelegate*)[SUP101Sales_order_items delegate]];
    }
    return self;    
}

- (void)dealloc
{
    if(_ship_date)
    {
        [_ship_date release];
        _ship_date = nil;
    }
	[super dealloc];
}




+ (SUP101Sales_order_items*)find:(int64_t)id_
{
    SUPObjectList *keys = [SUPObjectList getInstance];
    [keys add:[NSNumber numberWithLong:id_]];
    return (SUP101Sales_order_items*)[(SUPEntityDelegate*)([[self class] delegate]) findEntityWithKeys:keys];
}

+ (SUPObjectList*)findWithQuery:(SUPQuery*)query
{
    return (SUPObjectList*)[(SUPEntityDelegate*)([[self class] delegate])  findWithQuery:query:[SUP101Sales_order_items class]];
}

- (int64_t)_pk
{
    return (int64_t)[[self i_pk] longValue];
}

+ (SUP101Sales_order_items*)load:(int64_t)id_
{
    return (SUP101Sales_order_items*)[(SUPEntityDelegate*)([[self class] delegate]) load:[NSNumber numberWithLong:id_]];
}

+ (SUP101Sales_order_items*)getInstance
{
    SUP101Sales_order_items* me = [[SUP101Sales_order_items alloc] init];
    [me autorelease];
    return me;
}
- (SUPString)getLastOperation
{
    if (self.pendingChange == 'C')
    {
        return @"create";
    }
    else if (self.pendingChange == 'D')
    {
        return @"delete";
    }
    else if (self.pendingChange == 'U')
    {
        return @"update";
    }
    return @"";

}
+ (void)submitPendingOperations
{
    [[[self class] delegate] submitPendingOperations];
}

+ (void)cancelPendingOperations
{
    [[[self class] delegate] cancelPendingOperations];
}
- (SUP101Sales_order_items*)getDownloadState
{
    return (SUP101Sales_order_items*)[self i_getDownloadState];
}

- (SUP101Sales_order_items*) getOriginalState
{
    return (SUP101Sales_order_items*)[self i_getOriginalState];
}
- (SUPJsonObject*)getAttributeJson:(int)id_
{
    switch(id_)
    {
        default:
        return [super getAttributeJson:id_];
    }

}
- (void)setAttributeJson:(int)id_:(SUPJsonObject*)value
{
    switch(id_)
    { 
        default:
            [super setAttributeJson:id_:value];
            break;
    }

}
- (id)getAttributeLargeObject:(int)id_ loadFromDB:(BOOL)loadFromDB
{
    switch(id_)
    {
        default:
        return [super getAttributeJson:id_];
    }
}
- (void)setAttributeLargeObject:(int)id_:(id)value
{
    switch(id_)
    {
        default:
            [super setAttributeJson:id_:value];
            break;
    }

}

-(SUPLong) getAttributeLong:(int)id_
{
    switch(id_)
    {
    case 24:
        return self.surrogateKey;
    default:
         return [super getAttributeLong:id_];
    }
}

-(void) setAttributeLong:(int)id_:(SUPLong)v
{
    switch(id_)
    {
    case 24:
        self.surrogateKey = v;
        break;;
    default:
        [super setAttributeLong:id_:v];
        break;;
    }
}
-(SUPDate) getAttributeDate:(int)id_
{
    switch(id_)
    {
    case 23:
        return self.ship_date;
    default:
         return [super getAttributeDate:id_];
    }
}

-(void) setAttributeDate:(int)id_:(SUPDate)v
{
    switch(id_)
    {
    case 23:
        self.ship_date = v;
        break;;
    default:
        [super setAttributeDate:id_:v];
        break;;
    }
}
-(SUPShort) getAttributeShort:(int)id_
{
    switch(id_)
    {
    case 20:
        return self.line_id;
    default:
         return [super getAttributeShort:id_];
    }
}

-(void) setAttributeShort:(int)id_:(SUPShort)v
{
    switch(id_)
    {
    case 20:
        self.line_id = v;
        break;;
    default:
        [super setAttributeShort:id_:v];
        break;;
    }
}
-(SUPInt) getAttributeInt:(int)id_
{
    switch(id_)
    {
    case 19:
        return self.id_;
    case 21:
        return self.prod_id;
    case 22:
        return self.quantity;
    default:
         return [super getAttributeInt:id_];
    }
}

-(void) setAttributeInt:(int)id_:(SUPInt)v
{
    switch(id_)
    {
    case 19:
        self.id_ = v;
        break;;
    case 21:
        self.prod_id = v;
        break;;
    case 22:
        self.quantity = v;
        break;;
    default:
        [super setAttributeInt:id_:v];
        break;;
    }
}
- (SUPObjectList*)getLogRecords
{
   return [SUP101LogRecordImpl findByEntity:@"Sales_order_items":[self keyToString]];
}




- (NSString*)toString
{
	NSString* str = [NSString stringWithFormat:@"\
	Sales_order_items = \n\
	    id = %i,\n\
	    line_id = %hi,\n\
	    prod_id = %i,\n\
	    quantity = %i,\n\
	    ship_date = %@,\n\
	    pending = %i,\n\
	    pendingChange = %c,\n\
	    replayPending = %qi,\n\
	    replayFailure = %qi,\n\
	    surrogateKey = %qi,\n\
	    replayCounter = %qi,\n\
	    disableSubmit = %i,\n\
	    isNew = %i,\n\
        isDirty = %i,\n\
        isDeleted = %i,\n\
	\n"
    	,self.id_
    	,self.line_id
    	,self.prod_id
    	,self.quantity
    	,self.ship_date
    	,self.pending
    	,self.pendingChange
    	,self.replayPending
    	,self.replayFailure
    	,self.surrogateKey
    	,self.replayCounter
    	,self.disableSubmit
		,self.isNew
		,self.isDirty
		,self.isDeleted
	];
	return str;

}

- (NSString*)description
{
	return [self toString];
}
+ (SUPObjectList*)getPendingObjects
{
    return (SUPObjectList*)[(SUPEntityDelegate*)[[self class] delegate] getPendingObjects];
}

+ (SUPObjectList*)getPendingObjects:(int32_t)skip take:(int32_t)take
{
    return (SUPObjectList*)[(SUPEntityDelegate*)[[self class] delegate] getPendingObjects:skip:take];
}




+ (SUPObjectList*)findAll
{
	return [self findAll:0 take:INT_MAX]; 
}


	

+ (SUPObjectList*)findAll:(int32_t)skip take:(int32_t)take
{
	NSMutableString *sql = nil;
	NSMutableString *_selectSQL = nil;
	_selectSQL = [[[NSMutableString alloc] initWithCapacity:283] autorelease];
	[_selectSQL appendString:@" x.\"a\",x.\"b\",x.\"c\",x.\"d\",x.\"e\",x.\"_pf\",x.\"_pc\",x.\"_rp\",x.\"_rf\",x.\"f\",x.\"_rc\",x.\"_ds\" FROM \"sup101_1_0_sales_order_items\" x where (((x.\"_pf\" = 1 or not exists (select x_os.\"f\" from \"sup101_1_0_sales_order_items_os\" x_os where x_os.\"f\" = x.\"f\"))))"];
	sql = [[NSMutableString alloc] initWithFormat:@"select %@", _selectSQL];
	[sql autorelease];
	sql = [[NSMutableString alloc] initWithFormat:@"select %@", _selectSQL];
	[sql autorelease];
	SUPStringList *ids = [SUPStringList listWithCapacity:0];
	SUPObjectList *dts = [SUPObjectList getInstance];
	SUPObjectList* values = [SUPObjectList getInstance];
	return (SUPObjectList*)[[[self class] delegate] findWithSQL:sql withDataTypes:dts withValues:values withIDs:ids withSkip:skip withTake:take withClass:[SUP101Sales_order_items class]];
}



+ (SUPObjectList*)findById:(int32_t)id_
{
	return [self findById:id_ skip:0 take:INT_MAX]; 
}


	

+ (SUPObjectList*)findById:(int32_t)id_ skip:(int32_t)skip take:(int32_t)take
{
	NSMutableString *sql = nil;
	NSMutableString *_selectSQL = nil;
	_selectSQL = [[[NSMutableString alloc] initWithCapacity:302] autorelease];
	[_selectSQL appendString:@" x.\"a\",x.\"b\",x.\"c\",x.\"d\",x.\"e\",x.\"_pf\",x.\"_pc\",x.\"_rp\",x.\"_rf\",x.\"f\",x.\"_rc\",x.\"_ds\" FROM \"sup101_1_0_sales_order_items\" x WHERE (((x.\"_pf\" = 1 or not exists (select x_os.\"f\" from \"sup101_1_0_sales_order_items_os\" x_os where x_os.\"f\" = x.\"f\")))) and ( x.\"a\" = ?)"];
	sql = [[NSMutableString alloc] initWithFormat:@"select %@", _selectSQL];
	[sql autorelease];
	SUPStringList *ids = [SUPStringList listWithCapacity:0];
	SUPObjectList *dts = [SUPObjectList getInstance];
	[dts addObject:[SUPDataType forName:@"int"]];
	SUPObjectList* values = [SUPObjectList getInstance];
	[values addObject:[NSNumber numberWithInt:id_]];
	return (SUPObjectList*)[[[self class] delegate] findWithSQL:sql withDataTypes:dts withValues:values withIDs:ids withSkip:skip withTake:take withClass:[SUP101Sales_order_items class]];
}



+ (SUPObjectList*)findByLine_id:(short)line_id
{
	return [self findByLine_id:line_id skip:0 take:INT_MAX]; 
}


	

+ (SUPObjectList*)findByLine_id:(short)line_id skip:(int32_t)skip take:(int32_t)take
{
	NSMutableString *sql = nil;
	NSMutableString *_selectSQL = nil;
	_selectSQL = [[[NSMutableString alloc] initWithCapacity:302] autorelease];
	[_selectSQL appendString:@" x.\"a\",x.\"b\",x.\"c\",x.\"d\",x.\"e\",x.\"_pf\",x.\"_pc\",x.\"_rp\",x.\"_rf\",x.\"f\",x.\"_rc\",x.\"_ds\" FROM \"sup101_1_0_sales_order_items\" x WHERE (((x.\"_pf\" = 1 or not exists (select x_os.\"f\" from \"sup101_1_0_sales_order_items_os\" x_os where x_os.\"f\" = x.\"f\")))) and ( x.\"b\" = ?)"];
	sql = [[NSMutableString alloc] initWithFormat:@"select %@", _selectSQL];
	[sql autorelease];
	SUPStringList *ids = [SUPStringList listWithCapacity:0];
	SUPObjectList *dts = [SUPObjectList getInstance];
	[dts addObject:[SUPDataType forName:@"short"]];
	SUPObjectList* values = [SUPObjectList getInstance];
	[values addObject:[NSNumber numberWithShort:line_id]];
	return (SUPObjectList*)[[[self class] delegate] findWithSQL:sql withDataTypes:dts withValues:values withIDs:ids withSkip:skip withTake:take withClass:[SUP101Sales_order_items class]];
}



+ (SUP101Sales_order_items*)findByPrimaryKey:(int32_t)id_ withLine_id:(short)line_id
{
	NSMutableString *sql = nil;
	NSMutableString *_selectSQL = nil;
	_selectSQL = [[[NSMutableString alloc] initWithCapacity:333] autorelease];
	[_selectSQL appendString:@"SELECT x.\"a\",x.\"b\",x.\"c\",x.\"d\",x.\"e\",x.\"_pf\",x.\"_pc\",x.\"_rp\",x.\"_rf\",x.\"f\",x.\"_rc\",x.\"_ds\" FROM \"sup101_1_0_sales_order_items\" x WHERE (((x.\"_pf\" = 1 or not exists (select x_os.\"f\" from \"sup101_1_0_sales_order_items_os\" x_os where x_os.\"f\" = x.\"f\")))) and ( x.\"a\" = ? AN"
	                               "D x.\"b\" = ?)"];
	sql = [[NSMutableString alloc] initWithFormat:@"%@", _selectSQL];
	[sql autorelease];
	SUPStringList *ids = [SUPStringList listWithCapacity:0];
	SUPObjectList *dts = [SUPObjectList getInstance];
	[dts addObject:[SUPDataType forName:@"int"]];
	[dts addObject:[SUPDataType forName:@"short"]];
	SUPObjectList* values = [SUPObjectList getInstance];
	[values addObject:[NSNumber numberWithInt:id_]];
	[values addObject:[NSNumber numberWithShort:line_id]];
	
	SUPObjectList* res = (SUPObjectList*)[[[self class] delegate] findWithSQL:sql withDataTypes:dts withValues:values withIDs:ids withClass:[SUP101Sales_order_items class]];
	if(res && ([res size] > 0))
	{   
		SUP101Sales_order_items* cus = (SUP101Sales_order_items*)[res item:0];
	    return cus;
	}
	else
	    return nil;
}

/*!
  @method
  @abstract Generated class method 
  @param query
  @throws SUPPersistenceException
 */
+ (int32_t)getSize:(SUPQuery*)query
{
    return [(SUPEntityDelegate*)([[self class] delegate]) getSize:query];
}

@end