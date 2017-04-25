//
// CCControlButton
//
// author ke.huang

#import "CCControlButton.h"
#import "CCNode.h"
#import "CCScale9Sprite.h"
#import "CCLabeTTF.h"
#import "CCSpriteFrame.h"
#import "extensions/GUI/CCControlExtension/CCControlButton.h"
#import "ccTypeConvert.h"

@implementation CCControlButton

- (id) init:(void*) pThis
{
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedControButtonlDealloc_  = NO;
    }
    else
    {
        cocos2d::extension::ControlButton* controlButton = cocos2d::extension::ControlButton::create();
        controlButton->retain();
        
        impl_ = controlButton;
        
        isNeedControButtonlDealloc_  = YES;
    }
    self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    isNeedControButtonlDealloc_  = NO;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedControButtonlDealloc_)
    {
        ((cocos2d::extension::ControlButton*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

- (BOOL)doesAdjustBackgroundImage
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return controlButton->doesAdjustBackgroundImage();
}
- (void)setAdjustBackgroundImage:(BOOL)adjustBackgroundImage
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setAdjustBackgroundImage(adjustBackgroundImage);
}
-(NSString*)currentTitle
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [ccTypeConvert stringToNSString:controlButton->getCurrentTitle()];
}
-(ccColor3B)currentTitleColor
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [ccTypeConvert Color3BToccColor3B:controlButton->getCurrentTitleColor()];
}
-(CCNode<CCLabelProtocol,CCRGBAProtocol> *)titleLabel
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [[[CCNode<CCLabelProtocol,CCRGBAProtocol> alloc]initWithObject: controlButton->getTitleLabel()] autorelease];
}
-(void)setTitleLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol> *) titleLabel
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setTitleLabel(static_cast<cocos2d::Node*>([titleLabel getImpl]));
}
-(CCScale9Sprite*)backgroundSprite
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [[[CCScale9Sprite alloc]initWithObject: controlButton->getBackgroundSprite()] autorelease];
}
- (void)setBackgroundSprite:(CCScale9Sprite *)backgroundSprite
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setBackgroundSprite(static_cast<cocos2d::ui::Scale9Sprite*>([backgroundSprite getImpl]));
}
-(CGSize)preferedSize
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [ccTypeConvert SizeToCGSize:controlButton->getPreferredSize()];
}
-(void)setPreferedSize:(CGSize)preferedSize
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setPreferredSize([ccTypeConvert CGSizeToSize:preferedSize]);
}
-(BOOL)zoomOnTouchDown
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return controlButton->getZoomOnTouchDown();
}
-(void)setZoomOnTouchDown:(BOOL)zoomOnTouchDown
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setZoomOnTouchDown(zoomOnTouchDown);
}
-(CGPoint)labelAnchorPoint
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [ccTypeConvert PointToCGPoint:controlButton->getLabelAnchorPoint()];
}
-(void)setLabelAnchorPoint:(CGPoint)labelAnchorPoint
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setLabelAnchorPoint([ccTypeConvert CGPointToPoint:labelAnchorPoint]);
}

- (id)init
{
    return [self initWithLabel:[CCLabelTTF labelWithString:@"" fontName:@"Helvetica" fontSize:12]
              backgroundSprite:[[[CCScale9Sprite alloc] init] autorelease]];
}

- (id)initWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol> *)label backgroundSprite:(CCScale9Sprite *)backgroundsprite
{
    cocos2d::Node* node = (cocos2d::Node*)[label getImpl];
    cocos2d::ui::Scale9Sprite* sprite = static_cast<cocos2d::ui::Scale9Sprite*>([backgroundsprite getImpl]);
    cocos2d::extension::ControlButton* controlButton = cocos2d::extension::ControlButton::create(node,sprite);
    controlButton->retain();
    impl_ = controlButton;
    
    isNeedControButtonlDealloc_ = YES;
    
    self = [super init:impl_];
    return self;

}
+ (id)buttonWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol> *)label backgroundSprite:(CCScale9Sprite *)backgroundsprite
{
    return [[[self alloc] initWithLabel:label backgroundSprite:backgroundsprite] autorelease];
}

- (id)initWithTitle:(NSString *)title fontName:(NSString *)fontName fontSize:(NSUInteger)fontsize
{
    CCLabelTTF *label = [CCLabelTTF labelWithString:title fontName:fontName fontSize:fontsize];
    
    return [self initWithLabel:label backgroundSprite:[CCScale9Sprite node]];
}

+ (id)buttonWithTitle:(NSString *)title fontName:(NSString *)fontName fontSize:(NSUInteger)fontsize
{
    return [[[self alloc] initWithTitle:title fontName:fontName fontSize:fontsize] autorelease];
}

/** Initializes a button with a sprite in background. */
- (id)initWithBackgroundSprite:(CCScale9Sprite *)sprite
{
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:30];
    
    return [self initWithLabel:label backgroundSprite:sprite];
}

