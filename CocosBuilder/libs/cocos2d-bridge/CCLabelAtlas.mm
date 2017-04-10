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
    cocos2d::LabelAtlas* label = cocos2d::LabelAtlas::create([theString UTF8String], [fntFile UTF8String]);
    label->retain();
    
    isNeedCCLabelAtlasDealloc_ = YES;
    impl_ = label;
    
    self = [super init: impl_];
    return self;
}

-(id) initWithString:(NSString*)string charMapFile: (NSString*)filename itemWidth:(NSUInteger)w itemHeight:(NSUInteger)h startCharMap:(NSUInteger)c
{
    cocos2d::LabelAtlas* label = cocos2d::LabelAtlas::create([string UTF8String], [filename UTF8String], w, h, c);
    label->retain();
    
    isNeedCCLabelAtlasDealloc_ = YES;
    impl_ = label;
    
    self = [super init: impl_];
    return self;
}

-(id) initWithString:(NSString*) theString texture:(CCTexture2D*)texture itemWidth:(NSUInteger)w itemHeight:(NSUInteger)h startCharMap:(NSUInteger)c
{
    cocos2d::Texture2D* cppTexture = static_cast<cocos2d::Texture2D*>([texture getImpl]);
    
    cocos2d::LabelAtlas* label = new (std::nothrow) cocos2d::LabelAtlas();
    label->initWithString([theString UTF8String], cppTexture, w, h, c);
    label->autorelease(); 
    label->retain();
    
    isNeedCCLabelAtlasDealloc_ = YES;
    impl_ = label;
    
    self = [super init: impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLabelAtlasDealloc_)
    {
        cocos2d::LabelAtlas* label = static_cast<cocos2d::LabelAtlas*>(impl_);
        label->release();
    }
    
    [super dealloc];
}

#pragma mark CCLabelAtlas - Atlas generation

-(void)updateAtlasValues
{
    cocos2d::LabelAtlas* atlas = static_cast<cocos2d::LabelAtlas*>(impl_);
    atlas->updateAtlasValues();
}

-(void)setString:(NSString *)label
{
    cocos2d::LabelAtlas* atlas = static_cast<cocos2d::LabelAtlas*>(impl_);
    atlas->setString([label UTF8String]);
}

-(NSString *)string
{
    cocos2d::LabelAtlas* atlas = static_cast<cocos2d::LabelAtlas*>(impl_);
    return [NSString stringWithCString: atlas->getString().c_str() encoding:NSUTF8StringEncoding];
}

#pragma mark CCLabelAtlas - DebugDraw

#if CC_LABELATLAS_DEBUG_DRAW
- (void) draw
{
    // TODO: different param for debug draw.
    NSAssert( NO, @"Not supported - Cpp protected functions.");
    // atlas->draw(renderer, transform, flags);
}
#endif // CC_LABELATLAS_DEBUG_DRAW

@end







