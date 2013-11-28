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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"headPickerCell" owner:self options:nil] objectAtIndex:0] ;
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
        tapRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}

#pragma mark Gesture Functions
- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer{
    [self.delegate addHeadImage:self];
}

#pragma mark Image Functions
- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
}

-(void)imageSet:(UIImage *)image{
    self.img = image;
    [self.imageView setImage:image];
}
@end
