/*
 Generated by Sybase Unwired Platform 
 Compiler version - 2.1.3.231
*/ 

#import "SUP101Sales_order.h"
#import "SUP101Sales_orderMetaData.h"
#import "SUPJsonObject.h"
#import "SUP101SUP101DB.h"
#import "SUPEntityDelegate.h"
#import "SUPEntityMetaDataRBS.h"
#import "SUPQuery.h"
#import "SUP101KeyGenerator.h"
#import "SUP101LocalKeyGenerator.h"
#import "SUP101LogRecordImpl.h"

#import "SUP101Customer.h"
#import "SUPRelationshipMetaData.h"

@implementation SUP101Sales_order

@synthesize id_ = _id;
@synthesize cust_id = _cust_id;
@synthesize order_date = _order_date;
@synthesize fin_code_id = _fin_code_id;
@synthesize region = _region;
@synthesize sales_rep = _sales_rep;
@synthesize customerFK = _customerFK;
@synthesize customerValid = _customerValid;
@synthesize surrogateKey = _surrogateKey;

- (SUP101Customer*)customer
{
    if (_customerValid == NO)
    {
         if (_customerFK != nil)
        {
            self.customer = [SUP101Customer find:[_customerFK intValue]];
        }
 		_customerValid = YES;
    }
    return _customer;
}

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

- (void)setCust_id:(int32_t)newCust_id
{
    if (newCust_id != self->_cust_id)
    {
        self->_cust_id = newCust_id;
        self.isDirty = YES;
    }
}

- (void)setOrder_date:(NSDate*)newOrder_date
{
    if (newOrder_date != self->_order_date)
    {
		[self->_order_date release];
        self->_order_date = [newOrder_date retain];
        self.isDirty = YES;
    }
}

- (void)setFin_code_id:(NSString*)newFin_code_id
{
    if (newFin_code_id != self->_fin_code_id)
    {
		[self->_fin_code_id release];
        self->_fin_code_id = [newFin_code_id retain];
        self.isDirty = YES;
    }
}

- (void)setRegion:(NSString*)newRegion
{
    if (newRegion != self->_region)
    {
		[self->_region release];
        self->_region = [newRegion retain];
        self.isDirty = YES;
    }
}

- (void)setSales_rep:(int32_t)newSales_rep
{
    if (newSales_rep != self->_sales_rep)
    {
        self->_sales_rep = newSales_rep;
        self.isDirty = YES;
    }
}

- (void)setCustomer:(SUP101Customer*)newCustomer
{
    if (_customer != newCustomer)
    {
        if (_customer != nil )
        {
        	self.isDirty = YES;
        }       
    }
    if (newCustomer == nil)
    {
		[_customerFK release];
        _customerFK = nil;
    }
    else
    {
        newCustomer.isDirty = YES;
 		[_customerFK release];
        _customerFK = [[NSNumber alloc] initWithInteger:[newCustomer _pk]];
		
        _cust_id = [newCustomer id_];
	    
    }
    [_customer release];
    _customer = newCustomer;
    [_customer retain];
    _customerValid = YES;
}

- (void)setCustomerFK:(NSNumber*)newCustomerFK
{
    if (newCustomerFK != self->_customerFK)
    {
		[self->_customerFK release];
        self->_customerFK = [newCustomerFK retain];
        self.isDirty = YES;
    }
}

