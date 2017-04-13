/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2010 Ricardo Quesada
 * Copyright (c) 2011 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */


#import "CCAction.h"
#import "CCActionInterval.h"

#import "CCNode.h"

#import "2d/CCAction.h"
#import "2d/CCActionInterval.h"

#import "ccTypeConvert.h"

//
// Action Base Class
//
#pragma mark -
#pragma mark Action

@implementation CCAction

// @synthesize tag = _tag, target = _target, originalTarget = _originalTarget;
-(void)setTag:(NSInteger)tag
{
    cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    action->setTag(tag);
}

- (NSInteger)tag
{
    cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    return action->getTag();
}

-(void)setTarget:(CCNode*)target
{
    cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    cocos2d::Node* ccTarget = static_cast<cocos2d::Node*>([target getImpl]);
    
    action->setTarget(ccTarget);
}

-(CCNode *)target
{
    cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    return [[[CCNode alloc] initWithObject: action->getTarget()] autorelease];
}

-(void)setOriginalTarget:(CCNode *)originalTarget
{
    cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    cocos2d::Node* ccTarget = static_cast<cocos2d::Node*>([originalTarget getImpl]);
    
    action->setOriginalTarget(ccTarget);
}

- (CCNode *)originalTarget
{
    cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    return [[[CCNode alloc] initWithObject: action->getOriginalTarget()] autorelease];
}

+(id) action
{
    return [[[self alloc] init:nil] autorelease];
}

-(id) init
{
    return [self init:nil];
}

