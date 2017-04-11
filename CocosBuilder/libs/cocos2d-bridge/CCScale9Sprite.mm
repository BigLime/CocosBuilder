//
// Scale9Sprite.m
//
// Creates a 9-slice sprite.
//

#import "CCScale9Sprite.h"
#import "ui/UIScale9Sprite.h"
#import "ccTypeConvert.h"
#import "CCSpriteFrame.h"
#import "CCSpriteBatchNode.h"

@implementation CCScale9Sprite

// setter getter
-(CGSize)originalSize
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return [ccTypeConvert SizeToCGSize:sprite->getOriginalSize()];
}

// setter getter
-(void)setPreferredSize:(CGSize)preferredSize
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setPreferredSize([ccTypeConvert CGSizeToSize:preferredSize]);
}

-(CGSize)preferredSize
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return [ccTypeConvert SizeToCGSize:sprite->getPreferredSize()];
}

// setter getter
-(void)setCapInsets:(CGRect)capInsets
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setCapInsets([ccTypeConvert CGRectToRect:capInsets]);
}

-(CGRect)capInsets
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return[ccTypeConvert RectToCGRect:sprite->getCapInsets()];
}

// setter getter
-(void)setInsetLeft:(float)insetLeft
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setInsetLeft(insetLeft);
}

-(float)insetLeft
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return sprite->getInsetLeft();
}

// setter getter
-(void)setInsetTop:(float)insetTop
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setInsetTop(insetTop);
}

-(float)insetTop
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return sprite->getInsetTop();
}

// setter getter
-(void)setInsetRight:(float)insetRight
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setInsetRight(insetRight);
}

-(float)insetRight
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return sprite->getInsetRight();
}

// setter getter
-(void)setInsetBottom:(float)insetBottom
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setInsetBottom(insetBottom);
}

-(float)insetBottom
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return sprite->getInsetBottom();
}

// setter getter
-(void)setOpacity:(GLubyte)opacity
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setOpacity(opacity);
}

-(GLubyte)opacity
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return sprite->getOpacity();
}

// setter getter
-(GLubyte)displayedOpacity
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return sprite->getDisplayedOpacity();
}

// setter getter
-(void)setColor:(ccColor3B)color
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setColor([ccTypeConvert ccColor3BToColor3B:color]);
}

-(ccColor3B)color
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return [ccTypeConvert Color3BToccColor3B:sprite->getColor()];
}

// setter getter
-(ccColor3B)displayedColor
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return [ccTypeConvert Color3BToccColor3B:sprite->getDisplayedColor()];
}

// setter getter
-(void)setOpacityModifyRGB:(BOOL)opacityModifyRGB
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setOpacityModifyRGB(opacityModifyRGB);
}

-(BOOL)doesOpacityModifyRGB
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return sprite->isOpacityModifyRGB();
}

// setter getter
-(void)setCascadeColorEnabled:(BOOL)cascadeColorEnabled
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setCascadeColorEnabled(cascadeColorEnabled);
}

-(BOOL)isCascadeColorEnabled
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return sprite->isCascadeColorEnabled();
}

// setter getter
-(void)setCascadeOpacityEnabled:(BOOL)cascadeOpacityEnabled
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setCascadeOpacityEnabled(cascadeOpacityEnabled);
}

-(BOOL)isCascadeOpacityEnabled
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return sprite->isCascadeOpacityEnabled();
}

- (void)dealloc
{
    if(isNeedScale9SpriteDealloc_)
        ((cocos2d::ui::Scale9Sprite*)impl_)->release();
    [super dealloc];
}

#pragma mark Constructor - Initializers
+ (id)spriteWithFile:(NSString *)file rect:(CGRect)rect capInsets:(CGRect)capInsets
{
    cocos2d::ui::Scale9Sprite* sprite = cocos2d::ui::Scale9Sprite::create([ccTypeConvert NSStringTostring:file],
                                                                          [ccTypeConvert CGRectToRect:rect],
                                                                          [ccTypeConvert CGRectToRect:capInsets]);
    return [[[self alloc] initWithObject:sprite] autorelease];
}

