//
// CCSpriteFrameCache
//
// author ke.huang 17/4/7


#import "CCSpriteFrameCache.h"
#import "2d/CCSpriteFrameCache.h"

@implementation CCSpriteFrameCache

static CCSpriteFrameCache *_sharedSpriteFrameCache=nil;

+ (CCSpriteFrameCache *)sharedSpriteFrameCache
{
    if (!_sharedSpriteFrameCache)
        _sharedSpriteFrameCache = [[CCSpriteFrameCache alloc] init];
    
    return _sharedSpriteFrameCache;
}

+(id)alloc
{
    NSAssert(_sharedSpriteFrameCache == nil, @"Attempted to allocate a second instance of a singleton.");
    return [super alloc];
}

+(void)purgeSharedSpriteFrameCache
{
    [_sharedSpriteFrameCache release];
    _sharedSpriteFrameCache = nil;
}

-(id) init
{
    if( (self=[super init]) ) {
    }
    
    return self;

}
- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ = %p | num of sprite frames =  %lu %@>", [self class], self, 0l,@"no thisDescription in c++"];
}

-(void) dealloc
{
    cocos2d::SpriteFrameCache::getInstance()->destroyInstance();
    [super dealloc];
}

-(void) addSpriteFramesWithDictionary:(NSDictionary*)dictionary textureReference:(id)textureReference
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    //TODO NSDictionary
    NSString *textureFileName = nil;
    CCTexture2D * texture = nil;
    
    if ( [textureReference isKindOfClass:[NSString class]] )
    {
        textureFileName	= textureReference;
    }
    else if ( [textureReference isKindOfClass:[CCTexture2D class]] )
    {
        texture = textureReference;
    }
    
    if ( textureFileName )
    {
        spriteFrameCache->addSpriteFramesWithDictionary(dictionary,[textureFileName UTF8String]);
    }
    else
    {
        spriteFrameCache->addSpriteFramesWithDictionary(dictionary,((cocos2d::Texture2D*)[texture getImpl]));
    }
}
-(void) addSpriteFramesWithDictionary:(NSDictionary*)dictionary textureFilename:(NSString*)textureFilename
{
    //TODO NSDictionary
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    spriteFrameCache->addSpriteFramesWithDictionary(dictionary,[textureFilename UTF8String]);
}

-(void) addSpriteFramesWithDictionary:(NSDictionary *)dictionary texture:(CCTexture2D *)texture
{
    //TODO NSDictionary
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    spriteFrameCache->addSpriteFramesWithDictionary(dictionary,((cocos2d::Texture2D*)[texture getImpl]));
}
-(void) addSpriteFramesWithFile:(NSString*)plist textureReference:(id)textureReference
{
    if( ! [_loadedFilenames member:plist] ) {
        
        NSString *path = [[CCFileUtils sharedFileUtils] fullPathForFilename:plist];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        
        [self addSpriteFramesWithDictionary:dict textureReference:textureReference];
        
        [_loadedFilenames addObject:plist];
    }
    else
        CCLOGINFO(@"cocos2d: CCSpriteFrameCache: file already loaded: %@", plist);
}
-(void) addSpriteFramesWithFile:(NSString*)plist textureFilename:(NSString*)textureFilename
{
    return [self addSpriteFramesWithFile:plist textureReference:textureFilename];
}

-(void) addSpriteFramesWithFile:(NSString*)plist texture:(CCTexture2D*)texture
{
    return [self addSpriteFramesWithFile:plist textureReference:texture];
}
-(void) addSpriteFramesWithFile:(NSString*)plist
{
    NSAssert(plist, @"plist filename should not be nil");
    
    if( ! [_loadedFilenames member:plist] ) {
        
        NSString *path = [[CCFileUtils sharedFileUtils] fullPathForFilename:plist];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        
        NSString *texturePath = nil;
        NSDictionary *metadataDict = [dict objectForKey:@"metadata"];
        if( metadataDict )
            // try to read  texture file name from meta data
            texturePath = [metadataDict objectForKey:@"textureFileName"];
        
        
        if( texturePath )
        {
            // build texture path relative to plist file
            NSString *textureBase = [plist stringByDeletingLastPathComponent];
            texturePath = [textureBase stringByAppendingPathComponent:texturePath];
        } else {
            // build texture path by replacing file extension
            texturePath = [plist stringByDeletingPathExtension];
            texturePath = [texturePath stringByAppendingPathExtension:@"png"];
            
            CCLOG(@"cocos2d: CCSpriteFrameCache: Trying to use file '%@' as texture", texturePath);
        }
        
        [self addSpriteFramesWithDictionary:dict textureFilename:texturePath];
        
        [_loadedFilenames addObject:plist];
    }
    else 
        CCLOGINFO(@"cocos2d: CCSpriteFrameCache: file already loaded: %@", plist);
}
-(void) addSpriteFrame:(CCSpriteFrame*)frame name:(NSString*)frameName
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    std::string name = [frameName UTF8String];
    cocos2d::SpriteFrame* spriteFrame = (cocos2d::SpriteFrame*)[frame getImpl];
    spriteFrameCache->addSpriteFrame(spriteFrame,name);
}
-(void) removeSpriteFrames
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    spriteFrameCache->removeSpriteFrames();
}
-(void) removeUnusedSpriteFrames
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    spriteFrameCache->removeUnusedSpriteFrames();
}
-(void) removeSpriteFrameByName:(NSString*)name
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    std::string nameStr = [name UTF8String];
    spriteFrameCache->removeSpriteFrameByName(nameStr);
}
- (void) removeSpriteFramesFromFile:(NSString*) plist
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    std::string plistStr = [plist UTF8String];
    spriteFrameCache->removeSpriteFramesFromFile(plistStr);
}
- (void) removeSpriteFramesFromDictionary:(NSDictionary*) dictionary
{
    //TODO NSDictionary
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    priteFrameCache->removeSpriteFramesFromDictionary(dictionary);

}
- (void) removeSpriteFramesFromTexture:(CCTexture2D*) texture
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    cocos2d::Texture2D* texture2D = (cocos2d::Texture2D*)[texture getImpl];
    priteFrameCache->removeSpriteFramesFromTexture(texture2D);
}
-(CCSpriteFrame*) spriteFrameByName:(NSString*)name
{
    cocos2d::SpriteFrameCache* spriteFrameCache = cocos2d::SpriteFrameCache::getInstance();
    std::string nameStr = [name UTF8String];
    cocos2d::SpriteFrame* spriteFrame = priteFrameCache->getSpriteFrameByName(nameStr);
    return [[[CCSpriteFrame alloc ]initWithObject: spriteFrame] autorelease];
}

@end
