//
//  Ingredient.h
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/16.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"

@interface Ingredient : BaseEntity

@property (copy) NSString *name;
@property (copy) NSString *description;
@property NSArray *suppliers;
@property NSArray *recipes;
@property NSArray *categories;

@end