+ (id)buttonWithBackgroundSprite:(CCScale9Sprite *)sprite
{
    return [[[self alloc] initWithBackgroundSprite:sprite] autorelease];
}
- (void)setHighlighted:(BOOL)highlighted
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setHighlighted(highlighted);
}
- (NSString *)titleForState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [ccTypeConvert stringToNSString:controlButton->getTitleForState(cocos2d::extension::Control::State(state))];
}
- (void)setTitle:(NSString *)title forState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setTitleForState([ccTypeConvert NSStringTostring:title],cocos2d::extension::Control::State(state));
}
- (ccColor3B)titleColorForState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [ccTypeConvert Color3BToccColor3B:controlButton->getTitleColorForState(cocos2d::extension::Control::State(state))];
}
- (void)setTitleColor:(ccColor3B)color forState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setTitleColorForState([ccTypeConvert ccColor3BToColor3B:color],cocos2d::extension::Control::State(state));
}
- (CCNode<CCLabelProtocol,CCRGBAProtocol> *)titleLabelForState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    cocos2d::Node* node = controlButton->getTitleLabelForState(cocos2d::extension::Control::State(state));
    return [[[CCNode<CCLabelProtocol,CCRGBAProtocol> alloc]initWithObject: node] autorelease];
}
- (void)setTitleLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol> *)label forState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setTitleLabelForState(static_cast<cocos2d::Node*>([label getImpl]),cocos2d::extension::Control::State(state));
}
- (void)setTitleBMFont:(NSString*)fntFile forState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setTitleBMFontForState([ccTypeConvert NSStringTostring:fntFile],cocos2d::extension::Control::State(state));
}
- (NSString*)titleBMFontForState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [ccTypeConvert stringToNSString:controlButton->getTitleBMFontForState(cocos2d::extension::Control::State(state))];
}
- (void)setTitleTTF:(NSString *)fontName forState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setTitleTTFForState([ccTypeConvert NSStringTostring:fontName],cocos2d::extension::Control::State(state));
}
- (NSString*) titleTTFForState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return [ccTypeConvert stringToNSString:controlButton->getTitleTTFForState(cocos2d::extension::Control::State(state))];
}
- (void) setTitleTTFSize:(float)size forState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setTitleTTFSizeForState(size,cocos2d::extension::Control::State(state));
}
- (float) titleTTFSizeForState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    return controlButton->getTitleTTFSizeForState(cocos2d::extension::Control::State(state));
}
- (CCScale9Sprite *)backgroundSpriteForState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    cocos2d::ui::Scale9Sprite* sprite = controlButton->getBackgroundSpriteForState(cocos2d::extension::Control::State(state));
    return [[[CCScale9Sprite alloc]initWithObject:sprite] autorelease];
}
- (void)setBackgroundSprite:(CCScale9Sprite *)sprite forState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setBackgroundSpriteForState(static_cast<cocos2d::ui::Scale9Sprite*>([sprite getImpl]),cocos2d::extension::Control::State(state));
}
- (void)setBackgroundSpriteFrame:(CCSpriteFrame*)spriteFrame forState:(CCControlState)state
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->setBackgroundSpriteFrameForState(static_cast<cocos2d::SpriteFrame*>([spriteFrame getImpl]),cocos2d::extension::Control::State(state));
}

- (void)needsLayout
{
    cocos2d::extension::ControlButton* controlButton = static_cast<cocos2d::extension::ControlButton*>(impl_);
    controlButton->needsLayout();
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSArray* chunks = [key componentsSeparatedByString:@"|"];
    if ([chunks count] == 2)
    {
        NSString* keyChunk = [chunks objectAtIndex:0];
        int state = [[chunks objectAtIndex:1] intValue];
        
        if ([keyChunk isEqualToString:@"title"])
        {
            [self setTitle:value forState:state];
        }
        else if ([keyChunk isEqualToString:@"backgroundSpriteFrame"])
        {
            [self setBackgroundSpriteFrame:value forState:state];
        }
        else if ([keyChunk isEqualToString:@"titleColor"])
        {
            ccColor3B c;
            [value getValue:&c];
            [self setTitleColor:c forState:state];
        }
        else if ([keyChunk isEqualToString:@"titleBMFont"])
        {
            [self setTitleBMFont:value forState:state];
        }
        else if ([keyChunk isEqualToString:@"titleTTF"])
        {
            NSLog(@"setTitleTTF: %@ forState:%d", value, state);
            
            [self setTitleTTF:value forState:state];
        }
        else if ([keyChunk isEqualToString:@"titleTTFSize"])
        {
            [self setTitleTTFSize:[value floatValue] forState:state];
        }
        else
        {
            [super setValue:value forUndefinedKey:key];
        }
    }
    else
    {
        [super setValue:value forUndefinedKey:key];
    }
}
- (id)valueForUndefinedKey:(NSString *)key
{
    NSArray* chunks = [key componentsSeparatedByString:@"|"];
    if ([chunks count] == 2)
    {
        NSString* keyChunk = [chunks objectAtIndex:0];
        int state = [[chunks objectAtIndex:1] intValue];
        
        if ([keyChunk isEqualToString:@"title"])
        {
            return [self titleForState:state];
        }
        else if ([keyChunk isEqualToString:@"titleColor"])
        {
            ccColor3B c = [self titleColorForState:state];
            return [NSValue value:&c withObjCType:@encode(ccColor3B)];
        }
        else if ([keyChunk isEqualToString:@"titleBMFont"])
        {
            return [self titleBMFontForState:state];
        }
        else if ([keyChunk isEqualToString:@"titleTTF"])
        {
            return [self titleTTFForState:state];
        }
        else if ([keyChunk isEqualToString:@"titleTTFSize"])
        {
            return [NSNumber numberWithFloat:[self titleTTFSizeForState:state]];
        }
        else
        {
            return [super valueForUndefinedKey:key];
        }
    }
    else
    {
        return [super valueForUndefinedKey:key];
    }
}

@end
