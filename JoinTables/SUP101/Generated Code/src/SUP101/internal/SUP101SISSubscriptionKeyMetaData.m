#import "SUP101SISSubscriptionKeyMetaData.h"

#import "SUPParameterMetaData.h"
#import "SUPAttributeMap.h"
#import "SUPObjectList.h"
#import "SUPClassMap.h"
#import "SUPEntityMap.h"
#import "SUP101SISSubscriptionKey.h"
#import "SUPDataType.h"
#import "SUPAttributeMetaDataRBS.h"

@implementation SUP101SISSubscriptionKeyMetaData

+ (SUP101SISSubscriptionKeyMetaData*)getInstance
{
    return [[[SUP101SISSubscriptionKeyMetaData alloc] init] autorelease];
}

- (id)init
{
	if (self = [super init]) {
		self.name = @"SISSubscriptionKey";
		self.klass = [SUP101SISSubscriptionKey class];
 
		SUPObjectList *attributes = [SUPObjectList listWithCapacity:7];
		SUPAttributeMetaDataRBS* a_domain = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			53:
			[SUPDataType forName:@"string"]:@"varchar(300)":@"domain":@"":@"":
			@"":300:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_domain];
		SUPAttributeMetaDataRBS* a_package = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			54:
			[SUPDataType forName:@"string"]:@"varchar(300)":@"package":@"":@"":
			@"":300:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_package];
		SUPAttributeMetaDataRBS* a_syncGroup = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			55:
			[SUPDataType forName:@"string"]:@"varchar(300)":@"syncGroup":@"":@"":
			@"":300:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_syncGroup];
		SUPAttributeMetaDataRBS* a_clientId = [SUPAttributeMetaDataRBS attributeMetaDataWith:
			56:
			[SUPDataType forName:@"string"]:@"varchar(300)":@"clientId":@"":@"":
			@"":300:0:0:
			@"null":NO:@"":
			NO:NO:NO:NO:NO:NO:
			GeneratedScheme_NONE:
			NO:SUPPersonalizationType_None:NO];
  		[attributes addThis:a_clientId];
 		self.attributes = attributes;
 		
 		SUPAttributeMap * attributeMap = [SUPAttributeMap getInstance];
    	[attributeMap setAttributes:attributes];
    	self.attributeMap = attributeMap;

	}
    return self;
}
@end