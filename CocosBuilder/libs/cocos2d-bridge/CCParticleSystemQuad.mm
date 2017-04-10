//
// CCParticleSystemQuad wrapper
//
// author xiaobo.wang
//
// 2017-04-07 17:57:33
//

#import "CCParticleSystemQuad.h"
#import "2d/CCParticleSystemQuad.h"
#import "renderer/CCTexture2D.h"
#import "ccTypeConvert.h"

@implementation CCParticleSystemQuad

-(id)initWithTotalParticles:(NSUInteger)numberOfParticles
{
    auto* object = cocos2d::ParticleSystemQuad::createWithTotalParticles(numberOfParticles);
    object->retain();
    
    impl_ = object;
    isNeedCCParticleSystemQuadDealloc_ = YES;
    
    self = [super init: impl_];
    return self;
}

-(void)dealloc
{
    if (isNeedCCParticleSystemQuadDealloc_)
        ((cocos2d::ParticleSystemQuad*)impl_)->release();
    
    [super dealloc];
}
-(void)setTotalParticles:(NSUInteger)totalParticles
{
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->setTotalParticles(totalParticles);
}

-(void)setTexture:(CCTexture2D *)texture withRect:(CGRect)rect
{
    // TODO: convert CGRect CCTexture2D
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->setTextureWithRect((cocos2d::Texture2D*)[texture getImpl], [ccTypeConvert CGRectToRect:rect]);
}

-(void)setTexture:(CCTexture2D *)texture
{
    // TODO: convert CGRect CCTexture2D
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->setTexture((cocos2d::Texture2D*)[texture getImpl]);
}

-(void)setDisplayFrame:(CCSpriteFrame *)spriteFrame
{
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->setDisplayFrame((cocos2d::SpriteFrame*)[spriteFrame getImpl]);
}

-(void)postStep
{
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->postStep();
}

-(void)draw
{
    // TODO: different param in cpp
    NSAssert(false, @"[-(void)draw]::TODO: different param in cpp");
}

-(void)setBatchNode:(CCParticleBatchNode *)batchNode
{
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->setBatchNode((cocos2d::ParticleBatchNode*)[batchNode getImpl]);
}
@end