-(id) init: (void*) pThis
{
    NSAssert(!!pThis, @"CCAction is a virtual type in cpp");
    if (!!pThis)
    {
        impl_                     = pThis;
        isNeedCCActionDealloc_    = NO;
    }
    else
    {

    }
    
    // self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_                   = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCActionDealloc_  = YES;
    
    // self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCActionDealloc_)
    {
        cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
        action->release();
    }
    
	[super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

-(void) hold
{
    isNeedCCActionDealloc_ = YES;
    
    cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    action->retain();
}

-(NSString*) description
{
    cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    return [NSString stringWithCString: action->description().c_str() encoding:NSUTF8StringEncoding];
}

-(id) copyWithZone: (NSZone*) zone
{
    cocos2d::Action* s = (cocos2d::Action*)impl_;
    id copy = [[[CCAction alloc] initWithObject: s->clone()] autorelease];
    [copy hold];
    return copy;
}

-(void) startWithTarget:(CCNode *)target
{
	cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    cocos2d::Node* ccTarget = static_cast<cocos2d::Node*>([target getImpl]);
    
    action->startWithTarget(ccTarget);
}

-(void) stop
{
	cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    action->stop();
}

-(BOOL) isDone
{
	cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    return action->isDone();
}

-(void) step: (ccTime) dt
{
	cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    action->step(dt);
}

-(void) update: (ccTime) time
{
    cocos2d::Action* action = static_cast<cocos2d::Action*>(impl_);
    action->update(time);
}
@end

//
// FiniteTimeAction
//
#pragma mark -
#pragma mark FiniteTimeAction
@implementation CCFiniteTimeAction

// @synthesize duration = _duration;
-(void)setDuration:(ccTime)duration
{
    cocos2d::FiniteTimeAction* action = static_cast<cocos2d::FiniteTimeAction*>(impl_);
    action->setDuration(duration);
}

-(ccTime)duration
{
    cocos2d::FiniteTimeAction* action = static_cast<cocos2d::FiniteTimeAction*>(impl_);
    return action->getDuration();
}

- (CCFiniteTimeAction*) reverse
{
    cocos2d::FiniteTimeAction* action = static_cast<cocos2d::FiniteTimeAction*>(impl_);
    action->reverse();
    
	return nil;
}

-(id) init: (void*) pThis
{
    NSAssert(!!pThis, @"CCAction is a virtual type in cpp");
    if (!!pThis)
    {
        impl_                               = pThis;
        isNeedCCFiniteTimeActionDealloc_    = NO;
    }
    else
    {
        
    }
    
    self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_                   = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCActionDealloc_  = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCFiniteTimeActionDealloc_)
    {
        cocos2d::FiniteTimeAction* action = static_cast<cocos2d::FiniteTimeAction*>(impl_);
        action->release();
    }
    
    [super dealloc];
}

@end


//
// RepeatForever
//
#pragma mark -
#pragma mark RepeatForever

@implementation CCRepeatForever

//@synthesize innerAction=_innerAction;
-(void)setInnerAction:(CCActionInterval *)innerAction
{
    cocos2d::RepeatForever* action = static_cast<cocos2d::RepeatForever*>(impl_);
    cocos2d::ActionInterval* inner = static_cast<cocos2d::ActionInterval*>(innerAction);
    
    action->setInnerAction(inner);
}

-(CCActionInterval *)innerAction
{
    cocos2d::RepeatForever* action = static_cast<cocos2d::RepeatForever*>(impl_);
    return [[[CCActionInterval alloc] initWithObject: action->getInnerAction()] autorelease];
}

+(id) actionWithAction: (CCActionInterval*) action
{
	return [[[self alloc] initWithAction: action] autorelease];
}

-(id) initWithAction: (CCActionInterval*) inn
{
    cocos2d::ActionInterval* inner = static_cast<cocos2d::ActionInterval*>([inn getImpl]);
    cocos2d::RepeatForever* action = cocos2d::RepeatForever::create(inner);
    action->retain();
    
    impl_ = action;
    isNeedCCRepeatForeverDealloc_ = YES;

    self = [super init:impl_];
	return self;
}

-(id) initWithObject: (void*) object
{
    impl_                          = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCRepeatForeverDealloc_  = YES;
    
    self = [super init:impl_];
    return self;
}

-(void*) getImpl
{
    return impl_;
}

-(void) hold
{
    cocos2d::RepeatForever* action = static_cast<cocos2d::RepeatForever*>(impl_);
    action->retain();
    
    isNeedCCRepeatForeverDealloc_  = YES;
}

-(id) copyWithZone: (NSZone*) zone
{
    cocos2d::RepeatForever* s = (cocos2d::RepeatForever*)impl_;
    id copy = [[[CCRepeatForever alloc] initWithObject: s->clone()] autorelease];
    [copy hold];
    return copy;
}

-(void) dealloc
{
	if (isNeedCCRepeatForeverDealloc_)
    {
        cocos2d::RepeatForever* action = static_cast<cocos2d::RepeatForever*>(impl_);
        action->release();
    }
    
	[super dealloc];
}

-(void) startWithTarget:(CCNode*) target
{
    cocos2d::RepeatForever* action = static_cast<cocos2d::RepeatForever*>(impl_);
    cocos2d::Node* ccTarget = static_cast<cocos2d::Node*>([target getImpl]);
    
    action->setTarget(ccTarget);
}

-(void) step:(ccTime) dt
{
    cocos2d::RepeatForever* action = static_cast<cocos2d::RepeatForever*>(impl_);
    action->step(dt);
}


-(BOOL) isDone
{
	cocos2d::RepeatForever* action = static_cast<cocos2d::RepeatForever*>(impl_);
    return action->isDone();
}

- (CCActionInterval *) reverse
{
    cocos2d::RepeatForever* action = static_cast<cocos2d::RepeatForever*>(impl_);
    return [[[CCActionInterval alloc] initWithObject: action->reverse()] autorelease];
}
@end

//
// Speed
//
#pragma mark -
#pragma mark Speed
@implementation CCSpeed

// @synthesize speed=_speed;
-(void)setSpeed:(CGFloat)speed
{
    cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    action->setSpeed(speed);
}

-(CGFloat)speed
{
    cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    return action->getSpeed();
}

// @synthesize innerAction=_innerAction;
-(void)setInnerAction:(CCActionInterval *)innerAction
{
    cocos2d::ActionInterval* inner = static_cast<cocos2d::ActionInterval*>([innerAction getImpl]);
    cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    
    action->setInnerAction(inner);
}

-(CCActionInterval *)innerAction
{
    cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    return [[[CCActionInterval alloc] initWithObject: action->getInnerAction()] autorelease];
}

+(id) actionWithAction: (CCActionInterval*) action speed:(CGFloat)value
{
	return [[[self alloc] initWithAction: action speed:value] autorelease];
}

-(id) init
{
    return [[CCSpeed alloc] initWithAction: nil speed: 0];
}

-(id) initWithAction: (CCActionInterval*) action speed:(CGFloat)value
{
    cocos2d::ActionInterval* inner = static_cast<cocos2d::ActionInterval*>([action getImpl]);
    cocos2d::Speed* speed = cocos2d::Speed::create(inner, value);
    speed->retain();
    
    impl_ = speed;
    isNeedCCSpeedDealloc_ = YES;
    
    self = [super init:impl_];
	return self;
}

-(id) initWithObject: (void*) object
{
    impl_                   = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCSpeedDealloc_  = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) hold
{
    cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    action->retain();
    
    isNeedCCSpeedDealloc_  = YES;
}

-(id) copyWithZone: (NSZone*) zone
{
    cocos2d::Speed* s = (cocos2d::Speed*)impl_;
    id copy = [[[CCSpeed alloc] initWithObject: s->clone()] autorelease];
    [copy hold];
    return copy;
}

-(void) dealloc
{
    if (isNeedCCSpeedDealloc_)
    {
        cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
        action->release();
    }
    
	[super dealloc];
}

-(void) startWithTarget:(CCNode*)aTarget
{
    cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    cocos2d::Node* ccTarget = static_cast<cocos2d::Node*>([aTarget getImpl]);
    
    action->startWithTarget(ccTarget);
}

-(void) stop
{
	cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    action->stop();
}

-(void) step:(ccTime) dt
{
	cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    action->step(dt);
}

-(BOOL) isDone
{
	cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    return action->isDone();
}

- (CCActionInterval *) reverse
{
	cocos2d::Speed* action = static_cast<cocos2d::Speed*>(impl_);
    return [[[CCActionInterval alloc] initWithObject: action->reverse()] autorelease];
}

@end

//
// Follow
//
@implementation CCFollow

// @synthesize boundarySet = _boundarySet;
-(void)setBoundarySet:(BOOL)boundarySet
{
    cocos2d::Follow* follow = static_cast<cocos2d::Follow*>(impl_);
    follow->setBoundarySet(boundarySet);
}

-(BOOL)boundarySet
{
    cocos2d::Follow* follow = static_cast<cocos2d::Follow*>(impl_);
    return follow->isBoundarySet();
}

+(id) actionWithTarget:(CCNode *) fNode
{
	return [[[self alloc] initWithTarget:fNode] autorelease];
}

+(id) actionWithTarget:(CCNode *) fNode worldBoundary:(CGRect)rect
{
	return [[[self alloc] initWithTarget:fNode worldBoundary:rect] autorelease];
}

-(id) initWithTarget:(CCNode *)fNode
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>([fNode getImpl]);
    cocos2d::Follow* action = cocos2d::Follow::create(node);
    action->retain();
    
    impl_ = action;
    isNeedCCFollowDealloc_ = YES;
    
    self = [super init:impl_];
	return self;
}

