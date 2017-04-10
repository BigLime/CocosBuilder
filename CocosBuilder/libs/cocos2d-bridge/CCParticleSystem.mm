//
//  CCParticleSystem.m
//  CocosBuilder
//
//  Created by Leem on 17/4/7.
//
//

#import "CCParticleSystem.h"
#import "2d/CCParticleSystem.h"
#import "CCTexture2D.h"

#include "ccTypeConvert.h"

@implementation CCParticleSystem

// getter setter
-(BOOL)active
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->isActive();
}

// getter setter
-(NSUInteger) particleCount
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getParticleCount();
}

// getter setter
-(void) setDuration:(float)duration
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setDuration(duration);
}

-(float) duration
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getDuration();
}

// getter setter
-(void) setSourcePosition:(CGPoint)sourcePosition
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setSourcePosition([ccTypeConvert CGPointToPoint:sourcePosition]);
}

-(CGPoint) sourcePosition
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return [ccTypeConvert PointToCGPoint:ps->getSourcePosition()];
}

// getter setter
-(void) setPosVar:(CGPoint)posVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setPosVar([ccTypeConvert CGPointToPoint:posVar]);
}

-(CGPoint) posVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return [ccTypeConvert PointToCGPoint:ps->getPosVar()];
}

// getter setter
-(void) setLife:(float)life
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setLife(life);
}

-(float) life
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getLife();
}

// getter setter
-(void) setLifeVar:(float)lifeVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setLifeVar(lifeVar);
}

-(float) lifeVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getLifeVar();
}

// getter setter
-(void) setAngle:(float)angle
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setAngle(angle);
}

-(float) angle
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getAngle();
}

// getter setter
-(void) setAngleVar:(float)angleVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setAngleVar(angleVar);
}

-(float) angleVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getAngleVar();
}

// getter setter
-(void) setGravity:(CGPoint)gravity
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setGravity([ccTypeConvert CGPointToPoint:gravity]);
}

-(CGPoint) gravity
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return [ccTypeConvert PointToCGPoint:ps->getGravity()];
}

// getter setter
-(void) setSpeed:(float)speed
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setSpeed(speed);
}

-(float) speed
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getSpeed();
}

// getter setter
-(void) setSpeedVar:(float)speedVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setSpeedVar(speedVar);
}

-(float) speedVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getSpeedVar();
}

// getter setter
-(void) setTangentialAccel:(float)tangentialAccel
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setTangentialAccel(tangentialAccel);
}

-(float) tangentialAccel
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getTangentialAccel();
}

// getter setter
-(void) setTangentialAccelVar:(float)tangentialAccelVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setTangentialAccelVar(tangentialAccelVar);
}

-(float) tangentialAccelVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getTangentialAccel();
}

// getter setter
-(void) setRadialAccel:(float)radialAccel
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setRadialAccel(radialAccel);
}

-(float) radialAccel
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getRadialAccel();
}

// getter setter
-(void) setRadialAccelVar:(float)radialAccelVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setRadialAccelVar(radialAccelVar);
}

-(float) radialAccelVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getRadialAccelVar();
}

// getter setter
-(void) setStartRadius:(float)startRadius
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setStartRadius(startRadius);
}

-(float) startRadius
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getStartRadius();
}

// getter setter
-(void) setStartRadiusVar:(float)startRadiusVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setStartRadiusVar(startRadiusVar);
}

-(float) startRadiusVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getStartRadiusVar();
}

// getter setter
-(void) setEndRadius:(float)endRadius
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setEndRadius(endRadius);
}

-(float) endRadius
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getEndRadius();
}

// getter setter
-(void) setEndRadiusVar:(float)endRadiusVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setEndRadiusVar(endRadiusVar);
}

-(float) endRadiusVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getEndRadiusVar();
}

// getter setter
-(void) setRotatePerSecond:(float)rotatePerSecond
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setRotatePerSecond(rotatePerSecond);
}

-(float) rotatePerSecond
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getRotatePerSecond();
}

// getter setter
-(void) setRotatePerSecondVar:(float)rotatePerSecondVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setRotatePerSecondVar(rotatePerSecondVar);
}

-(float) rotatePerSecondVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getRotatePerSecondVar();
}

// getter setter
-(void) setStartSize:(float)startSize
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setStartSize(startSize);
}

-(float) startSize
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getStartSize();
}

// getter setter
-(void) setStartSizeVar:(float)startSizeVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setStartSizeVar(startSizeVar);
}

-(float) startSizeVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getStartSizeVar();
}

// getter setter
-(void) setEndSize:(float)endSize
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setEndSize(endSize);
}

-(float) endSize
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getEndSize();
}

// getter setter
-(void) setEndSizeVar:(float)endSizeVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setEndSizeVar(endSizeVar);
}

-(float) endSizeVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getEndSizeVar();
}

// getter setter
-(void) setStartColor:(ccColor4F)startColor
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setStartColor([ccTypeConvert ccColor4FToColor4F:startColor]);
}

-(ccColor4F) startColor
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return [ccTypeConvert Color4FToccColor4F:ps->getStartColor()];
}

// getter setter
-(void) setStartColorVar:(ccColor4F)startColorVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setStartColorVar([ccTypeConvert ccColor4FToColor4F:startColorVar]);
}

-(ccColor4F) startColorVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return [ccTypeConvert Color4FToccColor4F:ps->getStartColorVar()];
}

