//
// CCLabelBMFont Wrapper
//
// author xiaobo.wang
//
// 2017-04-06 22:34:34
//

#import "CCLabelBMFont.h"
#import "2d/CCLabelBMFont.h"

#import "ccTypeConvert.h"

@implementation CCLabelBMFont

- (CCTextureAtlas*) textureAtlas
{
    return [[[CCTextureAtlas alloc ]initWithObject: ((cocos2d::TextureAtlas*)impl_)->getTexture()] autorelease];
}

- (ccBlendFunc) blendFunc
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return [ccTypeConvert BlendFuncToccBlendFunc:label->getBlendFunc()];
}
- (void) setBlendFunc:(ccBlendFunc)_blendFunc
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setBlendFunc([ccTypeConvert ccBlendFuncToBlendFunc:_blendFunc]);
}

// @synthesize alignment = _alignment;
-(void)setAlignment:(CCTextAlignment)alignment
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setAlignment([ccTypeConvert CCTextAlignmentToTextHAlignment:alignment]);
}

-(CCTextAlignment)alignment
{
    // TODO: no getter
    NSAssert(NO, @"no getter");
    return kCCTextAlignmentLeft;
}

// @synthesize cascadeColorEnabled = _cascadeColorEnabled, cascadeOpacityEnabled = _cascadeOpacityEnabled;

-(void)setCascadeColorEnabled:(BOOL)cascadeColorEnabled
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setCascadeColorEnabled(cascadeColorEnabled);
}

-(BOOL)isCascadeColorEnabled
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return label->isCascadeColorEnabled();
}

-(void)setCascadeOpacityEnabled:(BOOL)cascadeOpacityEnabled
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setCascadeOpacityEnabled(cascadeOpacityEnabled);
}

-(BOOL)isCascadeOpacityEnabled
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return label->isCascadeOpacityEnabled();
}

#pragma mark LabelBMFont - Purge Cache
+(void) purgeCachedData
{
    // TODO: NO implement in cocos2d-x 3.14.
}

#pragma mark LabelBMFont - Creation & Init

+(id) labelWithString:(NSString *)string fntFile:(NSString *)fntFile
{
    return [[[self alloc] initWithString:string fntFile:fntFile width:kCCLabelAutomaticWidth alignment:kCCTextAlignmentLeft imageOffset:CGPointZero] autorelease];
}

+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment
{
    return [[[self alloc] initWithString:string fntFile:fntFile width:width alignment:alignment imageOffset:CGPointZero] autorelease];
}

+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment imageOffset:(CGPoint)offset
{
    return [[[self alloc] initWithString:string fntFile:fntFile width:width alignment:alignment imageOffset:offset] autorelease];
}

-(id) init
{
    cocos2d::LabelBMFont* label = cocos2d::LabelBMFont::create();
    label->retain();
    
    isNeedCCLabelBMFontDealloc = YES;
    impl_ = label;
    
    self = [super init:impl_];
    return self;
}

-(id) initWithString:(NSString*)theString fntFile:(NSString*)fntFile
{
    return [self initWithString:theString fntFile:fntFile width:kCCLabelAutomaticWidth alignment:kCCTextAlignmentLeft];
}

-(id) initWithString:(NSString*)theString fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment
{
    return [self initWithString:theString fntFile:fntFile width:width alignment:alignment imageOffset:CGPointZero];
}

// designated initializer
-(id) initWithString:(NSString*)theString fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment imageOffset:(CGPoint)offset
{
    // TODO: convert CCTextAlignment, convert CGPoint.
    cocos2d::Point cppOffset = [ccTypeConvert CGPointToPoint: offset];
    cocos2d::TextHAlignment cppAlign = [ccTypeConvert CCTextAlignmentToTextHAlignment:alignment];
    
    cocos2d::LabelBMFont* label = cocos2d::LabelBMFont::create([theString UTF8String], [fntFile UTF8String], width, cppAlign, cppOffset);
    label->retain();
    
    isNeedCCLabelBMFontDealloc = YES;
    impl_ = label;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLabelBMFontDealloc)
    {
        cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
        label->release();
    }
    
    [super dealloc];
}

-(void) createFontChars
{
    // TODO: no implement in cocos2d-x cpp side.
    NSAssert(NO, @"no implement in cocos2d-x cpp side.");
}

#pragma mark LabelBMFont - CCLabelProtocol protocol
-(NSString*) string
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return [NSString stringWithCString: label->getString().c_str() encoding:NSUTF8StringEncoding];
}

-(void) setCString:(char*)lb
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setString(lb);
}

- (void) setString:(NSString*)newString
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setString([newString UTF8String]);
}

#pragma mark LabelBMFont - CCRGBAProtocol protocol

-(ccColor3B) color
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return [ccTypeConvert Color3BToccColor3B: label->getColor()];
}

-(ccColor3B) displayedColor
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return [ccTypeConvert Color3BToccColor3B: label->getDisplayedColor()];
}

-(void) setColor:(ccColor3B)color
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setColor([ccTypeConvert ccColor3BToColor3B: color]);
}

-(GLubyte) opacity
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return label->getOpacity();
}

-(GLubyte) displayedOpacity
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return label->getDisplayedOpacity();
}

/** Override synthesized setOpacity to recurse items */
- (void) setOpacity:(GLubyte)opacity
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setOpacity(opacity);
}

-(void) setOpacityModifyRGB:(BOOL)modify
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setOpacityModifyRGB(modify);
}

-(BOOL) doesOpacityModifyRGB
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return label->isOpacityModifyRGB();
}

- (void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->updateDisplayedOpacity(parentOpacity);
}

- (void)updateDisplayedColor:(ccColor3B)parentColor
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->updateDisplayedColor([ccTypeConvert ccColor3BToColor3B: parentColor]);
}

#pragma mark LabelBMFont - AnchorPoint
-(void) setAnchorPoint:(CGPoint)point
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setAnchorPoint([ccTypeConvert CGPointToPoint: point]);
}

#pragma mark LabelBMFont - Alignment
- (void)setWidth:(float)width
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setWidth(width);
}

#pragma mark LabelBMFont - FntFile
- (void) setFntFile:(NSString*) fntFile
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    label->setFntFile([fntFile UTF8String]);
}

- (NSString*) fntFile
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    return [NSString stringWithCString: label->getFntFile().c_str() encoding:NSUTF8StringEncoding];
}

#pragma mark LabelBMFont - Debug draw
#if CC_LABELBMFONT_DEBUG_DRAW
-(void) draw
{
    cocos2d::LabelBMFont* label = static_cast<cocos2d::LabelBMFont*>(impl_);
    
    // TODO: different param for debug draw.
    NSAssert(NO, @"[cocos2d::LabelBMFont]::different param for debug draw.");
    
    // atlas->draw(renderer, transform, flags);
}
#endif // CC_LABELBMFONT_DEBUG_DRAW
@end



