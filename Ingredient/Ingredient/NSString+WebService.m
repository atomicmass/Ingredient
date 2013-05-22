//
//  NSString+WebService.m
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/19.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import "NSString+WebService.h"

@implementation NSString (WebService)
-(id)JSON {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data
                                           options:NSJSONReadingMutableLeaves|NSJSONReadingMutableContainers
                                             error:nil];
}
@end
