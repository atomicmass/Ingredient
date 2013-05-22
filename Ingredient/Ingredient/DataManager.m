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
#import "WebRequest.h"

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

+ (void) loadSuppliers:(ArrayHandler) handler {
    [WebRequest requestArray:@"suppliers"
                onCompletion:^(NSArray *array) {
                    suppliers = array;
                    if(handler) {
                        handler(array);
                    }
                }];
}

+ (void) loadRecipeCategories:(ArrayHandler) handler {
    [WebRequest requestArray:@"recipeCategories"
                onCompletion:^(NSArray *array) {
                    recipeCategories = array;
                    if(handler) {
                        handler(array);
                    }
                }];

}

+ (void) loadIngredientCategories:(ArrayHandler) handler {
    [WebRequest requestArray:@"ingredientCategories"
              onCompletion:^(NSArray *array) {
                  ingredientCategories = array;
                  if(handler) {
                      handler(array);
                  }
              }];
}

+ (void) getIngredientCategories:(ArrayHandler) handler {
    if(!ingredientCategories) {
        [self loadIngredientCategories:handler];
    }
    else {
        if(handler) {
            handler(ingredientCategories);
        }
    }
}

+ (void) getIngredientsByCategory:(int) categoryId withHandler:(ArrayHandler)handler {
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
}

+ (void) getRecipeCategories:(ArrayHandler) handler {
    if(!recipeCategories) {
        [self loadRecipeCategories:handler];
    }
    else {
        if(handler) {
            handler(recipeCategories);
        }
    }
}

+ (void) getRecipesByCategory:(int) categoryId withHandler:(ArrayHandler) handler {
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
}

+ (void) getSuppliers:(ArrayHandler) handler {
    if(suppliers == nil) {
        [self loadSuppliers:handler];
    }
    else {
        if(handler) {
            handler(suppliers);
        }
    }
}

+ (void) getIngredientsBySupplier:(int) supplierId withHandler:(ArrayHandler)handler {
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
}

@end
