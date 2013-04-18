//
//  RecipeIngredient.h
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/16.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import "Ingredient.h"

@interface RecipeIngredient : Ingredient

typedef enum {
    cup,
    litre,
    millilitre,
    teaspoon,
    tablespoon,
    gram
} UnitType;

@property UnitType units;
@property float quantity;

@end
