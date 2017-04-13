//
//  CCGLView.h
//  CocosBuilder
//
//  Created by Leem on 17/4/10.
//
//

#import <Foundation/Foundation.h>

#import <AppKit/NSOpenGLView.h>

@interface CCGLView : NSOpenGLView {
    void* impl_;
    BOOL isNeedGLViewDealloc_;
}

@property (nonatomic, readwrite) NSRect frame;

- (NSPoint)convertPoint:(NSPoint)point toView:(NSView*)view;
- (void)addTrackingArea:(NSTrackingArea*)trackingArea;
- (void)removeTrackingArea:(NSTrackingArea*)trackingArea;

//-(id)initWithFrame:(NSRect)frame;
-(id)initWithObject: (void*)object;
-(void)newCppGLView;

-(void*) getImpl;

// extension for cpp engine.

// create cpp glview and push glcontext into 2d-x.
-(void) create:(id)nsWindow delegate:(id)nsDelegate;

// handle move event.
-(void) onMove;

// handle focus event.
-(void) onFocus: (BOOL) isFocus;

// handle window move event.
-(void) onSize: (NSRect) contentRect fbRect: (NSRect) fbRect; 

// handle window minimum event.
-(void) onMinSize;

// handle window maximum event.
-(void) onMaxSize;

// handle window close event, termate cpp engine.
-(void) onTerminate;
@end
