//
// CCMenuItem Wrapper
//
// author xiaobo.wang
//
// 2017-04-07 15:03:26
//

#import "CCMenuItem.h"
#import "2d/CCMenuItem.h"
#import "ccTypeConvert.h"

static NSUInteger _globalFontSize   = kCCItemSize;
static NSString *_globalFontName    = @"Marker Felt";
static BOOL _globalFontNameRelease  = NO;


const NSInteger	kCCCurrentItemTag   = 0xc0c05001;
const NSInteger	kCCZoomActionTag    = 0xc0c05002;


#pragma mark -
#pragma mark CCMenuItem

@implementation CCMenuItem

// @synthesize isSelected=_isSelected;
-(void)setIsSelected:(BOOL)isSelected
{
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    
    if (isSelected)
        item->selected();
    else
        item->unselected();
}

-(BOOL)isSelected
{
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    return item->isSelected();
}

// @synthesize releaseBlockAtCleanup=_releaseBlockAtCleanup;
-(void)setReleaseBlockAtCleanup:(BOOL)releaseBlockAtCleanup
{
    // TODO: no implement in cpp
    NSAssert(NO, @"no implement in cpp");
}

-(BOOL)releaseBlockAtCleanup
{
    // TODO: no implement in cpp
    NSAssert(NO, @"no implement in cpp");
    return NO;
}

// @synthesize activeArea=_activeArea;
-(void)setActiveArea:(CGRect)activeArea
{
    // TODO: convert CGRect.
    // TODO: no implement.
    // TODO: no implement in cpp
    NSAssert(NO, @"no implement in cpp");
}

-(CGRect)activeArea
{
    // TODO: convert CGRect.
    // TODO: no implement.
    // TODO: no implement in cpp
    NSAssert(NO, @"no implement in cpp");
    
    CGRect ret = {};
    return ret;
}

+(id) itemWithTarget:(id) r selector:(SEL) s
{
    return [[[self alloc] initWithTarget:r selector:s] autorelease];
}

+(id) itemWithBlock:(void(^)(id sender))block {
    return [[[self alloc] initWithBlock:block] autorelease];
}

-(id) init
{
    return [self initWithBlock:nil];
}

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                       = pThis;
        isNeedCCMenuItemDealloc_    = NO;
    }
    else
    {
        cocos2d::MenuItem* menuItem = cocos2d::MenuItem::create(std::function<void(cocos2d::Ref*)>());
        menuItem->retain();
        
        isNeedCCMenuItemDealloc_    = YES;
        impl_ = menuItem;
    }
    
    self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_                     = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedCCMenuItemDealloc_  = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCMenuItemDealloc_)
    {
        cocos2d::MenuItem* menuItem = static_cast<cocos2d::MenuItem*>(impl_);
        menuItem->release();
    }
    
    [super dealloc];
}


-(id) initWithTarget:(id)target selector:(SEL)selector
{
    // avoid retain cycle
    __block id t = target;
    return [self initWithBlock:^(id sender) {
        
        [t performSelector:selector withObject:sender];
    }];
    
}

-(id)initWithBlock:(void (^)(id))block
{
    cocos2d::MenuItem* menuItem ;
    if(block)
        menuItem = cocos2d::MenuItem::create([block, self](cocos2d::Ref*) { [block self]; });
    else
        menuItem = cocos2d::MenuItem::create();
    menuItem->retain();
    
    isNeedCCMenuItemDealloc_ = YES;
    impl_ = menuItem;
    
    self = [super init:impl_];
    return self;
}

-(void)setContentSize:(CGSize)contentSize
{
    cocos2d::Size cppSize = [ccTypeConvert CGSizeToSize:contentSize];
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    item->setContentSize(cppSize);
}

-(void)cleanup
{
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    item->cleanup();
}

-(void)selected
{
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    item->selected();
}

-(void)unselected
{
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    item->unselected();
}

-(void)activate
{
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    item->activate();
}

-(void)setIsEnabled:(BOOL)enabled
{
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    item->setEnabled(enabled);
}

-(BOOL)isEnabled
{
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    return item->isEnabled();
}

-(void)setBlock:(void (^)(id))block
{
    cocos2d::MenuItem* item = static_cast<cocos2d::MenuItem*>(impl_);
    item->setCallback([block](cocos2d::Ref*){ [block self]; });
}

-(void) setTarget:(id)target selector:(SEL)selector
{
    __block id weakTarget = target; // avoid retain cycle
    [self setBlock:^(id sender) {
        [weakTarget performSelector:selector withObject:sender];
    }];
}

