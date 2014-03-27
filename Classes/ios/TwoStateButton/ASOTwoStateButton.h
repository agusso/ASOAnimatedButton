//
//  ASOTwoStateButton.h
//  ASOAnimatedButton
//
//  Created by Agus Soedibjo on 4/2/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASOTwoStateButton : UIButton

@property (strong, nonatomic) NSString *onStateImageName;
@property (strong, nonatomic) NSString *offStateImageName;
@property (nonatomic) BOOL isFadeEffectEnabled;
@property (nonatomic) NSTimeInterval effectDuration;
@property (readonly, nonatomic) BOOL isOn;

- (void)initAnimationWithFadeEffectEnabled:(BOOL)fadeEnabled;
- (void)addMenuItemView:(UIView *)menuItemView;
- (void)removeMenuItemView:(UIView *)menuItemView interval:(double)delayInSeconds;

@end
