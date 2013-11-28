//
//  ViewController.h
//  headbang
//
//  Created by stc-fueled on 11/26/13.
//  Copyright (c) 2013 dev155. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftMenuView.h"
#import "HeadCell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,HeadCellProtocol,LeftMenuDelegate>

@end