- (void)setCustomerValid:(BOOL)newCustomerValid
{
    if (newCustomerValid != self->_customerValid)
    {
        self->_customerValid = newCustomerValid;
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

static SUPEntityDelegate *g_SUP101Sales_order_delegate = nil;

+ (SUPEntityDelegate *) delegate
{
	@synchronized(self) {
		if (g_SUP101Sales_order_delegate == nil) {
			g_SUP101Sales_order_delegate = [[SUPEntityDelegate alloc] initWithName:@"SUP101Sales_order" clazz:[self class]
				metaData:[self metaData] dbDelegate:[SUP101SUP101DB delegate] database:[SUP101SUP101DB instance]];
		}
	}
	
	return [[g_SUP101Sales_order_delegate retain] autorelease];
}

static SUPEntityMetaDataRBS* SUP101Sales_order_META_DATA;

+ (SUPEntityMetaDataRBS*)metaData
{
    if (SUP101Sales_order_META_DATA == nil) {
		SUP101Sales_order_META_DATA = [[SUP101Sales_orderMetaData alloc] init];
	}
	
	return SUP101Sales_order_META_DATA;
}

- (SUPClassMetaDataRBS*)getClassMetaData
{
    return [[self class] metaData];
}

- (void)clearRelationshipObjects
{
	if(_customer)
	{
		[_customer release];
		_customer = nil;
	}
	_customerValid = NO;
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
        self.classMetaData = [SUP101Sales_order metaData];
        [self setEntityDelegate:(SUPEntityDelegate*)[SUP101Sales_order delegate]];
    }
    return self;    
}

- (void)dealloc
{
    if(_order_date)
    {
        [_order_date release];
        _order_date = nil;
    }
    if(_fin_code_id)
    {
        [_fin_code_id release];
        _fin_code_id = nil;
    }
    if(_region)
    {
        [_region release];
        _region = nil;
    }
    if(_customer)
    {
        [_customer release];
        _customer = nil;
    }
    if(_customerFK)
    {
        [_customerFK release];
        _customerFK = nil;
    }
	[super dealloc];
}




+ (SUP101Sales_order*)find:(int64_t)id_
{
    SUPObjectList *keys = [SUPObjectList getInstance];
    [keys add:[NSNumber numberWithLong:id_]];
    return (SUP101Sales_order*)[(SUPEntityDelegate*)([[self class] delegate]) findEntityWithKeys:keys];
}

+ (SUPObjectList*)findWithQuery:(SUPQuery*)query
{
    return (SUPObjectList*)[(SUPEntityDelegate*)([[self class] delegate])  findWithQuery:query:[SUP101Sales_order class]];
}

- (int64_t)_pk
{
    return (int64_t)[[self i_pk] longValue];
}

+ (SUP101Sales_order*)load:(int64_t)id_
{
    return (SUP101Sales_order*)[(SUPEntityDelegate*)([[self class] delegate]) load:[NSNumber numberWithLong:id_]];
}

+ (SUP101Sales_order*)getInstance
{
    SUP101Sales_order* me = [[SUP101Sales_order alloc] init];
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
- (SUP101Sales_order*)getDownloadState
{
    return (SUP101Sales_order*)[self i_getDownloadState];
}

- (SUP101Sales_order*) getOriginalState
{
    return (SUP101Sales_order*)[self i_getOriginalState];
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
    case 17:
        return self.surrogateKey;
    default:
         return [super getAttributeLong:id_];
    }
}

-(void) setAttributeLong:(int)id_:(SUPLong)v
{
    switch(id_)
    {
    case 17:
        self.surrogateKey = v;
        break;;
    default:
        [super setAttributeLong:id_:v];
        break;;
    }
}
-(SUPString) getAttributeNullableString:(int)id_
{
    switch(id_)
    {
    case 14:
        return self.fin_code_id;
    case 15:
        return self.region;
    default:
         return [super getAttributeNullableString:id_];
    }
}

-(void) setAttributeNullableString:(int)id_:(SUPString)v
{
    switch(id_)
    {
    case 14:
        self.fin_code_id = v;
        break;;
    case 15:
        self.region = v;
        break;;
    default:
        [super setAttributeNullableString:id_:v];
        break;;
    }
}
-(SUPDate) getAttributeDate:(int)id_
{
    switch(id_)
    {
    case 13:
        return self.order_date;
    default:
         return [super getAttributeDate:id_];
    }
}

-(void) setAttributeDate:(int)id_:(SUPDate)v
{
    switch(id_)
    {
    case 13:
        self.order_date = v;
        break;;
    default:
        [super setAttributeDate:id_:v];
        break;;
    }
}
-(SUPNullableLong) getAttributeNullableLong:(int)id_
{
    switch(id_)
    {
    case 110:
        return self.customerFK;
    default:
         return [super getAttributeNullableLong:id_];
    }
}

-(void) setAttributeNullableLong:(int)id_:(SUPNullableLong)v
{
    switch(id_)
    {
    case 110:
        self.customerFK = v;
        break;;
    default:
        [super setAttributeNullableLong:id_:v];
        break;;
    }
}
-(SUPBoolean) getAttributeBoolean:(int)id_
{
    switch(id_)
    {
    case 111:
        return self.customerValid;
    default:
         return [super getAttributeBoolean:id_];
    }
}

-(void) setAttributeBoolean:(int)id_:(SUPBoolean)v
{
    switch(id_)
    {
    case 111:
        self.customerValid = v;
        break;;
    default:
        [super setAttributeBoolean:id_:v];
        break;;
    }
}
-(SUPInt) getAttributeInt:(int)id_
{
    switch(id_)
    {
    case 11:
        return self.id_;
    case 12:
        return self.cust_id;
    case 16:
        return self.sales_rep;
    default:
         return [super getAttributeInt:id_];
    }
}

-(void) setAttributeInt:(int)id_:(SUPInt)v
{
    switch(id_)
    {
    case 11:
        self.id_ = v;
        break;;
    case 12:
        self.cust_id = v;
        break;;
    case 16:
        self.sales_rep = v;
        break;;
    default:
        [super setAttributeInt:id_:v];
        break;;
    }
}
-(id) getAttributeObject:(int)id_:(BOOL)loadFromDBIfInvalid
{
    switch(id_)
    {
    case 18:
        if (loadFromDBIfInvalid)
        {
            return self.customer;
        } else
        {
            return _customer;
        }
    default:
         return [super getAttributeObject:id_];
    }
}

-(void) setAttributeObject:(int)id_:(id)v
{
    switch(id_)
    {
    case 18:
        self.customer = v;
        break;;
    default:
        [super setAttributeObject:id_:v];
        break;;
    }
}
- (SUPObjectList*)getLogRecords
{
   return [SUP101LogRecordImpl findByEntity:@"Sales_order":[self keyToString]];
}




- (NSString*)toString
{
	NSString* str = [NSString stringWithFormat:@"\
	Sales_order = \n\
	    id = %i,\n\
	    cust_id = %i,\n\
	    order_date = %@,\n\
	    fin_code_id = %@,\n\
	    region = %@,\n\
	    sales_rep = %i,\n\
	    pending = %i,\n\
	    pendingChange = %c,\n\
	    replayPending = %qi,\n\
	    replayFailure = %qi,\n\
	    customerFK = %@,\n\
	    customerValid = %i,\n\
	    surrogateKey = %qi,\n\
	    replayCounter = %qi,\n\
	    disableSubmit = %i,\n\
	    isNew = %i,\n\
        isDirty = %i,\n\
        isDeleted = %i,\n\
	\n"
    	,self.id_
    	,self.cust_id
    	,self.order_date
    	,self.fin_code_id
    	,self.region
    	,self.sales_rep
    	,self.pending
    	,self.pendingChange
    	,self.replayPending
    	,self.replayFailure
    	,self.customerFK
    	,self.customerValid
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
	_selectSQL = [[[NSMutableString alloc] initWithCapacity:296] autorelease];
	[_selectSQL appendString:@" x.\"a\",x.\"b\",x.\"c\",x.\"d\",x.\"e\",x.\"f\",x.\"_pf\",x.\"_pc\",x.\"_rp\",x.\"_rf\",x.\"customerFK\",x.\"g\",x.\"_rc\",x.\"_ds\" FROM \"sup101_1_0_sales_order\" x where (((x.\"_pf\" = 1 or not exists (select x_os.\"g\" from \"sup101_1_0_sales_order_os\" x_os where x_os.\"g\" = x.\"g\"))))"];
	sql = [[NSMutableString alloc] initWithFormat:@"select %@", _selectSQL];
	[sql autorelease];
	sql = [[NSMutableString alloc] initWithFormat:@"select %@", _selectSQL];
	[sql autorelease];
	SUPStringList *ids = [SUPStringList listWithCapacity:0];
	SUPObjectList *dts = [SUPObjectList getInstance];
	SUPObjectList* values = [SUPObjectList getInstance];
	return (SUPObjectList*)[[[self class] delegate] findWithSQL:sql withDataTypes:dts withValues:values withIDs:ids withSkip:skip withTake:take withClass:[SUP101Sales_order class]];
}



+ (SUP101Sales_order*)findByPrimaryKey:(int32_t)id_
{
	NSMutableString *sql = nil;
	NSMutableString *_selectSQL = nil;
	_selectSQL = [[[NSMutableString alloc] initWithCapacity:330] autorelease];
	[_selectSQL appendString:@"SELECT x.\"a\",x.\"b\",x.\"c\",x.\"d\",x.\"e\",x.\"f\",x.\"_pf\",x.\"_pc\",x.\"_rp\",x.\"_rf\",x.\"customerFK\",x.\"g\",x.\"_rc\",x.\"_ds\" FROM \"sup101_1_0_sales_order\" x WHERE (((x.\"_pf\" = 1 or not exists (select x_os.\"g\" from \"sup101_1_0_sales_order_os\" x_os where x_os.\"g\" = x.\"g\")))) and ( x.\""
	                               "a\" = ?)"];
	sql = [[NSMutableString alloc] initWithFormat:@"%@", _selectSQL];
	[sql autorelease];
	SUPStringList *ids = [SUPStringList listWithCapacity:0];
	SUPObjectList *dts = [SUPObjectList getInstance];
	[dts addObject:[SUPDataType forName:@"int"]];
	SUPObjectList* values = [SUPObjectList getInstance];
	[values addObject:[NSNumber numberWithInt:id_]];
	
	SUPObjectList* res = (SUPObjectList*)[[[self class] delegate] findWithSQL:sql withDataTypes:dts withValues:values withIDs:ids withClass:[SUP101Sales_order class]];
	if(res && ([res size] > 0))
	{   
		SUP101Sales_order* cus = (SUP101Sales_order*)[res item:0];
	    return cus;
	}
	else
	    return nil;
}



+ (SUPObjectList*)getCustomerSalesOrders_for_Customer:(NSNumber*)surrogateKey
{
	return [self getCustomerSalesOrders_for_Customer:surrogateKey skip:0 take:INT_MAX]; 
}


	

+ (SUPObjectList*)getCustomerSalesOrders_for_Customer:(NSNumber*)surrogateKey skip:(int32_t)skip take:(int32_t)take
{
	NSMutableString *sql = nil;
	NSMutableString *_selectSQL = nil;
	_selectSQL = [[[NSMutableString alloc] initWithCapacity:331] autorelease];
	[_selectSQL appendString:@" x.\"a\",x.\"b\",x.\"c\",x.\"d\",x.\"e\",x.\"f\",x.\"_pf\",x.\"_pc\",x.\"_rp\",x.\"_rf\",x.\"customerFK\",x.\"g\",x.\"_rc\",x.\"_ds\" from \"sup101_1_0_sales_order\" x where (((x.\"_pf\" = 1 or not exists (select x_os.\"g\" from \"sup101_1_0_sales_order_os\" x_os where x_os.\"g\" = x.\"g\")))) and ( x.\"custom"
	                               "erFK\"=?)"];
	sql = [[NSMutableString alloc] initWithFormat:@"select %@", _selectSQL];
	[sql autorelease];
	SUPStringList *ids = [SUPStringList listWithCapacity:0];
	SUPObjectList *dts = [SUPObjectList getInstance];
	[dts addObject:[SUPDataType forName:@"long?"]];
	SUPObjectList* values = [SUPObjectList getInstance];
	[values addObject:surrogateKey];
	return (SUPObjectList*)[[[self class] delegate] findWithSQL:sql withDataTypes:dts withValues:values withIDs:ids withSkip:skip withTake:take withClass:[SUP101Sales_order class]];
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