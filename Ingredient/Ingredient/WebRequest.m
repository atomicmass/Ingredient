//
//  WebRequest.m
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/19.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import "WebRequest.h"
#import "NSString+WebService.h"


@implementation WebRequest

+(void)requestString:(NSString *)path onCompletion:(RequestCompletionHandler)completionHandler {
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    
    NSString *url = [[self getBaseURL] stringByAppendingString:path];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]
                                                  cachePolicy:NSURLCacheStorageAllowedInMemoryOnly
                                              timeoutInterval:10];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:backgroundQueue
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               if(completionHandler) {
                                   dispatch_async(dispatch_get_main_queue(), ^{
                                        completionHandler(result, error);
                                   });
                               }
                           }];
}

+(void)requestDictionary:(NSString *)path onCompletion:(RequestDictionaryHandler)dictionaryHandler {
    [self requestString:path onCompletion:^(NSString *result, NSError *error) {
        NSDictionary *res = nil;
        if(!error && ![result isEqualToString:@""]) {
            res = [result JSON];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            dictionaryHandler(res);
        });
    }];
}

+(void)requestArray:(NSString *)path onCompletion:(RequestArrayHandler)arrayHandler {
    [self requestString:path onCompletion:^(NSString *result, NSError *error) {
        NSArray *res = nil;
        if(!error && ![result isEqualToString:@""]) {
            res = [result JSON];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            arrayHandler(res);
        });
    }];
}


+(NSString *) getBaseURL {
    return @"http://localhost:8080/ingredient/resources/rest/";
}
@end
