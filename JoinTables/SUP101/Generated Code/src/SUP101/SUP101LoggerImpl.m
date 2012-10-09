#import "SUP101LoggerImpl.h"
#import "SUP101LogRecordImpl.h"
#import "SUP101KeyGenerator.h"

@implementation SUP101LoggerImpl

- (id<SUPLogRecord>)createRealLogRecord
{
	SUP101LogRecordImpl *log = [SUP101LogRecordImpl getInstance];
	log.messageId = [SUP101KeyGenerator generateId];
	log.requestId = [NSString stringWithFormat:@"%ld",log.messageId];
    log.timestamp = [NSDate dateWithTimeIntervalSinceNow:0];
	log.code = 9999;
	log.component = @"SUP101DB";
	return log;
}


@end