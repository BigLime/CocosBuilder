//
// CCLabelTTF wrapper
//
// author xiaobo.wang
//
// 2017-04-07 11:59:16
//

#import "CCTexture2D.h"
#import "CCSprite.h"
#import "Platforms/CCNS.h"


/** CCLabel is a subclass of CCTextureNode that knows how to render text labels
 *
 * All features from CCTextureNode are valid in CCLabel
 *
 * CCLabel objects are slow. Consider using CCLabelAtlas or CCLabelBMFont instead.
 */

@interface CCLabelTTF : CCSprite <CCLabelProtocol>
{
    BOOL isNeedCCLabelTTFDealloc_;
}

/** Font name used in the label */
@property (nonatomic,retain) NSString* fontName;

/** Font size of the label */
@property (nonatomic,assign) float fontSize;

/** Dimensions of the label in Points */
@property (nonatomic,assign) CGSize dimensions;

/** The alignment of the label */
@property (nonatomic,assign) CCTextAlignment horizontalAlignment;

/** The vertical alignment of the label */
@property (nonatomic,assign) CCVerticalTextAlignment verticalAlignment;


/** creates a CCLabelTTF with a font name and font size in points*/
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size;

/** creates a CCLabelTTF from a fontname, horizontal alignment, dimension in points,  and font size in points.
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v1.0
 */
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment;

/** creates a CCLabelTTF from a fontname, horizontal alignment, dimension in points, line break mode, and font size in points.
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v1.0
 */
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment lineBreakMode:(CCLineBreakMode)lineBreakMode;

/** creates a CCLabelTTF from a fontname, horizontal alignment, vertical alignment, dimension in points, line break mode, and font size in points.
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v1.0
 */
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment)vertAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode ;

/** creates a CCLabel from a fontname, alignment, dimension in points and font size in points*/
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment)vertAlignment;


/** initializes the CCLabelTTF with a font name and font size in points */
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size;

/** initializes the CCLabelTTF with a font name, horizontal alignment, dimension in points, and font size in points.
 Default verticalAlignment: kCCVerticalTextAlignmentTop
 Default lineBreakMode: CCLineBreakModeWordWrap
 @since v1.0
 */
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment;

/** initializes the CCLabelTTF with a font name, horizontal alignment, dimension in points, line break mode and font size in points.
 Default verticalAlignment: kCCVerticalTextAlignmentTop
 
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v1.0
 */
- (id) initWithString:(NSString*)str fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment lineBreakMode:(CCLineBreakMode)lineBreakMode;

/** initializes the CCLabelTTF with a font name, horizontal alignment, vertical alignment,  dimension in points and font size in points.
 Default lineBreakMode: CCLineBreakModeWordWrap
 */
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment)vertAlignment;

/** initializes the CCLabelTTF with a font name, horizontal alignment, vertical alignment, dimension in points, line break mode and font size in points.
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v2.0
 */
- (id) initWithString:(NSString*)str fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment)vAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode ;

/** changes the string to render
 * @warning Changing the string is as expensive as creating a new CCLabelTTF. To obtain better performance use CCLabelAtlas or CCLabelBMFont.
 */
- (void) setString:(NSString*)str;

@end


