#import "Kiwi.h"
#import "RSSParser.h"

SPEC_BEGIN(RSSParserSpecs)

describe(@"Unit tests", ^{
    it(@"are very useful", ^{
        NSUInteger a = 20;
        NSUInteger b = 88;
        [[theValue(a + b) should] equal:theValue(108)];
        [[theValue(b - a - 50) should] equal:theValue(18)];
    });
});

describe(@"RSSParser", ^{
    
    __block RSSParser *_parser;
    
    beforeEach(^{
        _parser = [[[RSSParser alloc] init] autorelease];
    });
    
    it(@"can be initialized", ^{
        [[_parser shouldNot] beNil];
        [[_parser should] beKindOfClass:[RSSParser class]];
        [[_parser should] conformToProtocol:@protocol(NSXMLParserDelegate)];
    });
    
    it(@"can parse data", ^{
        NSData *data = nil;
        [_parser parseWithData:data];
    });
});

SPEC_END