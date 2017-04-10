//
// CCMenu wrapper
//
// author xiaobo.wang
//
// 2017-04-07 14:14:10
//

#import "CCMenu.h"
#import "2d/CCMenu.h"

enum
{
    kDefaultPadding =  5,
};

#pragma mark - CCMenu

@implementation CCMenu

// @synthesize enabled=_enabled;
-(void)setEnabled:(BOOL)enabled
{
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    menu->setEnabled(enabled);
}

-(BOOL)enabled
{
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    return menu->isEnabled();
}


+(id) menuWithArray:(NSArray *)arrayOfItems
{
    return [[[self alloc] initWithArray:arrayOfItems] autorelease];
}

+(id) menuWithItems: (CCMenuItem*) item, ...
{
    va_list args;
    va_start(args,item);
    
    id ret = [self menuWithItems:item vaList:args];
    
    va_end(args);
    
    return ret;
}

+(id) menuWithItems: (CCMenuItem*) item vaList: (va_list) args
{
    NSMutableArray *array = nil;
    if( item ) {
        array = [NSMutableArray arrayWithObject:item];
        CCMenuItem *i = va_arg(args, CCMenuItem*);
        while(i) {
            [array addObject:i];
            i = va_arg(args, CCMenuItem*);
        }
    }
    
    return [[[self alloc] initWithArray:array] autorelease];
}

-(id) init
{
    return [self initWithArray:nil];
}


-(id) initWithArray:(NSArray *)arrayOfItems
{
    cocos2d::Vector<cocos2d::MenuItem*> ccArrayOfItems;
    for (CCMenuItem* item in arrayOfItems)
    {
        cocos2d::MenuItem* cppItem = static_cast<cocos2d::MenuItem*>([item getImpl]);
        ccArrayOfItems.pushBack(cppItem);
    }

    cocos2d::Menu* menu = cocos2d::Menu::createWithArray(ccArrayOfItems);
    menu->retain();
    
    isNeedCCMenuDealloc_ = YES;
    impl_ = menu;
    
    self = [super init:impl_];
    return self;
}

-(void)dealloc
{
    if (isNeedCCMenuDealloc_)
    {
        cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
        menu->release();
    }
    [super dealloc];
}

-(void)addChild:(CCNode *)node z:(NSInteger)z tag:(NSInteger)tag
{
    cocos2d::Node* cppNode = static_cast<cocos2d::Node*>([node getImpl]);
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    menu->addChild(cppNode, z, tag);
}

-(void)onExit
{
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    menu->onExit();
}

#pragma mark Menu - Events

-(void)setHandlerPriority:(NSInteger)newPriority
{
    // TODO: NO IMPL IN CPP
    NSAssert(NO, @"[CCMenu setHandlerPriority]:: NO IMPL IN CPP");
    (void)newPriority;
}

#pragma mark Menu - Events Touches

#pragma mark Menu - Events Mouse

-(CCMenuItem *) itemForMouseEvent: (NSEvent *) event
{
    // TODO: NO IMPL IN CPP;
    NSAssert(NO, @"[CCMenu itemForMouseEvent]:: NO IMPL IN CPP");
    return nil;
}

-(BOOL) ccMouseUp:(NSEvent *)event
{
    // TODO: NO IMPL IN CPP;
    NSAssert(NO, @"[CCMenu ccMouseUp]:: NO IMPL IN CPP");
    return NO;
}

-(BOOL) ccMouseDown:(NSEvent *)event
{
    // TODO: NO IMPL IN CPP;
    NSAssert(NO, @"[CCMenu ccMouseDown]:: NO IMPL IN CPP");
    return NO;
}

-(BOOL) ccMouseDragged:(NSEvent *)event
{
    // TODO: NO IMPL IN CPP;
    NSAssert(NO, @"[CCMenu ccMouseDragged]:: NO IMPL IN CPP");
    return NO;
}

#pragma mark Menu - Alignment

-(void)alignItemsVertically
{
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    menu->alignItemsVertically();
}

-(void)alignItemsVerticallyWithPadding:(float)padding
{
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    menu->alignItemsVerticallyWithPadding(padding);
}

-(void) alignItemsHorizontally
{
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    menu->alignItemsHorizontally();
}

-(void) alignItemsHorizontallyWithPadding:(float)padding
{
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    menu->alignItemsHorizontallyWithPadding(padding);
}

-(void) alignItemsInColumns: (NSNumber *) columns, ...
{
    va_list args;
    va_start(args, columns);
    
    [self alignItemsInColumns:columns vaList:args];
    
    va_end(args);
}

-(void) alignItemsInColumns: (NSNumber *) columns vaList: (va_list) args
{
    NSMutableArray *rows = [[NSMutableArray alloc] initWithObjects:columns, nil];
    columns = va_arg(args, NSNumber*);
    while(columns) {
        [rows addObject:columns];
        columns = va_arg(args, NSNumber*);
    }
    
    [self alignItemsInColumnsWithArray:rows];
    
    [rows release];
}

-(void)alignItemsInColumnsWithArray:(NSArray *)arrayOfNumbers
{
    cocos2d::ValueVector columns;
    for (NSNumber* number in arrayOfNumbers)
    {
        unsigned int i = [number unsignedIntegerValue];
        columns.push_back(cocos2d::Value(i));
    }
    
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    menu->alignItemsInColumnsWithArray(columns);
}

-(void) alignItemsInRows: (NSNumber *) rows, ...
{
    va_list args;
    va_start(args, rows);
    
    [self alignItemsInRows:rows vaList:args];
    
    va_end(args);
}

-(void) alignItemsInRows: (NSNumber *) rows vaList: (va_list) args
{
    NSMutableArray *columns = [[NSMutableArray alloc] initWithObjects:rows, nil];
    rows = va_arg(args, NSNumber*);
    while(rows) {
        [columns addObject:rows];
        rows = va_arg(args, NSNumber*);
    }
    
    [self alignItemsInRowsWithArray:columns];
    
    [columns release];
}

-(void) alignItemsInRowsWithArray:(NSArray*) arrayOfNumbers
{
    cocos2d::ValueVector columns;
    for (NSNumber* number in arrayOfNumbers)
    {
        unsigned int i = [number unsignedIntegerValue];
        columns.push_back(cocos2d::Value(i));
    }
    
    cocos2d::Menu* menu = static_cast<cocos2d::Menu*>(impl_);
    menu->alignItemsInColumnsWithArray(columns);
}

@end









































