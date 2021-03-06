//
//  XCTextSelectionStorage.m
//  XCActionBar
//
//  Created by Pedro Gomes on 23/03/2015.
//  Copyright (c) 2015 Pedro Gomes. All rights reserved.
//

#import "XCInputValidation.h"
#import "XCTextSelectionStorage.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@interface XCTextSelectionStorage ()

@property (nonatomic) NSMutableDictionary *selectionsByIdentifier;

@end

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
@implementation XCTextSelectionStorage

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (instancetype)init
{
    if((self = [super init])) {
        self.selectionsByIdentifier = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark - Public Methods

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (BOOL)saveSelection:(NSArray *)selectionRanges withIdentifier:(NSString *)identifier
{
    self.selectionsByIdentifier[identifier] = selectionRanges;
    
    return YES;
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (NSArray *)loadSelectionWithIdentifier:(NSString *)identifier;
{
    if(TRCheckContainsKey(self.selectionsByIdentifier, identifier) == NO) return @[];
    return self.selectionsByIdentifier[identifier];
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (BOOL)deleteSelectionWithIdentifier:(NSString *)identifier
{
    [self.selectionsByIdentifier removeObjectForKey:identifier];
    
    return YES;
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
- (BOOL)deleteAllSelections
{
    [self.selectionsByIdentifier removeAllObjects];
    
    return YES;
}

@end
