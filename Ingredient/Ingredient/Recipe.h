//
//  Recipe.h
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/16.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"

@interface Recipe : BaseEntity

@property (copy) NSString *description;
@property NSArray *recipeIngredients;
@property NSArray *method;
@property NSArray *categories;

@end