// getter setter
-(void) setEndColor:(ccColor4F)endColor
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setEndColor([ccTypeConvert ccColor4FToColor4F:endColor]);
}

-(ccColor4F) endColor
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return [ccTypeConvert Color4FToccColor4F:ps->getEndColor()];
}

// getter setter
-(void) setEndColorVar:(ccColor4F)endColorVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setEndColorVar([ccTypeConvert ccColor4FToColor4F:endColorVar]);
}

-(ccColor4F) endColorVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return [ccTypeConvert Color4FToccColor4F:ps->getEndColorVar()];
}

// getter setter
-(void) setStartSpin:(float)startSpin
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setStartSpin(startSpin);
}

-(float) startSpin
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getStartSpin();
}

// getter setter
-(void) setStartSpinVar:(float)startSpinVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setStartSpinVar(startSpinVar);
}

-(float) startSpinVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getStartSpinVar();
}

// getter setter
-(void) setEndSpin:(float)endSpin
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setEndSpin(endSpin);
}

-(float) endSpin
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getEndSpin();
}

// getter setter
-(void) setEndSpinVar:(float)endSpinVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setEndSpinVar(endSpinVar);
}

-(float) endSpinVar
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getEndSpinVar();
}

// getter setter
-(void) setEmissionRate:(float)emissionRate
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setEmissionRate(emissionRate);
}

-(float) emissionRate
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getEmissionRate();
}

// getter setter
-(void) setTotalParticles:(NSUInteger)totalParticles
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setTotalParticles(totalParticles);
}

-(NSUInteger) totalParticles
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->getTotalParticles();
}

// getter setter
-(void) setTexture:(CCTexture2D *)texture
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setTexture((cocos2d::Texture2D*)[texture getImpl]);
}

-(CCTexture2D *) texture
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return [[[CCTexture2D alloc] initWithObject:ps->getTexture()] autorelease];
}

// getter setter
-(void) setBlendFunc:(ccBlendFunc)blendFunc
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setBlendFunc([ccTypeConvert ccBlendFuncToBlendFunc:blendFunc]);
}

-(ccBlendFunc) blendFunc
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return [ccTypeConvert BlendFuncToccBlendFunc:ps->getBlendFunc()];
}

// getter setter
-(void) setOpacityModifyRGB:(BOOL)opacityModifyRGB
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setOpacityModifyRGB(opacityModifyRGB);
}

-(BOOL) doesOpacityModifyRGB
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->isOpacityModifyRGB();
}

+(id) particleWithFile:(NSString*) plistFile
{
    cocos2d::ParticleSystem* p = cocos2d::ParticleSystem::create([ccTypeConvert NSStringTostring:plistFile]);
    return [[[CCParticleSystem alloc] initWithObject:p] autorelease];
}

+(id) particleWithTotalParticles:(NSUInteger) numberOfParticles
{
    cocos2d::ParticleSystem* p = cocos2d::ParticleSystem::createWithTotalParticles(numberOfParticles);
    return [[[CCParticleSystem alloc] initWithObject:p] autorelease];
}

-(id) init {
    return [self initWithTotalParticles:150];
}

-(id) initWithFile:(NSString *)plistFile
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->initWithFile([ccTypeConvert NSStringTostring:plistFile]);
    return self;
}

-(id) initWithTotalParticles:(NSUInteger) numberOfParticles
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->initWithTotalParticles(numberOfParticles);
    return self;
}

-(void) dealloc
{
    if (isNeedParticleSystemDealloc_)
        ((cocos2d::ParticleSystem*)impl_)->release();
    
    [super dealloc];
}

-(BOOL) addParticle
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->addParticles(1);
    
    return YES;
}

-(void) stopSystem
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->stopSystem();
}

-(void) resetSystem
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->resetSystem();
}

-(BOOL) isFull
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->isFull();
}

#pragma mark ParticleSystem - MainLoop
-(void) update: (ccTime) dt
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->update(dt);
}

-(void) updateWithNoTime
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->updateWithNoTime();
}

-(void) updateQuadWithParticle:(tCCParticle*)particle newPosition:(CGPoint)pos;
{
    // should be overriden
}

-(void) postStep
{
    // should be overriden
}

#pragma mark ParticleSystem - Additive Blending
-(void) setBlendAdditive:(BOOL)additive
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setBlendAdditive(additive);
}

-(BOOL) blendAdditive
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    return ps->isBlendAdditive();
}

#pragma mark ParticleSystem - methods for batchNode rendering

-(CCParticleBatchNode*) batchNode
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
//    return ps->getBatchNode(); /*mark todo by lsr*/ // 类型转换
}

-(void) setBatchNode:(CCParticleBatchNode*) batchNode
{
    /*mark todo by lsr*/ // 类型转换
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
//    ps->setBatchNode(batchNode);
}

//don't use a transform matrix, this is faster
-(void) setScale:(float) s
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setScale(s);
}

-(void) setRotation: (float)newRotation
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setRotation(newRotation);
}

-(void) setScaleX: (float)newScaleX
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setScaleX(newScaleX);
}

-(void) setScaleY: (float)newScaleY
{
    cocos2d::ParticleSystem* ps = (cocos2d::ParticleSystem*)impl_;
    ps->setScaleY(newScaleY);
}

@end
