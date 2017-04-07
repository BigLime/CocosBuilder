//
//  CCParticleSystemQuad.h
//  CocosBuilder
//
//  Created by Leem on 17/4/7.
//
//

#import <Foundation/Foundation.h>

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
    ccV3F_C4B_T2F_Quad	*_quads;		// quads to be rendered
    GLushort			*_indices;		// indices
    GLuint				_VAOname;
    GLuint				_buffersVBO[2]; //0: vertex  1: indices
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