-(id) initWithTarget:(CCNode *)fNode worldBoundary:(CGRect)rect
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>([fNode getImpl]);
    cocos2d::Follow* action = cocos2d::Follow::create(node, [ccTypeConvert CGRectToRect:rect]);
    action->retain();
    
    impl_ = action;
    isNeedCCFollowDealloc_ = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) hold
{
    cocos2d::Follow* action = static_cast<cocos2d::Follow*>(impl_);
    action->retain();
    
    isNeedCCFollowDealloc_  = YES;
}

-(id) copyWithZone: (NSZone*) zone
{
    cocos2d::Follow* s = (cocos2d::Follow*)impl_;
    id copy = [[[CCFollow alloc] initWithObject: s->clone()] autorelease];
    [copy hold];
    return copy;
}

-(void) step:(ccTime) dt
{
    cocos2d::Follow* follow = static_cast<cocos2d::Follow*>(impl_);
    follow->step(dt);
}


-(BOOL) isDone
{
	cocos2d::Follow* follow = static_cast<cocos2d::Follow*>(impl_);
    return follow->isDone();
}

-(void) stop
{
    cocos2d::Follow* follow = static_cast<cocos2d::Follow*>(impl_);
    follow->stop();
}

-(void) dealloc
{
	if (isNeedCCFollowDealloc_)
    {
        cocos2d::Follow* follow = static_cast<cocos2d::Follow*>(impl_);
        follow->release();
    }
    
	[super dealloc];
}

@end


