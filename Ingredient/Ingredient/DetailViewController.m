//
//  DetailViewController.m
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/16.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import "DetailViewController.h"
#import "DataManager.h"
#import "CustomCell.h"

@interface DetailViewController () {
    NSArray *_objects;
}

- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (!self.detailItem) {
        NSLog(@"DetailViewController.configureView failed! No detail item.");
        return;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *title = [self.detailItem description];
    self.title = title;
    
    [self.loadingIndicator startAnimating];
    if([title isEqualToString:@"Ingredients"]) {
        [DataManager getIngredientCategories:^(NSArray *array) {
            _objects = [array copy];
            
            [self.loadingIndicator stopAnimating];
            [self.tableView reloadData];
        }];
    }
    else if([title isEqualToString:@"Recipes"]) {
        [DataManager getRecipeCategories:^(NSArray *array) {
            _objects = [array copy];
            
            [self.loadingIndicator stopAnimating];
            [self.tableView reloadData];
        }];
    } else if([title isEqualToString:@"Suppliers"]) {
        [DataManager getSuppliers:^(NSArray *array) {
            _objects = [array copy];
            
            [self.loadingIndicator stopAnimating];
            [self.tableView reloadData];
        }];
    }

    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableCell"];
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSDictionary *d = [_objects objectAtIndex:indexPath.row];
    cell.labelMainText.text = [NSString stringWithFormat:@"%@", [d objectForKey:@"name"]];
    
    return cell;
}
@end
