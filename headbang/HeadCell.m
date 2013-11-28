//
//  HeadCell.m
//  headbang
//
//  Created by stc-fueled on 11/26/13.
//  Copyright (c) 2013 dev155. All rights reserved.
//

#import "HeadCell.h"

@interface HeadCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HeadCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    //NSLog(@"Hello");
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle] loadNibNamed:@"headPickerCell" owner:self options:nil] objectAtIndex:0] ;
    }
    

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)imageSet:(UIImage *)image{
    [self.imageView setImage:image];
}

@end
