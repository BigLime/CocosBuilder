//
//  CCAnimation.m
//  CocosBuilder
//
//  Created by Leem on 17/4/6.
//
//

#import "CCAnimation.h"

#include "../cocos2d-x/cocos/2d/CCAnimation.h"

@implementation CCAnimationFrame

// spriteFrame
-(void)setSpriteFrame:(CCSpriteFrame*) spriteFrame
{
    AnimationFrame* s = (AnimationFrame*)impl_;
    s->setSpriteFrame((SpriteFrame*)[spriteFrame.getImpl]);
}

-(CCSpriteFrame*)spriteFrame
{
    AnimationFrame* s = (AnimationFrame*)impl_;
    return [[[CCSpriteFrame alloc] initWithObject: s->getSpriteFrame()] autorelease];
}

// delayUnits
-(void)setDelayUnits:(float) delayUnits
{
    AnimationFrame* s = (AnimationFrame*)impl_;
    s->setDelayUnits(delayUnits);
}

-(float)delayUnits
{
    AnimationFrame* s = (AnimationFrame*)impl_;
    return s->getDelayUnits();
}

// userInfo
-(void)setUserInfo:(NSDictionary*) userInfo
{
    AnimationFrame* s = (AnimationFrame*)impl_;
    /*mark todo by lsr*/
    ValueMap map;
    s->setUserInfo(map);
}

-(NSDictionary*)userInfo
{
    AnimationFrame* s = (AnimationFrame*)impl_;
    /*mark todo by lsr*/
    NSDictionary* dic = s->getUserInfo();
    return dic;
}

-(id) init: (void*)pThis
{
    if(!!pThis)
    {
        impl_ = pThis;
        isNeedAnimationFrameDealloc_ = NO;
    }
    else
    {
        impl_ = cocos2d::AnimationFrame::create();
        impl_->retain();
        isNeedAnimationFrameDealloc_ = YES;
    }
    self = [super init:self];
    return self;
}

-(id)initWithObject: (void*)object
{
    impl_ = object;
    impl_->retain();
    isNeedAnimationFrameDealloc_ = YES;
    
    self = [super init:self];
    
    return self;
}

-(void) dealloc
{
    if(isNeedAnimationFrameDealloc_)
        impl_->release();
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
    AnimationFrame* s = (AnimationFrame*)impl_;
    return [[[CCAnimationFrame alloc] initWithObject: s.clone()] autorelease];
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | SpriteFrame = %p, delayUnits = %0.2f >", [self class], self, self.spriteFrame, self.delayUnits];
}

@end

@implementation CCAnimation

// totalDelayUnits
-(void)setTotalDelayUnits:(float) totalDelayUnits
{
    Animation* anim = (Animation*)impl_;
    anim->setTotalDelayUnits(totalDelayUnits);
}

-(float)totalDelayUnits
{
    Animation* anim = (Animation*)impl_;
    return anim->getTotalDelayUnits();
}

// delayPerUnit
-(void)setDelayPerUnit:(float) delayPerUnit
{
    Animation* anim = (Animation*)impl_;
    anim->setDelayPerUnit(delayPerUnit);
}

-(float)delayPerUnit
{
    Animation* anim = (Animation*)impl_;
    return anim->getDelayPerUnit();
}

// duration
-(void)setDuration:(float) duration
{
    Animation* anim = (Animation*)impl_;
    anim->setDuration();
}

-(float)duration
{
    Animation* anim = (Animation*)impl_;
    return anim->getDuration();
}

// frames
-(void)setFrames:(NSMutableArray*) frames
{
    Animation* anim = (Animation*)impl_;
    /*mark todo by lsr*/
}

-(NSMutableArray*)frames
{
    Animation* anim = (Animation*)impl_;
    /*mark todo by lsr*/
}

// restoreOriginalFrame
-(void)setRestoreOriginalFrame:(BOOL) restoreOriginalFrame
{
    Animation* anim = (Animation*)impl_;
    anim->setRestoreOriginalFrame(restoreOriginalFrame);
}

-(BOOL)restoreOriginalFrame
{
    Animation* anim = (Animation*)impl_;
    return anim->getRestoreOriginalFrame();
}

// loops
-(void)setLoops:(NSUInteger) loops
{
    Animation* anim = (Animation*)impl_;
    anim->setLoops(loops);
}

-(NSUInteger)loops
{
    Animation* anim = (Animation*)impl_;
    return anim->getLoops();
}

+(id) animation
{
    Animation* anim = Animation::create();
    return [[[self alloc] initWithObject: anim] autorelease];
}

+(id) animationWithSpriteFrames:(NSArray*)frames
{
    /*mark todo by lsr*/
    Animation* anim = Animation::createWithSpriteFrames(frames);
    return [[[self alloc] initWithObject:anim] autorelease];
}

+(id) animationWithSpriteFrames:(NSArray*)frames delay:(float)delay
{
    /*mark todo by lsr*/
    Animation* anim = Animation::createWithSpriteFrames(frames, delay);
    return [[[self alloc] initWithObject:anim] autorelease];
}

+(id) animationWithAnimationFrames:(NSArray*)arrayOfAnimationFrames delayPerUnit:(float)delayPerUnit loops:(NSUInteger)loops
{
    /*mark todo by lsr*/
    Animation* anim = Animation::create(arrayOfAnimationFrames, delayPerUnit, loops);
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
        impl_ = cocos2d::AnimationFrame::create();
        impl_->retain();
        isNeedAnimationDealloc_ = YES;
    }
    self = [super init:self];
    return self;
}

-(id)initWithObject: (void*)object
{
    impl_ = object;
    impl_->retain();
    isNeedAnimationDealloc_ = YES;
    
    self = [super init:self];
    
    return self;
}

-(void) dealloc
{
    if(isNeedAnimationDealloc_)
        impl_->release();
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

-(float) duration
{
    Animation* anim = (Animation*)impl_;
    return anim->getDuration();
}

- (id)copyWithZone:(NSZone *)zone
{
    Animation* anim = (Animation*)impl_;
    return [[[CCAnimationFrame alloc] initWithObject: anim.clone()] autorelease];
}

-(void) addSpriteFrame:(CCSpriteFrame*)frame
{
    Animation* anim = (Animation*)impl_;
    SpriteFrame* cppframe = (SpriteFrame*)[frame getImpl];
    anim->addSpriteFrame(cppframe);
}

-(void) addSpriteFrameWithFilename:(NSString*)filename
{
    Animation* anim = (Animation*)impl_;
    /*mark todo by lsr*/
    anim->addSpriteFrameWithFilename(filename);
}

-(void) addSpriteFrameWithTexture:(CCTexture2D*)texture rect:(CGRect)rect
{
    Animation* anim = (Animation*)impl_;
    Texture2D* cpptexture = (Texture2D*)[texture getImpl];
    /*mark todo by lsr*/
    anim->addSpriteFrameWithTexture(cpptexture, rect);
}

-(void*) getImpl
{
    return impl_;
}

@end
