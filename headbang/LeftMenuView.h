//
//  LeftMenuView.h
//  headbang
//
//  Created by stc-fueled on 11/26/13.
//  Copyright (c) 2013 dev155. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftMenuDelegate;


@interface LeftMenuView : UIView
@property id<LeftMenuDelegate> delegate;
@end

@protocol LeftMenuDelegate <NSObject>

-(void)saveButtonClicked;

@end