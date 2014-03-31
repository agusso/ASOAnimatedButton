//
//  ASOBounceButtonView.h
//  ASOAnimatedButton
//
//  Created by Agus Soedibjo on 8/2/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ASOBounceButtonViewDelegate;

@interface ASOBounceButtonView : UIView

// Available animations style
typedef enum {
    ASOAnimationStyleExpand, // ASOAnimationStyleExpand provides an effect of growing where buttons movement follow the path of other buttons defined in its previous order.
    ASOAnimationStyleRiseProgressively, // ASOAnimationStyleRiseProgressively provides an effect where all defined buttons move directly from starting positon to its final position. The movement pace of each buttons are slower gradually.
    ASOAnimationStyleRiseConcurrently // ASOAnimationStyleRiseConcurrently provides an effect where all defined buttons move directly from starting position to its final position at the same time.
}ASOAnimationStyle;

// Control the speed of each animated button
@property (strong, nonatomic) NSNumber *speed;

// Control the speed of fade-out effect when the view is collapsed
@property (strong, nonatomic) NSNumber *fadeOutDuration;

// Control the bouncing distance of each animated button
@property (strong, nonatomic) NSNumber *bouncingDistance;

// Read-only property (its value is privately calculated). This collapsedViewDuration gives the window for collapse animation to be shown before removing the bounce button view.
@property (strong, readonly, nonatomic) NSNumber *collapsedViewDuration;

// Control which animation style to be used
@property (nonatomic) ASOAnimationStyle animationStyle;

@property (weak, nonatomic) id <ASOBounceButtonViewDelegate> delegate;

// Set the frame value of the view which is used to launch this bounce button view via this method
- (void) setAnimationStartFromHere:(CGRect)startingViewFrame;

// Add individual bounce button
- (void) addBounceButton:(UIButton *)bounceButton;

// Add all bounce buttons at once using an array
- (void) addBounceButtons:(NSArray *)arrBounceButtons;

// Launch this bounce button view
- (void) expandWithAnimationStyle:(ASOAnimationStyle)animationStyle;

// Remove this bounce button view from its parent view
- (void) collapseWithAnimationStyle:(ASOAnimationStyle)animationStyle;

@end