@end

#pragma mark -
#pragma mark CCMenuItemLabel

@implementation CCMenuItemLabel

// @synthesize disabledColor = _disabledColor;
-(void)setDisabledColor:(ccColor3B)disabledColor
{
    // TODO: convert ccColor3B
    cocos2d::MenuItemLabel* item = static_cast<cocos2d::MenuItemLabel*>(impl_);
    item->setDisabledColor([ccTypeConvert ccColor3BToColor3B: disabledColor]);
}

-(ccColor3B)disabledColor
{
    // TODO: convert ccColor3B
    cocos2d::MenuItemLabel* item = static_cast<cocos2d::MenuItemLabel*>(impl_);
    return [ccTypeConvert Color3BToccColor3B: item->getDisabledColor()];
}

+(id) itemWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol>*)label
{
    return [[[self alloc] initWithLabel:label block:nil] autorelease];
}

+(id) itemWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol>*)label target:(id)target selector:(SEL)selector
{
    return [[[self alloc] initWithLabel:label target:target selector:selector] autorelease];
}

+(id) itemWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol>*)label block:(void(^)(id sender))block {
    return [[[self alloc] initWithLabel:label block:block] autorelease];
}

-(id) initWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol>*)label target:(id)target selector:(SEL)selector
{
    // avoid retain cycle
    __block id t = target;
    
    self = [self initWithLabel:label block: ^(id sender) {
        [t performSelector:selector withObject:sender];
    }
            ];
    return self;
}

//
// Designated initializer
//
-(id) initWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol> *)label block:(void (^)(id))block
{
    cocos2d::Node* node = static_cast<cocos2d::Node*>([label getImpl]);
    cocos2d::MenuItemLabel* itemLabel = cocos2d::MenuItemLabel::create(node, [block, self](cocos2d::Ref*){ [block self]; });
    itemLabel->retain();
    
    isNeedCCMenuItemLabelDealloc_ = YES;
    impl_ = itemLabel;
    
    self = [super init:impl_];
    return self;
}

-(CCNode<CCLabelProtocol,CCRGBAProtocol> *)label
{
    cocos2d::MenuItemLabel* item = (cocos2d::MenuItemLabel*)impl_;
    return [[[CCNode<CCLabelProtocol, CCRGBAProtocol> alloc] initWithObject:item->getLabel()] autorelease];
}

-(void)setLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol> *)label
{
    cocos2d::MenuItemLabel* item = (cocos2d::MenuItemLabel*)impl_;
    cocos2d::Node* labelImpl = static_cast<cocos2d::Node*>([label getImpl]);
    
    item->setLabel(labelImpl);
}

-(void)setString:(NSString *)label
{
    cocos2d::MenuItemLabel* item = (cocos2d::MenuItemLabel*)impl_;
    item->setString([label UTF8String]);
}

-(void)activate
{
    cocos2d::MenuItemLabel* item = (cocos2d::MenuItemLabel*)impl_;
    item->activate();
}

-(void)selected
{
    cocos2d::MenuItemLabel* item = (cocos2d::MenuItemLabel*)impl_;
    item->selected();
}

-(void)unselected
{
    cocos2d::MenuItemLabel* item = (cocos2d::MenuItemLabel*)impl_;
    item->unselected();
}

-(void)setIsEnabled:(BOOL)enabled
{
    cocos2d::MenuItemLabel* item = (cocos2d::MenuItemLabel*)impl_;
    item->setEnabled(enabled);
}
@end

#pragma mark  - CCMenuItemAtlasFont

@implementation CCMenuItemAtlasFont

+(id) itemWithString: (NSString*) value charMapFile:(NSString*) charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap
{
    return [CCMenuItemAtlasFont itemWithString:value charMapFile:charMapFile itemWidth:itemWidth itemHeight:itemHeight startCharMap:startCharMap target:nil selector:nil];
}

+(id) itemWithString: (NSString*) value charMapFile:(NSString*) charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap target:(id)target selector:(SEL)selector
{
    return [[[self alloc] initWithString:value charMapFile:charMapFile itemWidth:itemWidth itemHeight:itemHeight startCharMap:startCharMap target:target selector:selector] autorelease];
}

+(id) itemWithString:(NSString*)value charMapFile:(NSString*)charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap block:(void(^)(id sender))block
{
    return [[[self alloc] initWithString:value charMapFile:charMapFile itemWidth:itemWidth itemHeight:itemHeight startCharMap:startCharMap block:block] autorelease];
}

