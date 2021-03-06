#import "sybase_sup.h"

#import "SUPClassWithMetaData.h"
#import "SUPAbstractStructure.h"


@class SUPClassDelegate;
@class SUPClassMetaDataRBS;

// public interface declaration, can be used by application. 
/*!
 @class SUP101KeyPackageName
 @abstract This class is part of package "SUP101:1.0"
 @discussion Generated by Sybase Unwired Platform, compiler version 2.1.3.231
*/

@interface SUP101KeyPackageName : SUPAbstractStructure<SUPClassWithMetaData>
{
@private
    NSString* _key_name;
    NSString* _package_name;
    NSString* _user_name;
    NSString* _domain_name;
}

@property(retain,nonatomic) NSString* key_name;
@property(retain,nonatomic) NSString* package_name;
@property(retain,nonatomic) NSString* user_name;
@property(retain,nonatomic) NSString* domain_name;

- (id) init;
- (void)dealloc;
/*!
  @method 
  @abstract Creates a new autoreleased instance of this class
  @discussion
 */
+ (SUP101KeyPackageName*)getInstance;
+ (SUPClassDelegate *)delegate;
+ (SUPClassMetaDataRBS*)metaData;
- (SUPClassMetaDataRBS*)getClassMetaData;


@end
typedef SUPObjectList SUP101KeyPackageNameList;

// internal methods declaration, only used by generated code.
@interface SUP101KeyPackageName(internal)


- (SUPJsonObject*)getAttributeJson:(int)id_;
- (void)setAttributeJson:(int)id_:(SUPJsonObject*)value;

-(SUPString) getAttributeString:(int)id_;
-(void) setAttributeString:(int)id_:(SUPString)v;
@end