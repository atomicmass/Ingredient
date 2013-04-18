//
//  DataManager.m
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/16.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import "DataManager.h"
#import "Ingredient.h"
#import "IngredientCategory.h"
#import "Recipe.h"
#import "RecipeCategory.h"
#import "Supplier.h"

@implementation DataManager

static NSArray *ingredients;
static NSArray *recipeCategories;
static NSArray *recipes;
static NSArray *ingredientCategories;
static NSArray *suppliers;

+ (void) loadIngredients {
    //todo: initialize properly and get data (all ingredients)
    ingredients = [[NSArray alloc] init];
}

+ (void) loadRecipes {
    //todo: initialize and load
    recipes = [[NSArray alloc] init];
}

+ (void) loadSuppliers {
    //todo: load properly
    suppliers = [[NSArray alloc] init];
}

+ (void) loadRecipeCategories {
    //todo: load
    recipeCategories = [[NSArray alloc] init];
}

+ (void) loadIngredientCategories {
    //todo: load
    //ingredientCategories = [[NSArray alloc] init];
    
    IngredientCategory *c1 = [[IngredientCategory alloc] init];
    c1.entityId = 1;
    c1.name = @"Vegetables";
    
    IngredientCategory *c2 = [[IngredientCategory alloc] init];
    c2.entityId = 2;
    c2.name = @"Meat";
    
    IngredientCategory *c3 = [[IngredientCategory alloc] init];
    c3.entityId = 3;
    c3.name = @"Poultry";
    
    ingredientCategories = [[NSArray alloc] initWithObjects:c1, c2, c3, nil];
}

+ (NSArray *) getIngredientCategories {
    if(ingredientCategories == nil) {
        [self loadIngredientCategories];
    }
    
    return ingredientCategories;
}

+ (NSArray *) getIngredientsByCategory:(int) categoryId {
    if(ingredients == nil) {
        [self loadIngredients];
    }
    
    NSMutableArray *a = [[NSMutableArray alloc] init];
    for (Ingredient *i in ingredients) {
        for (IngredientCategory *c in i.categories) {
            if(c.entityId == categoryId) {
                [a addObject:i];
                continue; //next ingredient
            }
        }
    }
    
    return [a copy];
}

+ (NSArray *) getRecipeCategories {
    if(recipeCategories == nil) {
        [self loadRecipeCategories];
    }
    
    return recipeCategories;
}

+ (NSArray *) getRecipesByCategory:(int) categoryId {
    if(recipes == nil) {
        [self loadRecipes];
    }
    
    NSMutableArray *a = [[NSMutableArray alloc] init];
    for (Recipe *r in recipes) {
        for (RecipeCategory *c in r.categories) {
            if(c.entityId == categoryId) {
                [a addObject:r];
                continue; //next recipe
            }
        }
    }
    
    return [a copy];
}

+ (NSArray *) getSuppliers {
    if(suppliers == nil) {
        [self loadSuppliers];
    }
    
    return suppliers;
}

+ (NSArray *) getIngredientsBySupplier:(int) supplierId {
    if(ingredients == nil) {
        [self loadIngredients];
    }
    
    NSMutableArray *a = [[NSMutableArray alloc] init];
    for (Ingredient *i in ingredients) {
        for (Supplier *s in i.suppliers) {
            if(s.entityId == supplierId) {
                [a addObject:i];
                continue; //next ingredient
            }
        }
    }
    
    return [a copy];
}

@end
