//
// CCParticleSystemQuad Wrapper
//
// author xiaobo.wang
//
// 2017-04-07 17:56:58
//

#import "CCParticleSystem.h"
#import "ccConfig.h"

@class CCSpriteFrame;

/** CCParticleSystemQuad is a subclass of CCParticleSystem
 
 It includes all the features of ParticleSystem.
 
 Special features and Limitations:
 - Particle size can be any float number.
 - The system can be scaled
 - The particles can be rotated
 - It supports subrects
 - It supports batched rendering since 1.1
 @since v0.8
 */
@interface CCParticleSystemQuad : CCParticleSystem
{
    BOOL isNeedCCParticleSystemQuadDealloc_;
}

/** initialices the indices for the vertices */
-(void) initIndices;

/** initilizes the texture with a rectangle measured Points */
-(void) initTexCoordsWithRect:(CGRect)rect;

/** Sets a new CCSpriteFrame as particle.
 WARNING: this method is experimental. Use setTexture:withRect instead.
 @since v0.99.4
 */
-(void)setDisplayFrame:(CCSpriteFrame*)spriteFrame;

/** Sets a new texture with a rect. The rect is in Points.
 @since v0.99.4
 */
-(void) setTexture:(CCTexture2D *)texture withRect:(CGRect)rect;

@end