+ (id)spriteWithFile:(NSString *)file rect:(CGRect)rect
{
    cocos2d::ui::Scale9Sprite* sprite = cocos2d::ui::Scale9Sprite::create([ccTypeConvert NSStringTostring:file],
                                                                          [ccTypeConvert CGRectToRect:rect]);
    return [[[self alloc] initWithObject:sprite] autorelease];
}

+ (id)spriteWithFile:(NSString *)file capInsets:(CGRect)capInsets
{
    cocos2d::ui::Scale9Sprite* sprite = cocos2d::ui::Scale9Sprite::create([ccTypeConvert CGRectToRect:capInsets],
                                                                          [ccTypeConvert NSStringTostring:file]);
    return [[[self alloc] initWithObject:sprite] autorelease];
}

+ (id)spriteWithFile:(NSString *)file
{
    cocos2d::ui::Scale9Sprite* sprite = cocos2d::ui::Scale9Sprite::create([ccTypeConvert NSStringTostring:file]);
    return [[[self alloc] initWithObject:sprite] autorelease];
}

+ (id)spriteWithSpriteFrame:(CCSpriteFrame *)spriteFrame capInsets:(CGRect)capInsets
{
    cocos2d::ui::Scale9Sprite* sprite = cocos2d::ui::Scale9Sprite::createWithSpriteFrame((cocos2d::SpriteFrame*)[spriteFrame getImpl],
                                                                                         [ccTypeConvert CGRectToRect:capInsets]);
    return [[[self alloc] initWithObject:sprite] autorelease];
}

+ (id)spriteWithSpriteFrame:(CCSpriteFrame *)spriteFrame
{
    cocos2d::ui::Scale9Sprite* sprite = cocos2d::ui::Scale9Sprite::createWithSpriteFrame((cocos2d::SpriteFrame*)[spriteFrame getImpl]);
    return [[[self alloc] initWithObject:sprite] autorelease];
}

+ (id)spriteWithSpriteFrameName:(NSString *)spriteFrameName capInsets:(CGRect)capInsets
{
    cocos2d::ui::Scale9Sprite* sprite = cocos2d::ui::Scale9Sprite::createWithSpriteFrameName([ccTypeConvert NSStringTostring:spriteFrameName],
                                                                                             [ccTypeConvert CGRectToRect:capInsets]);
    return [[[self alloc] initWithObject:sprite] autorelease];
}

+ (id)spriteWithSpriteFrameName:(NSString *)spriteFrameName
{
    cocos2d::ui::Scale9Sprite* sprite = cocos2d::ui::Scale9Sprite::createWithSpriteFrameName([ccTypeConvert NSStringTostring:spriteFrameName]);
    return [[[self alloc] initWithObject:sprite] autorelease];
}

- (void) updateWithBatchNode:(CCSpriteBatchNode *)batchnode rect:(CGRect)rect rotated:(BOOL)rotated capInsets:(CGRect)capInsets
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->updateWithBatchNode((cocos2d::SpriteBatchNode*)[batchnode getImpl],
                                [ccTypeConvert CGRectToRect:rect],
                                rotated,
                                [ccTypeConvert CGRectToRect:capInsets]);
}

- (void)setContentSize:(CGSize)size
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setContentSize([ccTypeConvert CGSizeToSize:size]);
}

- (void)setSpriteFrame:(CCSpriteFrame *)spriteFrame
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->setSpriteFrame((cocos2d::SpriteFrame*)[spriteFrame getImpl]);
}

- (CCScale9Sprite *)resizableSpriteWithCapInsets:(CGRect)capInsets
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    return [[[CCScale9Sprite alloc] initWithObject:sprite->resizableSpriteWithCapInsets([ccTypeConvert CGRectToRect:capInsets])] autorelease];
}

- (void)updateDisplayedColor:(ccColor3B)color
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->updateDisplayedColor([ccTypeConvert ccColor3BToColor3B:color]);
}

- (void)updateDisplayedOpacity:(GLubyte)opacity
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->updateDisplayedOpacity(opacity);
}

- (void)visit
{
    cocos2d::ui::Scale9Sprite* sprite = (cocos2d::ui::Scale9Sprite*)impl_;
    sprite->visit();
}

-(id)initWithObject: (void*)object
{
    impl_ = object;
    ((cocos2d::ui::Scale9Sprite*)impl_)->retain();
    isNeedScale9SpriteDealloc_ = YES;
    
    self = [super init];
    
    return self;
}

@end
