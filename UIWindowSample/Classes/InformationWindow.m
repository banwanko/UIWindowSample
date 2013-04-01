//
//  InformationWindow.m
//  HudSample
//
//  Created by 渡辺 龍司 on 2013/04/01.
//  Copyright (c) 2013年 Excite Japan Co,. Ltd. All rights reserved.
//

#import "InformationWindow.h"
#import <QuartzCore/QuartzCore.h>

@interface InformationWindow ()
@property (nonatomic, strong)   UIView                      *rootView;

@end

@implementation InformationWindow {
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

static InformationWindow      *_baseWindow;

+ (void)openWindow {
    if(_baseWindow == nil) {
        // Window作成
        CGRect rect = [[UIScreen mainScreen] bounds];
        _baseWindow = [[InformationWindow alloc] initWithFrame:rect];
        _baseWindow.hidden = YES;
        _baseWindow.windowLevel = UIWindowLevelNormal + 1;
        _baseWindow.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.4f];
        
        // View作成
        UIView *informationView = [[UIView alloc] initWithFrame:CGRectMake(0.0f,0.0f,200.0f, 200.0f)];
        informationView.backgroundColor = [UIColor blackColor];
        informationView.layer.cornerRadius = 10.0f;
        informationView.layer.masksToBounds = YES;
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicatorView startAnimating];
        [informationView addSubview:indicatorView];
        indicatorView.center = informationView.center;

        // プロパティに保持
        _baseWindow.rootView = informationView;
        [_baseWindow addSubview:informationView];
        
        // センタリング
        informationView.center = _baseWindow.center;
    }
    _baseWindow.alpha = 0.0f;
    _baseWindow.hidden = NO;
    // フェードイン
    [UIView animateWithDuration:0.3f animations:^{
        _baseWindow.alpha = 1.0f;
    } completion:^(BOOL finished) {
        // 5秒で消す        
        [self performSelector:@selector(closeWindow) withObject:nil afterDelay:5.0f];
    }];
 
}

+ (void)closeWindow {
    // フェードアウト
    [UIView animateWithDuration:0.3f animations:^{
        _baseWindow.alpha = 0.0f;
    } completion:^(BOOL finished) {
        _baseWindow.hidden = YES;
        [_baseWindow.rootView removeFromSuperview];
        _baseWindow.rootView = nil;
        _baseWindow = nil;
    }];
}


@end
