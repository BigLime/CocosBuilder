//
// CCTableView
//
// author ke.huang

#import "CCTableView.h"
#import "extensions/GUI/CCScrollView/CCTableView.h"
#import "ccTypeConvert.h"

@implementation CCTableView
-(id) init
{
    return [self initWithViewSize:CGSizeMake(200, 200) container:nil];
}

- (id) init:(void*) pThis
{
    if(!!pThis)
    {
        impl_               = pThis;
        isNeedTableViewDealloc_  = NO;
    }
    else
    {
        cocos2d::extension::TableView* tableView = cocos2d::extension::TableView::create();
        tableView->retain();
        
        impl_ = tableView;
        
        isNeedTableViewDealloc_  = YES;
    }
    self = [super init:impl_];
    return self;
}

-(id) initWithObject: (void*) object
{
    impl_               = object;
    static_cast<cocos2d::Ref*>(impl_)->retain();
    isNeedTableViewDealloc_  = YES;
    
    self = [super init:impl_];
    return self;
}

-(void) dealloc
{
    if (isNeedTableViewDealloc_)
    {
        ((cocos2d::extension::TableView*)impl_)->release();
    }
    [super dealloc];
}

-(void*) getImpl
{
    return impl_;
}

-(id)initWithViewSize:(CGSize)size container:(CCNode *)container
{
    cocos2d::extension::TableView* tableView = new cocos2d::extension::TableView();
    tableView->autorelease();
    tableView->retain();
    impl_ = tableView;
    tableView->initWithViewSize([ccTypeConvert CGSizeToSize:size],static_cast<cocos2d::Node*>([container getImpl]));
    isNeedTableViewDealloc_ = YES;
    
    self = [super init:impl_];
    return self;

}

-(CCVerticalFillOrder)verticalDirection
{
    cocos2d::extension::TableView* tableView = static_cast<cocos2d::extension::TableView*>(impl_);
    return CCVerticalFillOrder(tableView->getVerticalFillOrder());
}

-(void)setVerticalDirection:(CCVerticalFillOrder)verticalDirection
{
    cocos2d::extension::TableView* tableView = static_cast<cocos2d::extension::TableView*>(impl_);
    tableView->setVerticalFillOrder(cocos2d::extension::TableView::VerticalFillOrder(verticalDirection));
}

@end
