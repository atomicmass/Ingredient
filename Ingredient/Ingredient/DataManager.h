//
//  DataManager.h
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/16.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DictionaryHandler)(NSDictionary *dictionary);
typedef void(^ArrayHandler)(NSArray *array);

@interface DataManager : NSObject {
    
}

+ (void) getIngredientCategories:(ArrayHandler) handler;
+ (void) getIngredientsByCategory:(int) categoryId withHandler:(ArrayHandler) handler;
+ (void) getRecipeCategories:(ArrayHandler) handler;
+ (void) getRecipesByCategory:(int) categoryId withHandler:(ArrayHandler) handler;
+ (void) getSuppliers:(ArrayHandler) handler;
+ (void) getIngredientsBySupplier:(int) supplierId withHandler:(ArrayHandler) handler;

@end