-(id) initWithString: (NSString*) value charMapFile:(NSString*) charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap target:(id)target selector:(SEL)selector
{
    // avoid retain cycle
    __block id t = target;
    
    return [self initWithString:value charMapFile:charMapFile itemWidth:itemWidth itemHeight:itemHeight startCharMap:startCharMap block:^(id sender) {
        [t performSelector:selector withObject:sender];
    } ];
}

//
// Designated initializer
//
-(id) initWithString:(NSString*)value charMapFile:(NSString*)charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap block:(void(^)(id sender))block
{
    NSAssert( [value length] > 0, @"value length must be greater than 0");
    
    cocos2d::MenuItemAtlasFont* item = cocos2d::MenuItemAtlasFont::create([value UTF8String], [charMapFile UTF8String], itemWidth, itemHeight, startCharMap, [block, self](cocos2d::Ref*){ [block self];});
    item->retain();
    
    isNeedCCMenuItemAtlasFontDealloc_ = YES;
    impl_ = item;
    
    self = [super init:impl_];
    return self;
    
}

-(void) dealloc
{
    if (isNeedCCMenuItemAtlasFontDealloc_)
    {
        cocos2d::MenuItemAtlasFont* item = static_cast<cocos2d::MenuItemAtlasFont*>(impl_);
        item->release();
    }
    
    [super dealloc];
}


@end


#pragma mark - CCMenuItemFont

@implementation CCMenuItemFont

+(void)setFontSize:(NSUInteger)s
{
    _globalFontSize = s;
}

+(NSUInteger)fontSize
{
    return _globalFontSize;
}

+(void) setFontName: (NSString*) n
{
    if( _globalFontNameRelease )
        [_globalFontName release];
    
    _globalFontName = [n retain];
    _globalFontNameRelease = YES;
}

+(NSString*) fontName
{
    return _globalFontName;
}

+(id) itemWithString: (NSString*) value target:(id) r selector:(SEL) s
{
    return [[[self alloc] initWithString: value target:r selector:s] autorelease];
}

+(id) itemWithString: (NSString*) value
{
    return [[[self alloc] initWithString: value target:nil selector:nil] autorelease];
}

+(id) itemWithString: (NSString*) value block:(void(^)(id sender))block
{
    return [[[self alloc] initWithString:value block:block] autorelease];
}

-(id) initWithString: (NSString*) value target:(id)target selector:(SEL)selector
{
    // avoid retain cycle
    __block id t = target;
    
    return [self initWithString:value block:^(id sender) {
        [t performSelector:selector withObject:sender];
    }];
}

//
// Designated initializer
//
-(id) initWithString: (NSString*)string block:(void(^)(id sender))block
{
    NSAssert( [string length] > 0, @"Value length must be greater than 0");
    
    cocos2d::MenuItemFont* font = cocos2d::MenuItemFont::create([string UTF8String], [block](cocos2d::Ref*) { [block self]; });
    font->retain();
    
    isNeedCCMenuItemFontDealloc_ = YES;
    impl_ = font;
    
    self = [super init:impl_];
    return self;
}

-(void)dealloc
{
    if (isNeedCCMenuItemFontDealloc_)
    {
        cocos2d::MenuItemFont* font = static_cast<cocos2d::MenuItemFont*>(impl_);
        font->release();
    }
    [super dealloc];
}

-(void) setFontSize: (NSUInteger) size
{
    cocos2d::MenuItemFont* item = static_cast<cocos2d::MenuItemFont*>(impl_);
    item->setFontSize(size);
}

-(NSUInteger) fontSize
{
    cocos2d::MenuItemFont* item = static_cast<cocos2d::MenuItemFont*>(impl_);
    return item->getFontSize();
}

-(void) setFontName: (NSString*) fontName
{
    cocos2d::MenuItemFont* item = static_cast<cocos2d::MenuItemFont*>(impl_);
    item->setFontName([fontName UTF8String]);
}

-(NSString*) fontName
{
    cocos2d::MenuItemFont* item = static_cast<cocos2d::MenuItemFont*>(impl_);
    return [NSString stringWithCString:item->getFontName().c_str() encoding:NSUTF8StringEncoding];
}

@end

#pragma mark - CCMenuItemSprite
@implementation CCMenuItemSprite

-(id) init
{
    return [self init:nil];
}

