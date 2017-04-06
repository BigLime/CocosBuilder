//
// CCLabelAtlas Wrapper
//
// author xiaobo.wang
//
// 2017-04-06 22:34:39
//

#import "CCAtlasNode.h"
#import "CCTextureAtlas.h"
#import "CCProtocols.h"

/** CCLabelAtlas is a subclass of CCAtlasNode.
 
 It can be as a replacement of CCLabel since it is MUCH faster.
 
 CCLabelAtlas versus CCLabel:
 - CCLabelAtlas is MUCH faster than CCLabel
 - CCLabelAtlas "characters" have a fixed height and width
 - CCLabelAtlas "characters" can be anything you want since they are taken from an image file
 
 A more flexible class is CCLabelBMFont. It supports variable width characters and it also has a nice editor.
 */
@interface CCLabelAtlas : CCAtlasNode  <CCLabelProtocol>
{
    BOOL isNeedCCLabelAtlasDealloc_;
}


/** creates the CCLabelAtlas with a string, a char map file(the atlas), the width and height of each element in points and the starting char of the atlas */
+(id) labelWithString:(NSString*) string charMapFile: (NSString*) charmapfile itemWidth:(NSUInteger)w itemHeight:(NSUInteger)h startCharMap:(NSUInteger)firstElement;

/** creates the CCLabelAtlas with a string and a configuration file
 @since v2.0
 */
+(id) labelWithString:(NSString*) string fntFile:(NSString*)fontFile;

/** initializes the CCLabelAtlas with a string, a char map file(the atlas), the width and height in points of each element and the starting char of the atlas */
-(id) initWithString:(NSString*) string charMapFile: (NSString*) charmapfile itemWidth:(NSUInteger)w itemHeight:(NSUInteger)h startCharMap:(NSUInteger)firstElement;

/** initializes the CCLabelAtlas with a string, a texture, the width and height in points of each element and the starting char of the atlas */
-(id) initWithString:(NSString*) theString texture:(CCTexture2D*)texture itemWidth:(NSUInteger)w itemHeight:(NSUInteger)h startCharMap:(NSUInteger)c;

/** initializes the CCLabelAtlas with a string and a configuration file
 @since v2.0
 */
-(id) initWithString:(NSString*) string fntFile:(NSString*)fontFile;

@end
