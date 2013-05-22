//
//  DetailViewController.h
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/16.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;

@end
