//
// CCLabelBMFont Wrapper
//
// author xiaobo.wang
//
// 2017-04-06 22:34:34
//

#import "CCLabelBMFont.h"
#import "2d/CCLabelBMFont.h"

#pragma mark -
#pragma mark CCLabelBMFont


#pragma mark -
#pragma mark CCLabelBMFont

@implementation CCLabelBMFont

// @synthesize alignment = _alignment;
-(void)setAlignment:(CCTextAlignment)alignment
{
    // TODO: convert CCTextAlignment to cocos2d::TextHAlignment.
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    impl_->setAlignment([alignment getImpl]);
}

-(CCTextAlignment)alignment
{
    // TODO: no getter
    return kCCTextAlignmentLeft;
}

// @synthesize cascadeColorEnabled = _cascadeColorEnabled, cascadeOpacityEnabled = _cascadeOpacityEnabled;

-(void)setCascadeColorEnabled:(BOOL)cascadeColorEnabled
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setCascadeColorEnabled(cascadeColorEnabled);
}

-(BOOL)isCascadeColorEnabled
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    return label->isCascadeColorEnabled();
}

-(void)setCascadeOpacityEnabled:(BOOL)cascadeOpacityEnabled
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setCascadeOpacityEnabled(cascadeOpacityEnabled);
}

-(BOOL)isCascadeOpacityEnabled
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
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
    return [self initWithString:nil fntFile:nil width:kCCLabelAutomaticWidth alignment:kCCTextAlignmentLeft imageOffset:CGPointZero];
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
    impl_ = cocos2d::LabelBMFont::create([theString UTF8String], [fntFile UTF8String], width, alignment, offset);
    impl_->retain();
    
    isNeedCCLabelBMFontDealloc = YES;
    
    self = [super init:self];
    return self;
}

-(void) dealloc
{
    if (isNeedCCLabelBMFontDealloc)
        impl_->release();
    
    [super dealloc];
}

-(void) createFontChars
{
    // TODO: no implement in cocos2d-x cpp side.
}

#pragma mark LabelBMFont - CCLabelProtocol protocol
-(NSString*) string
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    return [NSString stringWithCString: label->getString().c_str() encoding:NSUTF8StringEncoding];
}

-(void) setCString:(char*)label
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setString(label);
}

- (void) setString:(NSString*)newString
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setString([newString UTF8String]);
}

#pragma mark LabelBMFont - CCRGBAProtocol protocol

-(ccColor3B) color
{
    // TODO: convert ccColor3B.
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    return label->getColor();
}

-(ccColor3B) displayedColor
{
    // TODO: convert ccColor3B.
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    return label->getDisplayedColor();
}

-(void) setColor:(ccColor3B)color
{
    // TODO: convert ccColor3B.
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setColor(color);
}

-(GLubyte) opacity
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    return label->getOpacity();
}

-(GLubyte) displayedOpacity
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    return label->getDisplayedOpacity();
}

/** Override synthesized setOpacity to recurse items */
- (void) setOpacity:(GLubyte)opacity
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setOpacity(opacity);
}

-(void) setOpacityModifyRGB:(BOOL)modify
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setOpacityModifyRGB(modify);
}

-(BOOL) doesOpacityModifyRGB
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    return label->isOpacityModifyRGB();
}

- (void)updateDisplayedOpacity:(GLubyte)parentOpacity
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->updateDisplayedOpacity(parentOpacity);
}

- (void)updateDisplayedColor:(ccColor3B)parentColor
{
    // TODO: convert ccColor3B.
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->updateDisplayedColor(parentColor);
}

#pragma mark LabelBMFont - AnchorPoint
-(void) setAnchorPoint:(CGPoint)point
{
    // TODO: convert CGPoint.
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setAnchorPoint(point);
}

#pragma mark LabelBMFont - Alignment
- (void)setWidth:(float)width
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setWidth(width);
}

#pragma mark LabelBMFont - FntFile
- (void) setFntFile:(NSString*) fntFile
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    label->setFntFile([fntFile UTF8String]);
}

- (NSString*) fntFile
{
    (cocos2d::LabelBMFont*) label = (cocos2d::LabelBMFont*)impl_;
    return [NSString stringWithCString: label->getFntFile().c_str() encoding:NSUTF8StringEncoding];
}

#pragma mark LabelBMFont - Debug draw
#if CC_LABELBMFONT_DEBUG_DRAW
-(void) draw
{
    (cocos2d::CCLabelAtlas*) atlas = (cocos2d::CCLabelAtlas*)impl_;
    
    // TODO: different param for debug draw.
    // atlas->draw(renderer, transform, flags);
}
#endif // CC_LABELBMFONT_DEBUG_DRAW
@end



