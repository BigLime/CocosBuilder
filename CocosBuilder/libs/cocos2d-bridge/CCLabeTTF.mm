//
// CCLabelTTF wrapper
//
// author xiaobo.wang
//
// 2017-04-07 12:00:53
//
#import "CCLabeTTF.h"
#import "2d/CCLabelTTF.h"

#import "ccTypeConvert.h"

#if CC_USE_LA88_LABELS
#define SHADER_PROGRAM kCCShader_PositionTextureColor
#else
#define SHADER_PROGRAM kCCShader_PositionTextureA8Color
#endif

@implementation CCLabelTTF

// -
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size
{
    return [[[self alloc] initWithString:string fontName:name fontSize:size] autorelease];
}

// hAlignment
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment
{
    return [[[self alloc] initWithString:string  fontName:name fontSize:size dimensions:dimensions hAlignment:alignment vAlignment:kCCVerticalTextAlignmentTop lineBreakMode:kCCLineBreakModeWordWrap] autorelease];
}

// hAlignment, vAlignment
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment) vertAlignment
{
    return [[[self alloc] initWithString:string fontName:name fontSize:size dimensions:dimensions hAlignment:alignment vAlignment:vertAlignment]autorelease];
}

// hAlignment, lineBreakMode
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment lineBreakMode:(CCLineBreakMode)lineBreakMode
{
    return [[[self alloc] initWithString:string fontName:name fontSize:size dimensions:dimensions hAlignment:alignment vAlignment:kCCVerticalTextAlignmentTop lineBreakMode:lineBreakMode]autorelease];
}

// hAlignment, vAlignment, lineBreakMode
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment) vertAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode
{
    return [[[self alloc] initWithString:string fontName:name fontSize:size dimensions:dimensions hAlignment:alignment vAlignment:vertAlignment lineBreakMode:lineBreakMode]autorelease];
}

- (id) init
{
    return [self initWithString:@"" fontName:@"Helvetica" fontSize:12];
}

- (id) initWithString:(NSString*)str fontName:(NSString*)name fontSize:(CGFloat)size
{
    return [self initWithString:str fontName:name fontSize:size dimensions:CGSizeZero hAlignment:kCCTextAlignmentLeft vAlignment:kCCVerticalTextAlignmentTop lineBreakMode:kCCLineBreakModeWordWrap];
}

// hAlignment
- (id) initWithString:(NSString*)str fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment
{
    return [self initWithString:str fontName:name fontSize:size dimensions:dimensions hAlignment:alignment vAlignment:kCCVerticalTextAlignmentTop lineBreakMode:kCCLineBreakModeWordWrap];
}

// hAlignment, vAlignment
- (id) initWithString:(NSString*)str fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment) vertAlignment
{
    return [self initWithString:str fontName:name fontSize:size dimensions:dimensions hAlignment:alignment vAlignment:vertAlignment lineBreakMode:kCCLineBreakModeWordWrap];
}

// hAlignment, lineBreakMode
- (id) initWithString:(NSString*)str fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment lineBreakMode:(CCLineBreakMode)lineBreakMode
{
    return [self initWithString:str fontName:name fontSize:size dimensions:dimensions hAlignment:alignment vAlignment:kCCVerticalTextAlignmentTop lineBreakMode:lineBreakMode];
}

// hAlignment, vAligment, lineBreakMode
- (id) initWithString:(NSString*)str  fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment) vertAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode
{
    // TODO: convert CGFloat CGSize CCTextAlignment CCVertialTextAlignment.
    // TODO: no lineBreakeMode in 2dx 3.14.
    
    cocos2d::Size cppDim = [ccTypeConvert CGSizeToSize: dimensions];
    
    cocos2d::TextHAlignment hAlign = [ccTypeConvert CCTextAlignmentToTextHAlignment:alignment];
    cocos2d::TextVAlignment vAlign = [ccTypeConvert CCVerticalTextAlignmentToTextVAlignment:vertAlignment];
    
    
    cocos2d::LabelTTF* label = cocos2d::LabelTTF::create([str UTF8String], [name UTF8String], size, cppDim, hAlign, vAlign);
    label->retain();

    impl_ = label;
    isNeedCCLabelTTFDealloc_ = YES;

    
    self = [super init: impl_];
    return self;
}

-(void)setString:(NSString *)str
{
    cocos2d::LabelTTF* label = static_cast<cocos2d::LabelTTF*>(impl_);
    label->setString([str UTF8String]);
}

-(void)setFontName:(NSString *)fontName
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    label->setString([fontName UTF8String]);
}

-(NSString *)fontName
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    return [NSString stringWithCString:label->getFontName().c_str() encoding:NSUTF8StringEncoding];
}

-(void)setFontSize:(float)fontSize
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    label->setFontSize(fontSize);
}

-(float)fontSize
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    return label->getFontSize();
}

-(void)setDimensions:(CGSize)dim
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    label->setDimensions([ccTypeConvert CGSizeToSize: dim]);
}

-(CGSize)dimensions
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    return [ccTypeConvert SizeToCGSize: label->getDimensions()];
}

-(void) setHorizontalAlignment:(CCTextAlignment)alignment
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    label->setHorizontalAlignment([ccTypeConvert CCTextAlignmentToTextHAlignment:alignment]);
}

- (CCTextAlignment) horizontalAlignment
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    return [ccTypeConvert TextHAlignmentToCCTextAlignment:label->getHorizontalAlignment()];
}

-(void) setVerticalAlignment:(CCVerticalTextAlignment)verticalAlignment
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    label->setVerticalAlignment([ccTypeConvert CCVerticalTextAlignmentToTextVAlignment:verticalAlignment]);
}

- (CCVerticalTextAlignment) verticalAlignment
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    return [ccTypeConvert TextVAlignmentToCCVerticalTextAlignment:label->getVerticalAlignment()];
}

- (void) dealloc
{
    if (isNeedCCLabelTTFDealloc_)
        ((cocos2d::LabelTTF*)impl_)->release();
    
    [super dealloc];
}

- (NSString*) description
{
    cocos2d::LabelTTF* label = (cocos2d::LabelTTF*)impl_;
    return [NSString stringWithCString:label->getDescription().c_str() encoding:NSUTF8StringEncoding];
}

@end
































