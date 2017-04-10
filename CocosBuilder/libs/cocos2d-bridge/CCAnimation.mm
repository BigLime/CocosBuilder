//
//  CCAnimation.m
//  CocosBuilder
//
//  Created by Leem on 17/4/6.
//
//

#import "CCAnimation.h"
#import "CCSpriteFrame.h"
#import "CCTexture2D.h"

#import "2d/CCAnimation.h"
#import "2d/CCSpriteFrame.h"

#import "ccTypeConvert.h"

@implementation CCAnimationFrame

// spriteFrame
-(void)setSpriteFrame:(CCSpriteFrame*) spriteFrame
{
    cocos2d::AnimationFrame* s = (cocos2d::AnimationFrame*)impl_;
    s->setSpriteFrame((cocos2d::SpriteFrame*)[spriteFrame getImpl]);
}

-(CCSpriteFrame*)spriteFrame
{
    cocos2d::AnimationFrame* s = (cocos2d::AnimationFrame*)impl_;
    return [[[CCSpriteFrame alloc] initWithObject: s->getSpriteFrame()] autorelease];
}

// delayUnits
-(void)setDelayUnits:(float) delayUnits
{
    cocos2d::AnimationFrame* s = (cocos2d::AnimationFrame*)impl_;
    s->setDelayUnits(delayUnits);
}

-(float)delayUnits
{
    cocos2d::AnimationFrame* s = (cocos2d::AnimationFrame*)impl_;
    return s->getDelayUnits();
}

// userInfo
-(void)setUserInfo:(NSDictionary*) userInfo
{
    cocos2d::AnimationFrame* s = (cocos2d::AnimationFrame*)impl_;
    /*mark todo by lsr*/
//    ValueMap map;
//    s->setUserInfo(map);
}

-(NSDictionary*)userInfo
{
    cocos2d::AnimationFrame* s = (cocos2d::AnimationFrame*)impl_;
    /*mark todo by lsr*/
//    NSDictionary* dic = s->getUserInfo();
//    return dic;
}

-(id)initWithObject: (void*)object
{
    impl_ = object;
    ((cocos2d::AnimationFrame*)impl_)->retain();
    isNeedAnimationFrameDealloc_ = YES;
    
    self = [super init];
    
    return self;
}

-(void) dealloc
{
    if(isNeedAnimationFrameDealloc_)
        ((cocos2d::AnimationFrame*)impl_)->release();
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
} 

-(id) initWithSpriteFrame:(CCSpriteFrame *)spriteFrame delayUnits:(float)delayUnits userInfo:(NSDictionary *)userInfo
{
    self = [self init];
    self.spriteFrame = spriteFrame;
    self.delayUnits = delayUnits;
    self.userInfo = userInfo;
    return self;
}

-(id) copyWithZone:(NSZone *)zone
{
    cocos2d::AnimationFrame* s = (cocos2d::AnimationFrame*)impl_;
    return [[[CCAnimationFrame alloc] initWithObject: s->clone()] autorelease];
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | SpriteFrame = %p, delayUnits = %0.2f >", [self class], self, self.spriteFrame, self.delayUnits];
}

@end

@implementation CCAnimation

// totalDelayUnits
-(float)totalDelayUnits
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    return anim->getTotalDelayUnits();
}

// delayPerUnit
-(void)setDelayPerUnit:(float) delayPerUnit
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    anim->setDelayPerUnit(delayPerUnit);
}

-(float)delayPerUnit
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    return anim->getDelayPerUnit();
}

// duration
-(float)duration
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    return anim->getDuration();
}

// frames
-(void)setFrames:(NSMutableArray*) frames
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    anim->setFrames([ccTypeConvert NSMutableArrayToVectorAnimationFrame:frames]);
}

-(NSMutableArray*)frames
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    return [ccTypeConvert VectorAnimationFrameToNSMutableArray:anim->getFrames()];
}

// restoreOriginalFrame
-(void)setRestoreOriginalFrame:(BOOL) restoreOriginalFrame
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    anim->setRestoreOriginalFrame(restoreOriginalFrame);
}

-(BOOL)restoreOriginalFrame
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    return anim->getRestoreOriginalFrame();
}

// loops
-(void)setLoops:(NSUInteger) loops
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    anim->setLoops(loops);
}

-(NSUInteger)loops
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    return anim->getLoops();
}

+(id) animation
{
    cocos2d::Animation* anim = cocos2d::Animation::create();
    return [[[self alloc] initWithObject: anim] autorelease];
}

+(id) animationWithSpriteFrames:(NSArray*)frames
{
    cocos2d::Animation* anim = cocos2d::Animation::createWithSpriteFrames([ccTypeConvert NSArrayToVectorSpriteFrame:frames]);
    return [[[self alloc] initWithObject:anim] autorelease];
}

+(id) animationWithSpriteFrames:(NSArray*)frames delay:(float)delay
{
    cocos2d::Animation* anim = cocos2d::Animation::createWithSpriteFrames([ccTypeConvert NSArrayToVectorSpriteFrame:frames], delay);
    return [[[self alloc] initWithObject:anim] autorelease];
}

+(id) animationWithAnimationFrames:(NSArray*)arrayOfAnimationFrames delayPerUnit:(float)delayPerUnit loops:(NSUInteger)loops
{
    cocos2d::Animation* anim = cocos2d::Animation::create([ccTypeConvert NSArrayToVectorAnimationFrame:arrayOfAnimationFrames], delayPerUnit, loops);
    return [[[self alloc] initWithObject:anim] autorelease];
}

-(id) init: (void*)pThis
{
    if(!!pThis)
    {
        impl_ = pThis;
        isNeedAnimationDealloc_ = NO;
    }
    else
    {
        impl_ = cocos2d::Animation::create();
        ((cocos2d::Animation*)impl_)->retain();
        isNeedAnimationDealloc_ = YES;
    }
    self = [super init];
    return self;
}

-(id)initWithObject: (void*)object
{
    impl_ = object;
    ((cocos2d::Animation*)impl_)->retain();
    isNeedAnimationDealloc_ = YES;
    
    self = [super init];
    
    return self;
}

-(void) dealloc
{
    if(isNeedAnimationDealloc_)
        ((cocos2d::Animation*)impl_)->release();
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
} 

- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | frames=%lu, totalDelayUnits=%f, delayPerUnit=%f, loops=%lu>", [self class], self,
            (unsigned long)[self.frames count],
            self.totalDelayUnits,
            self.delayPerUnit,
            (unsigned long)self.loops
            ];
}

- (id)copyWithZone:(NSZone *)zone
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    return [[[CCAnimationFrame alloc] initWithObject: anim->clone()] autorelease];
}

-(void) addSpriteFrame:(CCSpriteFrame*)frame
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    cocos2d::SpriteFrame* cppframe = (cocos2d::SpriteFrame*)[frame getImpl];
    anim->addSpriteFrame(cppframe);
}

-(void) addSpriteFrameWithFilename:(NSString*)filename
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    anim->addSpriteFrameWithFile([ccTypeConvert NSStringTostring:filename]);
}

-(void) addSpriteFrameWithTexture:(CCTexture2D*)texture rect:(CGRect)rect
{
    cocos2d::Animation* anim = (cocos2d::Animation*)impl_;
    cocos2d::Texture2D* cpptexture = (cocos2d::Texture2D*)[texture getImpl];
    anim->addSpriteFrameWithTexture(cpptexture, [ccTypeConvert CGRectToRect:rect]);
}

@end
