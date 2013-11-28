//
//  ViewController.m
//  headbang
//
//  Created by stc-fueled on 11/26/13.
//  Copyright (c) 2013 dev155. All rights reserved.
//

#import "ViewController.h"
#import "HeadCell.h"
#import "LeftMenuView.h"
#import "HeadImage.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet HeadImage *headImageView;
@property (weak, nonatomic) IBOutlet UIImageView *originalImageView;
- (IBAction)selectOriginal:(id)sender;
- (IBAction)selectHead:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIImageView *leftArrowImage;
@property (weak, nonatomic) IBOutlet UIImageView *rightArrowImage;
@property (weak, nonatomic) IBOutlet UILabel *selectImageLabel;
@property (weak, nonatomic) IBOutlet UILabel *selectHeadLabel;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *selectImageButton;
@property (weak, nonatomic) IBOutlet UIButton *selectHeadButton;
@property LeftMenuView * leftMenuView;
- (IBAction)menuButtonTapped:(id)sender;

@property (nonatomic) UIImagePickerController *imagePickerController;

@end

@implementation ViewController

NSString * cat = @"cat";
NSString * mufasa = @"mufasa";
NSString * piggy = @"piggy";

NSArray * headImageArray;

CGRect INITIAL_FRAME;
CGRect INITIAL_FRAME_MENU;

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.headImageView = [[HeadImage alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:self.headImageView];
    
    self.leftArrowImage.transform = CGAffineTransformRotate(self.headImageView.transform, 1.47);
    self.rightArrowImage.transform = CGAffineTransformRotate(self.headImageView.transform, 1.47);
    
    
    headImageArray  = [NSArray arrayWithObjects:cat,mufasa,piggy, nil];
    
    //self.originalImageView.image = [UIImage imageNamed:@"buddha.jpg"];
    //self.headImageView.image = [UIImage imageNamed:@"cat"];
    
    self.headImageView.userInteractionEnabled = YES;
    self.originalImageView.userInteractionEnabled = YES;
    
    self.table.frame = CGRectMake(self.table.frame.origin.x + 100, self.table.frame.origin.y, self.table.frame.size.width, self.table.frame.size.height);
    
    

    INITIAL_FRAME = self.table.frame;
    
    self.leftMenuView = [[[NSBundle mainBundle] loadNibNamed:@"LeftMenuView" owner:self options:nil] objectAtIndex:0];
    
    [self.view addSubview:self.leftMenuView];
    self.leftMenuView.frame = CGRectMake(-150, 180, 150, 290);
    INITIAL_FRAME_MENU = self.leftMenuView.frame;
    
    self.leftMenuView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectOriginal:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle: nil
                                                             delegate: self
                                                    cancelButtonTitle: @"Cancel"
                                               destructiveButtonTitle: nil
                                                    otherButtonTitles: @"Take a new photo", @"Choose from existing", nil];
    [actionSheet showInView:self.view];
    [self.selectImageLabel setHidden:YES];
    [self.leftArrowImage setHidden:YES];
}

- (IBAction)selectHead:(id)sender {
    [self.selectHeadLabel setHidden:YES];
    [self.rightArrowImage setHidden:YES];
    [UIView animateWithDuration:1 animations:^{
    self.table.frame = CGRectMake(self.table.frame.origin.x - 100, self.table.frame.origin.y, self.table.frame.size.width, self.table.frame.size.height);
     }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.headImageView setImage: [UIImage imageNamed: [headImageArray objectAtIndex:indexPath.row]]];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HeadCell * cell = [[HeadCell alloc]  initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell imageSet: [UIImage imageNamed:[headImageArray objectAtIndex:indexPath.row]]];
    
    cell.delegate = self;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}




- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self takeNewPhotoFromCamera];
            break;
        case 1:
            [self choosePhotoFromExistingImages];
        default:
            break;
    }
}

- (void)takeNewPhotoFromCamera
{
    NSLog(@"take pic");
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypeCamera;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypeCamera];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}

-(void)choosePhotoFromExistingImages
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.allowsEditing = NO;
        controller.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType: UIImagePickerControllerSourceTypePhotoLibrary];
        controller.delegate = self;
        [self.navigationController presentViewController: controller animated: YES completion: nil];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    self.originalImageView.image = image;
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    NSLog(@"selected");
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


-(void)showFinalImage{
    [self.table setHidden:YES];
    [self.selectImageButton setAlpha:0];
    [self.selectHeadButton setAlpha:0];
    
    
    
    self.leftMenuView.frame = INITIAL_FRAME_MENU;
    self.table.frame = INITIAL_FRAME;
    [self performSelector:@selector(saveToLibrary) withObject:nil afterDelay:0.1];


}

- (void)saveToLibrary {
        UIImageWriteToSavedPhotosAlbum([self screenshot], nil, nil, nil);
}
-(void)saveButtonClicked{
    [self showFinalImage];
    
    [UIView animateWithDuration:1 animations:^{
        
    }];
    
    
}

-(UIImage *) screenshot
{
    CGImageRef UIGetScreenImage(void);
    CGImageRef screen = UIGetScreenImage();
    UIImage* screenImage = [UIImage imageWithCGImage:screen];
    CGImageRelease(screen);
    return screenImage;
}

- (IBAction)menuButtonTapped:(id)sender {
    
    [self.menuButton setHidden:YES];
    [UIView animateWithDuration:1 animations:^{
        self.leftMenuView.frame = CGRectMake(INITIAL_FRAME_MENU.origin.x+150, INITIAL_FRAME_MENU.origin.y, INITIAL_FRAME_MENU.size.width, INITIAL_FRAME_MENU.size.height);
    }];
}

-(void)addHeadImage:(HeadCell*)currentCell{
    NSLog(@"her 2133 e");
    HeadImage *newHeadImage = [[HeadImage alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [newHeadImage setImage:currentCell.img];
    [self.view addSubview:newHeadImage];
}
@end
