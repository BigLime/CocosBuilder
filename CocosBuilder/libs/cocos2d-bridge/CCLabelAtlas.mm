//
// CCLabelAtlas Wrapper
//
// author xiaobo.wang
//
// 2017-04-06 22:34:46
//

#import "CCLabelAtlas.h"
#import "2d/CCLabelAtlas.h"


@implementation CCLabelAtlas

#pragma mark CCLabelAtlas - Creation & Init
+(id) labelWithString:(NSString*)string charMapFile:(NSString*)charmapfile itemWidth:(NSUInteger)w itemHeight:(NSUInteger)h startCharMap:(NSUInteger)c
{
    return [[[self alloc] initWithString:string charMapFile:charmapfile itemWidth:w itemHeight:h startCharMap:c] autorelease];
}

+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile
{
    return [[[self alloc] initWithString:string fntFile:fntFile] autorelease];
}

-(id) initWithString:(NSString*) theString fntFile:(NSString*)fntFile
{
    impl_ = cocos2d::LabelAtlas::create([theString UTF8String], [fntFile UTF8String]);
    impl_->retain();
    
    isNeedCCLabelAtlasDealloc_ = YES;
    
    self = [super init: self];
    return self;
}

-(id) initWithString:(NSString*)string charMapFile: (NSString*)filename itemWidth:(NSUInteger)w itemHeight:(NSUInteger)h startCharMap:(NSUInteger)c
{
    impl_ = cocos2d::LabelAtlas::create([string UTF8String], [filename UTF8String], w, h, c);
    impl_->retain();
    
    isNeedCCLabelAtlasDealloc_ = YES;
    
    self = [super init: self];
    return self;
}

-(id) initWithString:(NSString*) theString texture:(CCTexture2D*)texture itemWidth:(NSUInteger)w itemHeight:(NSUInteger)h startCharMap:(NSUInteger)c
{
    impl_ = cocos2d::LabelAtlas::create([theString UTF8String], [texture getImpl], w, h, c);
    impl_->retain();
    
    isNeedCCLabelAtlasDealloc_ = YES;
    
    self = [super init: self];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLabelAtlasDealloc_)
        impl_->release();
    
    [super dealloc];
}

#pragma mark CCLabelAtlas - Atlas generation

-(void)updateAtlasValues
{
    (cocos2d::CCLabelAtlas*) atlas = (cocos2d::CCLabelAtlas*)impl_;
    atlas->updateAtlasValues();
}

#pragma mark CCLabelAtlas - CCLabelProtocol

-(void)setString:(NSString *)label
{
    (cocos2d::CCLabelAtlas*) atlas = (cocos2d::CCLabelAtlas*)impl_;
    atlas->setString([label UTF8String]);
}

-(NSString *)string
{
    (cocos2d::CCLabelAtlas*) atlas = (cocos2d::CCLabelAtlas*)impl_;
    return [NSString stringWithCString: atlas->getString().c_str() encoding:NSUTF8StringEncoding];
}

#pragma mark CCLabelAtlas - DebugDraw

#if CC_LABELATLAS_DEBUG_DRAW
- (void) draw
{
    (cocos2d::CCLabelAtlas*) atlas = (cocos2d::CCLabelAtlas*)impl_;
    
    // TODO: different param for debug draw.
    // atlas->draw(renderer, transform, flags);
}
#endif // CC_LABELATLAS_DEBUG_DRAW



























@end
