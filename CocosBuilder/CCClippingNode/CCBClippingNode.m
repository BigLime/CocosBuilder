/*
 * CocosBuilder: http://www.cocosbuilder.com
 *
 * Copyright (c) 2012 Zynga Inc.
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
 */

#import "CCBClippingNode.h"
#import "CCSprite.h"
#import "CCLayer.h"

@implementation CCBClippingNode
@synthesize mask;
@synthesize size;
- (id) init
{
    self = [super init];
    if (!self) return NULL;
    [self setSize:CGPointMake(100, 100)];
    return self;
}
- (void) setMask:(CCSpriteFrame *)mk
{
    mask = mk;
    if(mk)
    {
        CCSprite* sprite = [CCSprite spriteWithSpriteFrame:mk];
        [sprite setAnchorPoint:CGPointZero];
        [self setStencil:sprite];
        
        [self setContentSize:[sprite contentSize]];
        [self setSize:CGPointZero];
    }
}

-(void)setSize:(CGPoint)sizeXY
{
    size = sizeXY;
    if(sizeXY.x != 0 || sizeXY.y != 0)
    {
        CCLayerColor* layer = [[CCLayerColor alloc] init];
        CGSize newSize;
        newSize.width = sizeXY.x;
        newSize.height = sizeXY.y;
        [layer setContentSize:newSize];
        [layer setPosition: CGPointZero];
        [layer setAnchorPoint:CGPointZero];
        [self setStencil:layer];
        [self setContentSize:newSize];
        [self setMask:nil];
    }
}
@end
