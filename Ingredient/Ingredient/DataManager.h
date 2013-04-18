//
//  DataManager.h
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/16.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject {
    
}

+ (NSArray *) getIngredientCategories;
+ (NSArray *) getIngredientsByCategory:(int) categoryId;
+ (NSArray *) getRecipeCategories;
+ (NSArray *) getRecipesByCategory:(int) categoryId;
+ (NSArray *) getSuppliers;
+ (NSArray *) getIngredientsBySupplier:(int) supplierId;

@end
