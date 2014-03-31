//
//  ASOTwoStateButton.h
//  ASOAnimatedButton
//
//  Created by Agus Soedibjo on 4/2/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASOTwoStateButton : UIButton

// Store image name for one of the state
@property (strong, nonatomic) NSString *onStateImageName;

// Store image name for the other state
@property (strong, nonatomic) NSString *offStateImageName;

// Control whether fade effect is enabled between state changing
@property (nonatomic) BOOL isFadeEffectEnabled;

// Control the effect duration between state changing
@property (nonatomic) NSTimeInterval effectDuration;

// Toggle value between state
@property (readonly, nonatomic) BOOL isOn;

- (void)initAnimationWithFadeEffectEnabled:(BOOL)fadeEnabled;

// Insert custom view underneath this ASOTwoStateButton view
- (void)addCustomView:(UIView *)customView;

// Remove the custom view added by addCustomView method
- (void)removeCustomView:(UIView *)customView interval:(double)delayInSeconds;

@end
