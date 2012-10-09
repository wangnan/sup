#import "sybase_sup.h"
#import "SUPLocalKeyGenerator.h"
#import "SUPKeyGeneratorPK.h"
#import "SUPClassWithMetaData.h"

@class SUPEntityMetaDataRBS;
@protocol SUPClassWithMetaData;
@class SUPLocalEntityDelegate;
@class SUPClassMetaDataRBS;
@class SUP101LocalKeyGeneratorPK;

// public interface declaration, can be used by application.
/*!
 @class SUP101LocalKeyGenerator
 @abstract This class is part of package "SUP101:1.0"
 @discussion Generated by Sybase Unwired Platform, compiler version 2.1.3.231
*/

@interface SUP101LocalKeyGenerator : SUPLocalKeyGenerator<SUPClassWithMetaData>
{
}
+ (SUPLocalEntityDelegate *)delegate;
+ (SUPEntityMetaDataRBS*)metaData;
/*!
  @method 
  @abstract Creates a new autoreleased instance of this class
  @discussion
 */
+ (SUP101LocalKeyGenerator*)getInstance;
- (SUPClassMetaDataRBS*)getClassMetaData;
+ (int64_t) generateId;


@end