-(id) init: (void*) pThis
{
    if (!!pThis)
    {
        impl_                       = pThis;
        isNeedCCMenuItemSpriteDealloc_    = NO;
    }
    else
    {
        cocos2d::MenuItemSprite* _menuItemSprite = cocos2d::MenuItemSprite::create(nil,nil,nil);
        _menuItemSprite->retain();
        
        isNeedCCMenuItemSpriteDealloc_    = YES;
        impl_ = _menuItemSprite;
    }
    
    self = [super init:impl_];
    return self;
}

// @synthesize normalImage=_normalImage, selectedImage=_selectedImage, disabledImage=_disabledImage;
-(void)setNormalImage:(CCNode<CCRGBAProtocol> *)normalImage
{
    cocos2d::MenuItemSprite* item = (cocos2d::MenuItemSprite*)impl_;
    cocos2d::Node* imageImpl = static_cast<cocos2d::Node*>([normalImage getImpl]);
    
    item->setNormalImage(imageImpl);
}

-(CCNode<CCRGBAProtocol> *)normalImage
{
    cocos2d::MenuItemSprite* item = (cocos2d::MenuItemSprite*)impl_;
    return [[[CCNode<CCRGBAProtocol> alloc] initWithObject: item->getNormalImage()] autorelease];
}

-(void)setSelectedImage:(CCNode<CCRGBAProtocol> *)selectedImage
{
    cocos2d::MenuItemSprite* item = (cocos2d::MenuItemSprite*)impl_;
    cocos2d::Node* imageImpl = static_cast<cocos2d::Node*>([selectedImage getImpl]);
    
    item->setSelectedImage(imageImpl);
}

-(CCNode<CCRGBAProtocol> *)selectedImage
{
    cocos2d::MenuItemSprite* item = (cocos2d::MenuItemSprite*)impl_;
    return [[[CCNode<CCRGBAProtocol> alloc] initWithObject: item->getSelectedImage()] autorelease];
}

-(void)setDisabledImage:(CCNode<CCRGBAProtocol> *)disabledImage
{
    cocos2d::MenuItemSprite* item = (cocos2d::MenuItemSprite*)impl_;
    cocos2d::Node* imageImpl = static_cast<cocos2d::Node*>([disabledImage getImpl]);
    
    item->setDisabledImage(imageImpl);
}

-(CCNode<CCRGBAProtocol> *)disabledImage
{
    cocos2d::MenuItemSprite* item = (cocos2d::MenuItemSprite*)impl_;
    return [[[CCNode<CCRGBAProtocol> alloc] initWithObject: item->getDisabledImage()] autorelease];
}

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite
{
    return [self itemWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:nil target:nil selector:nil];
}

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite target:(id)target selector:(SEL)selector
{
    return [self itemWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:nil target:target selector:selector];
}

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite disabledSprite:(CCNode<CCRGBAProtocol>*)disabledSprite target:(id)target selector:(SEL)selector
{
    return [[[self alloc] initWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:disabledSprite target:target selector:selector] autorelease];
}

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite block:(void(^)(id sender))block
{
    return [self itemWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:nil block:block];
}

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite disabledSprite:(CCNode<CCRGBAProtocol>*)disabledSprite block:(void(^)(id sender))block
{
    return [[[self alloc] initWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:disabledSprite block:block] autorelease];
}

-(id) initWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite disabledSprite:(CCNode<CCRGBAProtocol>*)disabledSprite target:(id)target selector:(SEL)selector
{
    // avoid retain cycle
    __block id t = target;
    
    return [self initWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:disabledSprite block:^(id sender) {
        [t performSelector:selector withObject:sender];
    } ];
}

//
// Designated initializer
//
-(id) initWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite disabledSprite:(CCNode<CCRGBAProtocol>*)disabledSprite block:(void(^)(id sender))block
{
    cocos2d::Node* normalSpriteImpl     = static_cast<cocos2d::Node*>([normalSprite getImpl]);
    cocos2d::Node* selectedSpriteImpl   = static_cast<cocos2d::Node*>([selectedSprite getImpl]);
    cocos2d::Node* disabledSpriteImpl   = static_cast<cocos2d::Node*>([disabledSprite getImpl]);
    
    cocos2d::MenuItemSprite* sprite = cocos2d::MenuItemSprite::create(normalSpriteImpl, selectedSpriteImpl, disabledSpriteImpl, [block, self](cocos2d::Ref*){ [block self]; });
    sprite->retain();
    
    isNeedCCMenuItemSpriteDealloc_ = YES;
    impl_ = sprite;
    
    self = [super init:impl_];
    return self;
}

