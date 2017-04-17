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

- (void)update;		// moved or resized
- (void)reshape;	// scrolled, moved or resized

/** uses and locks the OpenGL context */
-(void) lockOpenGLContext;

/** unlocks the openGL context */
-(void) unlockOpenGLContext;


// extension for cpp engine.

// create cpp glview and push glcontext into 2d-x.
-(id) create:(id)nsWindow delegate:(id)nsDelegate;

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
