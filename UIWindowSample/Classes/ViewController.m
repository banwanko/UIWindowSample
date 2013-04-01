//
//  ViewController.m
//  HudSample
//
//  Created by 渡辺 龍司 on 2013/01/07.
//  Copyright (c) 2013年 Excite Japan Co,. Ltd. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "InformationWindow.h"

@interface ViewController ()
@property (nonatomic, strong) InformationWindow         *informationWindow;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)dealloc {
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showHUDButtonAction:(id)sender {    
    // Window表示
    [InformationWindow openWindow];
}

@end
