//
//  CustomCell.m
//  Ingredient
//
//  Created by Sean Coetzee on 2013/04/17.
//  Copyright (c) 2013 Blacklemon. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    UIImageView *i = (UIImageView *)[self viewWithTag:20];
    if(i != nil) {
        [i setHighlighted:selected];
    }
}

@end
