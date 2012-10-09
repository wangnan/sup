#import "sybase_sup.h"

#import "SUPClassWithMetaData.h"
#import "SUPAbstractEntityRBS.h"
#import "SUPMobileBusinessObject.h"
#import "SUPEntityDelegate.h"


@class SUPEntityMetaDataRBS;
@class SUPEntityDelegate;
@class SUPClassMetaDataRBS;
@class SUPQuery;

// public interface declaration, can be used by application. 
/*!
 @class SUP101Sales_order_items
 @abstract This class is part of package "SUP101:1.0"
 @discussion Generated by Sybase Unwired Platform, compiler version 2.1.3.231
*/

@interface SUP101Sales_order_items : SUPAbstractEntityRBS<SUPMobileBusinessObject, SUPClassWithMetaData>
{
@private
    int32_t _id;
    short _line_id;
    int32_t _prod_id;
    int32_t _quantity;
    NSDate* _ship_date;
    int64_t _surrogateKey;
}

@property(assign,nonatomic) int32_t id_;
@property(assign,nonatomic) short line_id;
@property(assign,nonatomic) int32_t prod_id;
@property(assign,nonatomic) int32_t quantity;
@property(retain,nonatomic) NSDate* ship_date;
@property(assign,nonatomic) int64_t surrogateKey;

+ (SUPEntityMetaDataRBS*)metaData;
+ (SUPEntityDelegate *)delegate;
+ (void) registerCallbackHandler:(NSObject<SUPCallbackHandler>*)handler;
+ (NSObject<SUPCallbackHandler>*)callbackHandler;
- (SUPClassMetaDataRBS*)getClassMetaData;
/*!
  @method 
  @abstract Sets relationship attributes to null to save memory (they will be retrieved from the DB on the next getter call or property reference)
  @discussion
  @throws SUPPersistenceException
 */
- (void)clearRelationshipObjects;
- (id) init;
- (void)dealloc;
/*!
  @method 
  @abstract Returns the entity for the primary key value passed in, or null if the entity is not found.
  @discussion
  @throws SUPPersistenceException
 */
+ (SUP101Sales_order_items*)find:(int64_t)id_;
/*!
  @method 
  @abstract Returns an SUPObjectList of entity rows satisfying this query
  @discussion
  @throws SUPPersistenceException
 */
+ (SUPObjectList*)findWithQuery:(SUPQuery*)query;
/*!
  @method 
  @abstract Returns the primary key for this entity.
  @discussion
 */
- (int64_t)_pk;
/*!
  @method 
  @abstract Returns the entity for the primary key value passed in; throws an exception if the entity is not found.
  @discussion
  @throws SUPPersistenceException
 */
+ (SUP101Sales_order_items*)load:(int64_t)id;
/*!
  @method 
  @abstract Returns an SUPObjectList of log records for this entity.
  @discussion
  @throws SUPPersistenceException
 */
- (SUPObjectList*)getLogRecords;
/*!
  @method 
  @abstract Creates a new autoreleased instance of this class
  @discussion
 */
+ (SUP101Sales_order_items*)getInstance;
/*!
  @method 
  @abstract Return a string description of this entity.
  @discussion
 */
- (NSString*)toString;
/*!
  @method 
  @abstract Return a string description of this entity.
  @discussion
 */
- (NSString*)description;
+ (void) submitPendingOperations;
+ (void) cancelPendingOperations;
- (SUPString)getLastOperation;
+ (SUPObjectList*)getPendingObjects;
+ (SUPObjectList*)getPendingObjects:(int32_t)skip take:(int32_t)take;
/*!
  @method
  @abstract Generated from an object query defined in the Eclipse tooling project for this package
  @throws SUPPersistenceException
 */

+ (SUPObjectList*)findAll;

/*!
  @method
  @abstract Generated from an object query defined in the Eclipse tooling project for this package
  @param skip
  @param take
  @throws SUPPersistenceException
 */

+ (SUPObjectList*)findAll:(int32_t)skip take:(int32_t)take;
/*!
  @method
  @abstract Generated from an object query defined in the Eclipse tooling project for this package
  @param id_
  @throws SUPPersistenceException
 */

+ (SUPObjectList*)findById:(int32_t)id_;

/*!
  @method
  @abstract Generated from an object query defined in the Eclipse tooling project for this package
  @param id_
  @param skip
  @param take
  @throws SUPPersistenceException
 */

+ (SUPObjectList*)findById:(int32_t)id_ skip:(int32_t)skip take:(int32_t)take;
/*!
  @method
  @abstract Generated from an object query defined in the Eclipse tooling project for this package
  @param line_id
  @throws SUPPersistenceException
 */

+ (SUPObjectList*)findByLine_id:(short)line_id;

/*!
  @method
  @abstract Generated from an object query defined in the Eclipse tooling project for this package
  @param line_id
  @param skip
  @param take
  @throws SUPPersistenceException
 */

+ (SUPObjectList*)findByLine_id:(short)line_id skip:(int32_t)skip take:(int32_t)take;
/*!
  @method
  @abstract Generated from an object query defined in the Eclipse tooling project for this package
  @param id_
  @param line_id
  @throws SUPPersistenceException
 */

+ (SUP101Sales_order_items*)findByPrimaryKey:(int32_t)id_ withLine_id:(short)line_id;
/*!
  @method
  @abstract Generated class method 
  @param query
  @throws SUPPersistenceException
 */
+ (int32_t)getSize:(SUPQuery*)query;


@end
typedef SUPObjectList SUP101Sales_order_itemsList;

// internal methods declaration, only used by generated code.
@interface SUP101Sales_order_items(internal)


- (SUPJsonObject*)getAttributeJson:(int)id_;
- (void)setAttributeJson:(int)id_:(SUPJsonObject*)value;

-(SUPLong) getAttributeLong:(int)id_;
-(void) setAttributeLong:(int)id_:(SUPLong)v;
-(SUPDate) getAttributeDate:(int)id_;
-(void) setAttributeDate:(int)id_:(SUPDate)v;
-(SUPShort) getAttributeShort:(int)id_;
-(void) setAttributeShort:(int)id_:(SUPShort)v;
-(SUPInt) getAttributeInt:(int)id_;
-(void) setAttributeInt:(int)id_:(SUPInt)v;
@end