-(void)dealloc
{
    if ( isNeedCCMenuItemSpriteDealloc_ )
    {
        cocos2d::MenuItemSprite* sprite = static_cast<cocos2d::MenuItemSprite*>(impl_);
        sprite->release();
    }
    
    [super dealloc];
}

-(void) selected
{
    cocos2d::MenuItemSprite* item = (cocos2d::MenuItemSprite*)impl_;
    item->selected();
}

-(void) unselected
{
    cocos2d::MenuItemSprite* item = (cocos2d::MenuItemSprite*)impl_;
    item->unselected();
}

-(void) setIsEnabled:(BOOL)enabled
{
    cocos2d::MenuItemSprite* item = (cocos2d::MenuItemSprite*)impl_;
    item->setEnabled(enabled);
}

@end

#pragma mark - CCMenuItemImage

@implementation CCMenuItemImage

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2
{
    return [self itemWithNormalImage:value selectedImage:value2 disabledImage: nil target:nil selector:nil];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 target:(id) t selector:(SEL) s
{
    return [self itemWithNormalImage:value selectedImage:value2 disabledImage: nil target:t selector:s];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 disabledImage: (NSString*) value3
{
    return [[[self alloc] initWithNormalImage:value selectedImage:value2 disabledImage:value3 target:nil selector:nil] autorelease];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 disabledImage: (NSString*) value3 target:(id) t selector:(SEL) s
{
    return [[[self alloc] initWithNormalImage:value selectedImage:value2 disabledImage:value3 target:t selector:s] autorelease];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 block:(void(^)(id sender))block
{
    return [self itemWithNormalImage:value selectedImage:value2 disabledImage:nil block:block];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 disabledImage:(NSString*) value3 block:(void(^)(id sender))block
{
    return [[[self alloc] initWithNormalImage:value selectedImage:value2 disabledImage:value3 block:block] autorelease];
}

-(id) initWithNormalImage: (NSString*) normalI selectedImage:(NSString*)selectedI disabledImage: (NSString*) disabledI target:(id)target selector:(SEL)selector
{
    // avoid retain cycle
    __block id t = target;
    
    return [self initWithNormalImage:normalI selectedImage:selectedI disabledImage:disabledI block:^(id sender) {
        [t performSelector:selector withObject:sender];
    }];
}


//
// Designated initializer
//
-(id) initWithNormalImage:(NSString*)normalI selectedImage:(NSString*)selectedI disabledImage:(NSString*)disabledI block:(void(^)(id sender))block
{
    cocos2d::MenuItemImage* itemImage = cocos2d::MenuItemImage::create([normalI UTF8String], [selectedI UTF8String], [disabledI UTF8String], [block](cocos2d::Ref*){ [block self]; });
    itemImage->retain();
    
    isNeedCCMenuItemImageDealloc_ = YES;
    impl_ = itemImage;
    
    self = [super init:impl_];
    return self;
}

-(void)dealloc
{
    if (isNeedCCMenuItemImageDealloc_)
    {
        cocos2d::MenuItemImage* itemImage = static_cast<cocos2d::MenuItemImage*>(impl_);
        itemImage->release();
    }
    
    [super dealloc];
}

//
// Setter of sprite frames
//
-(void) setNormalSpriteFrame:(CCSpriteFrame *)frame
{
    cocos2d::MenuItemImage* item = (cocos2d::MenuItemImage*)impl_;
    cocos2d::SpriteFrame* sprite = static_cast<cocos2d::SpriteFrame*>([frame getImpl]);
    item->setNormalSpriteFrame(sprite);
}

-(void) setSelectedSpriteFrame:(CCSpriteFrame *)frame
{
    cocos2d::MenuItemImage* item = (cocos2d::MenuItemImage*)impl_;
    cocos2d::SpriteFrame* sprite = static_cast<cocos2d::SpriteFrame*>([frame getImpl]);
    item->setSelectedSpriteFrame(sprite);
}

-(void) setDisabledSpriteFrame:(CCSpriteFrame *)frame
{
    cocos2d::MenuItemImage* item = (cocos2d::MenuItemImage*)impl_;
    cocos2d::SpriteFrame* sprite = static_cast<cocos2d::SpriteFrame*>([frame getImpl]);
    item->setDisabledSpriteFrame(sprite);
}
@end


#pragma mark - CCMenuItemToggle

@implementation CCMenuItemToggle

// @synthesize currentItem     = _currentItem;

// @synthesize subItems        = _subItems;
-(void)setSubItems:(NSMutableArray *)subItems
{
    cocos2d::Vector<cocos2d::MenuItem*> items;
    for ( CCMenuItem* item in subItems)
    {
        cocos2d::MenuItem* cppItem = static_cast<cocos2d::MenuItem*>(item);
        items.pushBack(cppItem);
    
    }
    cocos2d::MenuItemToggle* item = (cocos2d::MenuItemToggle*)impl_;
    item->setSubItems(items);
}

-(NSMutableArray *)subItems
{
    cocos2d::MenuItemToggle* item = (cocos2d::MenuItemToggle*)impl_;
    cocos2d::Vector<cocos2d::MenuItem*> items = item->getSubItems();
    
    // TODO: 基于多态的 box unbox。。。。
    NSMutableArray* ret = [[NSMutableArray alloc] init];
    for ( cocos2d::MenuItem* subItem : items)
    {
        [ret addObject: [[[CCMenuItem alloc] initWithObject: subItem] autorelease]];
    }
    return ret;
}



+(id) itemWithTarget: (id)t selector: (SEL)sel items: (CCMenuItem*) item, ...
{
    va_list args;
    va_start(args, item);
    
    id s = [self itemWithTarget: t selector:sel items: item vaList:args];
    
    va_end(args);
    return s;
}

+(id) itemWithTarget:(id)target selector:(SEL)selector items:(CCMenuItem*) item vaList: (va_list) args
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:2];
    
    int z = 0;
    CCMenuItem *i = item;
    while(i) {
        z++;
        [array addObject:i];
        i = va_arg(args, CCMenuItem*);
    }
    
    // avoid retain cycle
    __block id t = target;
    
    return [[[self alloc] initWithItems:array block:^(id sender) {
        [t performSelector:selector withObject:sender];
    }
             ] autorelease];
}


+(id) itemWithItems:(NSArray*)arrayOfItems
{
    return [[[self alloc] initWithItems:arrayOfItems block:NULL] autorelease];
}

+(id) itemWithItems:(NSArray*)arrayOfItems block:(void(^)(id))block
{
    return [[[self alloc] initWithItems:arrayOfItems block:block] autorelease];
}

-(id) initWithItems:(NSArray*)arrayOfItems block:(void(^)(id sender))block
{
    cocos2d::Vector<cocos2d::MenuItem*> items;
    for (CCMenuItem* item in arrayOfItems)
    {
        cocos2d::MenuItem* cppItem = static_cast<cocos2d::MenuItem*>([item getImpl]);
        items.pushBack(cppItem);
    }
    
    cocos2d::MenuItemToggle* item = cocos2d::MenuItemToggle::createWithCallback([block] (cocos2d::Ref*) { [block self];}, items);
    item->retain();
    
    isNeedCCMenuItemToggleDealloc_ = YES;
    impl_ = item;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedCCMenuItemToggleDealloc_)
    {
        cocos2d::MenuItemToggle* item = static_cast<cocos2d::MenuItemToggle*>(impl_);
        item->release();
    }
    
    [super dealloc];
}

-(void)setSelectedIndex:(NSUInteger)index
{
    cocos2d::MenuItemToggle* item = (cocos2d::MenuItemToggle*)impl_;
    item->setSelectedIndex(index);
}

-(NSUInteger) selectedIndex
{
    cocos2d::MenuItemToggle* item = (cocos2d::MenuItemToggle*)impl_;
    return item->getSelectedIndex();
}


-(void) selected
{
    cocos2d::MenuItemToggle* item = (cocos2d::MenuItemToggle*)impl_;
    item->selected();
}

-(void) unselected
{
    cocos2d::MenuItemToggle* item = (cocos2d::MenuItemToggle*)impl_;
    item->unselected();
}

-(void) activate
{
    cocos2d::MenuItemToggle* item = (cocos2d::MenuItemToggle*)impl_;
    item->activate();
}

-(void) setIsEnabled: (BOOL)enabled
{
    cocos2d::MenuItemToggle* item = (cocos2d::MenuItemToggle*)impl_;
    item->setEnabled(enabled);
}

-(CCMenuItem*) selectedItem
{
    cocos2d::MenuItemToggle* item = (cocos2d::MenuItemToggle*)impl_;
    return [[[CCMenuItem alloc] initWithObject: item->getSelectedItem()] autorelease];
}

@end
















