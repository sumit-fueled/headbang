//
//  LeftMenuView.m
//  headbang
//
//  Created by stc-fueled on 11/26/13.
//  Copyright (c) 2013 dev155. All rights reserved.
//

#import "LeftMenuView.h"

@interface LeftMenuView ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

-(IBAction)saveButtonTapped:(id)sender;

@end

@implementation LeftMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(IBAction)saveButtonTapped:(id)sender{
    [self.delegate saveButtonClicked];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
