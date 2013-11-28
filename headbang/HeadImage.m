//
//  HeadImage.m
//  headbang
//
//  Created by stc-fueled on 11/28/13.
//  Copyright (c) 2013 dev155. All rights reserved.
//

#import "HeadImage.h"

@implementation HeadImage

- (id)initWithFrame:(CGRect)frame
{   NSLog(@"here");
    self = [super initWithFrame:frame];
    if (self){
        
        self.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
        [self addGestureRecognizer:panRecognizer];
        
        UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchDetected:)];
        [self addGestureRecognizer:pinchRecognizer];
        
        UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationDetected:)];
        [self addGestureRecognizer:rotationRecognizer];
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
        tapRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}
- (void)panDetected:(UIPanGestureRecognizer *)panRecognizer{
    NSLog(@"pan");
    CGPoint translation = [panRecognizer translationInView:self];
    CGPoint imageViewPosition = self.center;
    imageViewPosition.x += translation.x;
    imageViewPosition.y += translation.y;
    self.center = imageViewPosition;
    [panRecognizer setTranslation:CGPointZero inView:self];
}

- (void)pinchDetected:(UIPinchGestureRecognizer *)pinchRecognizer{
    NSLog(@"pan");
    CGFloat scale = pinchRecognizer.scale;
    self.transform = CGAffineTransformScale(self.transform, scale, scale);
    pinchRecognizer.scale = 1.0;
    
}

- (void)rotationDetected:(UIRotationGestureRecognizer *)rotationRecognizer{
    CGFloat angle = rotationRecognizer.rotation;
    self.transform = CGAffineTransformRotate(self.transform, angle);
    rotationRecognizer.rotation = 0.0;
}

- (void)tapDetected:(UITapGestureRecognizer *)tapRecognizer{
    NSLog(@"pan");
    NSLog(@"Tapped Here");
    // call delegate function to remove the table
}

@end
