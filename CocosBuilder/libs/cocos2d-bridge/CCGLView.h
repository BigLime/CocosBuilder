//
//  CCGLView.h
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import <Foundation/Foundation.h>

@interface CCGLView : NSObject {
    void* impl_;
    BOOL isNeedGLViewDealloc_;
}

@property (nonatomic, readwrite) NSRect frame;

- (NSPoint)convertPoint:(NSPoint)point toView:(nullable NSView*)view;
- (void)addTrackingArea:(NSTrackingArea*)trackingArea;
- (void)removeTrackingArea:(NSTrackingArea*)trackingArea;

-(id)initWithFrame:(NSRect)frame;
-(id)initWithObject: (void*)object;

-(void*) getImpl;

@end
