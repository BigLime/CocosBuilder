//
// CCParticleSystemQuad wrapper
//
// author xiaobo.wang
//
// 2017-04-07 17:57:33
//

#import "CCParticleSystemQuad.h"
#import "2d/CCParticleSystemQuad.h"

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
        impl_->release();
    
    [super dealloc];
}
-(void)setTotalParticles:(NSUInteger)totalParticles
{
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->setTotalParticles(totalParticles);
}

-(void)initTexCoordsWithRect:(CGRect)rect
{
    // TODO: convert CGRect
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    
    // TODO: protected in cpp.
    // sys->initTexCoordsWithRect(rect);
}

-(void)setTexture:(CCTexture2D *)texture withRect:(CGRect)rect
{
    // TODO: convert CGRect CCTexture2D
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->setTextureWithRect([texture getImpl], rect);
}

-(void)setTexture:(CCTexture2D *)texture
{
    // TODO: convert CGRect CCTexture2D
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->setTexture([texture getImpl]);
}

-(void)setDisplayFrame:(CCSpriteFrame *)spriteFrame
{
    cocos2d::ParticleSystemQuad* sys = (cocos2d::ParticleSystemQuad*)impl_;
    sys->setDisplayFrame([spriteFrame getImpl]);
}

- (void)initIndices
{
    // TODO: protected in cpp
    NSAssert(false, @"[- (void)initIndices]::protected in cpp");
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
    sys->setBatchNode([batchNode getImpl]);
}
@end







