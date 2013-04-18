//
//  Supplier.h
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/16.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseEntity.h"

@interface Supplier : BaseEntity

@property (copy) NSString *location;
@property NSArray *ingredients;

@end
