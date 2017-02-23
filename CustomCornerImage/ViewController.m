//
//  ViewController.m
//  CustomCornerImage
//
//  Created by caifeng on 2017/2/22.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    iv.center = self.view.center;
    [self.view addSubview:iv];
    
    UIImage *image = [UIImage mw_renderImageFormColor:[UIColor redColor]];
//    [image mw_cornerImageWithSize:iv.bounds.size fillColor:[UIColor whiteColor] completion:^(UIImage *image) {
//        iv.image = image;
//    }];
    iv.image = image;
    

}





@end
