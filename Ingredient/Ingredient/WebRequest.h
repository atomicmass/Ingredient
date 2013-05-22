//
//  WebRequest.h
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/19.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestCompletionHandler)(NSString *result, NSError *error);
typedef void(^RequestDictionaryHandler)(NSDictionary *result);
typedef void(^RequestArrayHandler)(NSArray *result);

@interface WebRequest : NSObject
+(void)requestString:(NSString *)path onCompletion:(RequestCompletionHandler)completionHandler;
+(void)requestDictionary:(NSString *)path onCompletion:(RequestDictionaryHandler)dictionaryHandler;
+(void)requestArray:(NSString *)path onCompletion:(RequestArrayHandler)arrayHandler;
@end
