//
//  ModalDataBase.h
//  StreetCat
//
//  Created by Maitreya Tech 750 on 03/04/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModalDataBase : NSObject

@property (nonatomic, retain) NSMutableDictionary *catelog;
@property (retain, nonatomic) NSString *selectedCatlog;
@property (retain, nonatomic) NSString *selectedCatlogType;
@property (retain, nonatomic) NSString *selectedItem;

+ (id) sharedModel;
- (id) allTypes;
- (id) allItems;
- (id) allItemsOfType:(NSUInteger) indexPath;
- (id) allItemsForKey:(NSString *) key;

- (id) currentCatelogTypeAtIndex:(NSUInteger) indexPath;

- (id) currentItemAtIndex: (NSUInteger) indexPath;


@end
