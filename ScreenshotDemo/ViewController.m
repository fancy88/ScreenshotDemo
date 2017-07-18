//
//  ViewController.m
//  ScreenshotDemo
//
//  Created by apple on 2017/7/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ScreenShot.h"

#define KSCREENW [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel     *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"屏幕截图";
    
     self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 180, KSCREENW - 20, (KSCREENW - 20) * 0.66)];
    [self.imgView setImage:[UIImage imageNamed:@"123"]];
    [self.view addSubview:self.imgView];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.imgView.frame) + 10, KSCREENW - 20, 30)];
    self.label.text = @"点击保存, 完成截图";
    self.label.textColor = [UIColor redColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
    self.navigationItem.rightBarButtonItem = rightBar;
}



- (void)rightButtonClick{
    
    UIImage *image = [self.view screenshotWithRect: self.imgView.frame];
    [self loadImageFinished: image];
}


- (void)loadImageFinished:(UIImage *)image{
    if (image) {
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    NSLog(@"Good!");
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
