//
//  ASOTwoStateButton.h
//  ASOAnimatedButton
//
//  Created by Agus Soedibjo on 4/2/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

@interface ASOTwoStateButton : UIButton

/**
 *  Store image name for one of the state.
 *  The name of image stored in Images.xcassets.
 */
@property (strong, nonatomic) NSString *onStateImageName;

/**
 *  Store image name for the other state.
 *  The name of image stored in Images.xcassets.
 */
@property (strong, nonatomic) NSString *offStateImageName;

/**
 *  Control whether fade effect is enabled between state changing.
 *  A Boolean value, set 'YES' to enable the fade effect.
 */
@property (nonatomic) BOOL isFadeEffectEnabled;

/**
 *  Control the effect duration between state changing.
 *  Default value is '0.6'.
 */
@property (nonatomic) NSTimeInterval effectDuration;

/**
 *  A Boolean value between state (read-only).
 *  This value is to be used to indicate what is the current state.
 *
 */
@property (readonly, nonatomic) BOOL isOn;

/**
 *  Initialise all the required property to animate the button.
 *
 *  @param fadeEnabled Set 'YES' to enable the fade effect between state changing.
 */
- (void)initAnimationWithFadeEffectEnabled:(BOOL)fadeEnabled;

/**
 *  A feature to insert a custom UIView
 *
 *  @param customView UIView object to be added underneath this ASOTwoStateButton view.
 */
- (void)addCustomView:(UIView *)customView;

/**
 *  Remove the custom UIView added by 'addCustomView' method
 *
 *  @param customView     UIView object added by 'addCustomView' method
 *  @param delayInSeconds Set delay to show animation on the customView to be completed before removing this custom UIView
 */
- (void)removeCustomView:(UIView *)customView interval:(double)delayInSeconds;

@end
