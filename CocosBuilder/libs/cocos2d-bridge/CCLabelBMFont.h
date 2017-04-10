//
// CCLabelBMFont Wrapper
//
// author xiaobo.wang
//
// 2017-04-06 22:34:28
//

#import "CCSpriteBatchNode.h"

enum
{
    kCCLabelAutomaticWidth = -1,
};

/** CCLabelBMFont is a subclass of CCSpriteBatchNode
 
 Features:
 - Treats each character like a CCSprite. This means that each individual character can be:
 - rotated
 - scaled
 - translated
 - tinted
 - chage the opacity
 - It can be used as part of a menu item.
 - anchorPoint can be used to align the "label"
 - Supports AngelCode text format
 
 Limitations:
 - All inner characters are using an anchorPoint of (0.5f, 0.5f) and it is not recommend to change it
 because it might affect the rendering
 
 CCLabelBMFont implements the protocol CCLabelProtocol, like CCLabel and CCLabelAtlas.
 CCLabelBMFont has the flexibility of CCLabel, the speed of CCLabelAtlas and all the features of CCSprite.
 If in doubt, use CCLabelBMFont instead of CCLabelAtlas / CCLabel.
 
 Supported editors:
 - http://glyphdesigner.71squared.com/
 - http://www.bmglyph.com/
 - http://www.n4te.com/hiero/hiero.jnlp
 - http://slick.cokeandcode.com/demos/hiero.jnlp
 - http://www.angelcode.com/products/bmfont/
 
 @since v0.8
 */

@interface CCLabelBMFont : CCSpriteBatchNode <CCLabelProtocol, CCRGBAProtocol>
{
    BOOL isNeedCCLabelBMFontDealloc;
}

/** Purges the cached data.
 Removes from memory the cached configurations and the atlas name dictionary.
 @since v0.99.3
 */
+(void) purgeCachedData;

/** alignment used for the label */
@property (nonatomic,assign,readonly) CCTextAlignment alignment;

/** fntFile used for the font */
@property (nonatomic,retain) NSString* fntFile;

/** conforms to CCRGBAProtocol protocol */
@property (nonatomic,readwrite) GLubyte opacity;

/** conforms to CCRGBAProtocol protocol */
@property (nonatomic,readwrite) ccColor3B color;


/** creates a BMFont label with an initial string and the FNT file. */
+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile;

/** creates a BMFont label with an initial string, the FNT file, width, and alignment option */
+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment;

/** creates a BMFont label with an initial string, the FNT file, width, alignment option and the offset of where the glyphs start on the .PNG image */
+(id) labelWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment imageOffset:(CGPoint)offset;

/** init a BMFont label with an initial string and the FNT file */
-(id) initWithString:(NSString*)string fntFile:(NSString*)fntFile;

/** init a BMFont label with an initial string and the FNT file, width, and alignment option*/
-(id) initWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment;

/** init a BMFont label with an initial string and the FNT file, width, alignment option and the offset of where the glyphs start on the .PNG image */
-(id) initWithString:(NSString*)string fntFile:(NSString*)fntFile width:(float)width alignment:(CCTextAlignment)alignment imageOffset:(CGPoint)offset;

/** updates the font chars based on the string to render */
-(void) createFontChars;

/** set label width */
- (void)setWidth:(float)width;

/** set label alignment */
- (void)setAlignment:(CCTextAlignment)alignment;

@end
