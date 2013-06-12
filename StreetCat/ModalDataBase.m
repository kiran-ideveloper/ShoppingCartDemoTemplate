//
//  ModalDataBase.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 03/04/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "ModalDataBase.h"

@implementation ModalDataBase

+ (id)sharedModel
{
    static ModalDataBase *sharedModelData = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModelData = [[self alloc]init];
    });
    return sharedModelData;
}


- (id) allTypes
{
    //NSLog(@"%@",[[self.catelog objectForKey:self.selectedCatlog] allKeys]);
    return [[self.catelog objectForKey:self.selectedCatlog] allKeys];
}

- (id) currentCatelogTypeAtIndex:(NSUInteger) indexPath
{
   // NSLog(@"%@",[[self allTypes] objectAtIndex:indexPath]);
    return [[self allTypes] objectAtIndex:indexPath];
}

- (id) allItems
{
    return [[self.catelog objectForKey:self.selectedCatlog] objectForKey:self.selectedCatlogType];
}

- (id) allItemsOfType:(NSUInteger) indexPath
{
    return [[[self allTypes] objectAtIndex:indexPath] allKeys];
}

- (id) allItemsForKey:(NSString *) key
{
    return [[self.catelog objectForKey:self.selectedCatlog] objectForKey:key];
}

- (id) currentItemAtIndex: (NSUInteger) indexPath
{
    return [[self allItems] objectAtIndex:indexPath];
}


@end
