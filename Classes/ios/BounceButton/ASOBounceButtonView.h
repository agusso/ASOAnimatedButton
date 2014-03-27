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

typedef enum {
    ASOAnimationStyleSequential,
    ASOAnimationStyleConcurrent
}ASOAnimationStyle;

@property (strong, nonatomic) NSNumber *speed;
@property (strong, nonatomic) NSNumber *fadeOutDuration;
@property (strong, nonatomic) NSNumber *bouncingDistance;
@property (strong, nonatomic) NSNumber *expandedViewDuration;
@property (strong, nonatomic) NSNumber *collapsedViewDuration;

@property (weak, nonatomic) id <ASOBounceButtonViewDelegate> delegate;

- (void) setAnimationStartFromHere:(CGRect)startingViewFrame;
- (void) addBounceButton:(UIButton *)bounceButton;
- (void) addBounceButtons:(NSArray *)arrBounceButtons;
- (void) expandWithAnimationStyle:(ASOAnimationStyle)animationStyle;
- (void) collapseWithAnimationStyle:(ASOAnimationStyle)animationStyle;

@end
