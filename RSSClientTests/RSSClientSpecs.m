#import "Kiwi.h"
#import "RSSParser.h"

SPEC_BEGIN(ParserSpecs)

describe(@"Unit tests", ^{
    it(@"are very useful", ^{
        NSUInteger a = 20;
        NSUInteger b = 88;
        [[theValue(a + b) should] equal:theValue(108)];
        [[theValue(b - a - 50) should] equal:theValue(18)];
    });
});

describe(@"RSSParser", ^{
    it(@"is created", ^{
        RSSParser *parser = [[[RSSParser alloc] init] autorelease];
        [[parser shouldNot] beNil];
        [parser shouldNotBeNil];
        [[parser should] beKindOfClass:[RSSParser class]];
    });
});

SPEC_END