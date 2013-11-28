//
//  HeadCell.h
//  headbang
//
//  Created by stc-fueled on 11/26/13.
//  Copyright (c) 2013 dev155. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HeadCellProtocol;
@interface HeadCell : UITableViewCell

@property UIImage * img;
-(void)imageSet:(UIImage *)image;

@property (weak, nonatomic) id<HeadCellProtocol> delegate;

@end

@protocol HeadCellProtocol <NSObject>

-(void)addHeadImage:(HeadCell*)abc;

@end
