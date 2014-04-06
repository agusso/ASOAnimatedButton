//
//  ASOBounceButtonView.h
//  ASOAnimatedButton
//
//  Created by Agus Soedibjo on 8/2/14.
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
/**
 *  The ASOBounceButtonView class defines the view area and the interfaces for managing the speed, fade effect duration and bouncing distance all the bouncing buttons added on this view.
 */

@protocol ASOBounceButtonViewDelegate;

@interface ASOBounceButtonView : UIView

/**
 *  The animation style applied to the buttons
 *  'ASOAnimationStyleExpand': provides an effect of growing where buttons movement follow the path of other buttons defined in its previous order
 *  'ASOAnimationStyleRiseProgressively': provides an effect where all defined buttons move directly from starting positon to its final position. The movement pace of each buttons are slower gradually
 *  'ASOAnimationStyleRiseConcurrently': provides an effect where all defined buttons move directly from starting position to its final position at the same time
 */
typedef enum {
    ASOAnimationStyleExpand,
    ASOAnimationStyleRiseProgressively,
    ASOAnimationStyleRiseConcurrently
}ASOAnimationStyle;

/**
 *  Control the speed of each animated button.
 *  A float value stored in NSNumber object. The bigger is the value, the slower is the bounce effect speed. Default value is '0.1'.
 */
@property (strong, nonatomic) NSNumber *speed;

/**
 *  Control the fade-out effect duration between state changing.
 *  A float value stored in NSNumber object. The bigger is the value, the longer is the duration. Default value is '0.1'.
 */
@property (strong, nonatomic) NSNumber *fadeOutDuration;

/**
 *  Control the bouncing distance of each animated button.
 *  A float value stored in NSNumber object. The bigger is the value, the further is the bouncing distance. Default value is '0.6'.
 */
@property (strong, nonatomic) NSNumber *bouncingDistance;

/**
 *  This collapsedViewDuration gives the window for collapse animation to be shown before removing the bounce button view.
 *  Read-only property (its value is privately calculated)
 */
@property (strong, readonly, nonatomic) NSNumber *collapsedViewDuration;

/**
 *  Control which animation style to be applied to the buttons.
 *  Three animation style as type of ASOAnimationStyle are available, They are 'ASOAnimationStyleExpand', ASOAnimationStyleRiseProgressively', and 'ASOAnimationStyleRiseConcurrently'.
 */
@property (nonatomic) ASOAnimationStyle animationStyle;

/**
 *  ASOBounceButtonView delegate accessor.
 *  It is to invoke delegation method when each of bounce buttons defined in this view is tapped.
 */
@property (weak, nonatomic) id <ASOBounceButtonViewDelegate> delegate;

/**
 *  Bounce button animation starting point
 *
 *  @param startingViewFrame Frame value of the view which is used to launch this bounce button view
 */
- (void) setAnimationStartFromHere:(CGRect)startingViewFrame;

/**
 *  Add individual bounce button to this view
 *
 *  @param bounceButton A UIButton object to be animated in this bounce button view
 */
- (void) addBounceButton:(UIButton *)bounceButton;

/**
 *  Add all bounce buttons defined in an array to this view
 *
 *  @param arrBounceButtons An array of UIButton object to be animated in this bounce button view
 */
- (void) addBounceButtons:(NSArray *)arrBounceButtons;

/**
 *  Launch this bounce button view
 *
 *  @param animationStyle ASOAnimationStyle used when launching this bounce button view
 */
- (void) expandWithAnimationStyle:(ASOAnimationStyle)animationStyle;

/**
 *  Remove this bounce button view from its parent view
 *
 *  @param animationStyle ASOAnimationStyle used when removing this bounce button view
 */
- (void) collapseWithAnimationStyle:(ASOAnimationStyle)animationStyle;

@end
