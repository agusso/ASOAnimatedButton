//
//  ASOTwoStateButton.m
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

#import "ASOTwoStateButton.h"

#define DEFAULT_DURATION 0.6;

const int16_t kOnStateViewTag = 700;
const int16_t kOffStateViewTag = 701;
const int16_t kCustomViewTag = 702;

@interface ASOTwoStateButton()

@property (readwrite, nonatomic) BOOL isOn;

@end

@implementation ASOTwoStateButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - Animation methods

- (void)initAnimationWithFadeEffectEnabled:(BOOL)fadeEnabled
{
    if (([self backgroundImageForState:UIControlStateNormal] || self.onStateImageName) && self.offStateImageName)
    {
        // Initiate image used for on-state and off-state
        UIImage *onStateImage = [[UIImage alloc] init];
        
        if (self.onStateImageName == nil) {
            // If Runtime attribute for on-state image is not defined then use background image
            // as the on-state image
            onStateImage = [self backgroundImageForState:UIControlStateNormal];
        }
        else {
            onStateImage = [UIImage imageNamed:self.onStateImageName];
        }
        
        UIImageView *onStateImageView = [[UIImageView alloc] initWithImage:onStateImage];
        
        UIImageView *offStateImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.offStateImageName]];
        
        // When on-state and off-state images are not found, this becomes a normal UIButton class
        [offStateImageView setTag:kOffStateViewTag];
        [self addSubview:offStateImageView];
        
        [onStateImageView setTag:kOnStateViewTag];
        [self addSubview:onStateImageView];

        self.isFadeEffectEnabled = fadeEnabled;
        self.effectDuration = DEFAULT_DURATION;
        
        // Set internal target to launch the animation when button is tapped
        [self addTarget:self action:@selector(startAnimatingButton:) forControlEvents:UIControlEventTouchUpInside];
        
        // Initialize on-off state
        _isOn = YES;
    }
    else {
        NSLog(@"WARNING!! Button will not be animated unless images are defined in 'onStateImageName' and 'offStateImageName' keypath of its User Defined Runtime Attributes");
    }
}

- (void)startAnimatingButton:(UIButton *)pressedButton
{
    if ((_isOn = !_isOn))
	{
        if ([self isFadeEffectEnabled]) {
            // Zoom effect
            CABasicAnimation *zoomAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            zoomAnim.toValue = [NSNumber numberWithFloat:1.1];
            zoomAnim.duration = 0.1;
            [[self viewWithTag:kOffStateViewTag].layer addAnimation:zoomAnim forKey:@"zoom-in"];
            
            // Fade effect
            CABasicAnimation *fadeInAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
            fadeInAnim .fromValue = [NSNumber numberWithFloat:0.0];
            fadeInAnim.toValue = [NSNumber numberWithFloat:1.0];
            fadeInAnim.duration = self.effectDuration;
            [[self viewWithTag:kOnStateViewTag].layer addAnimation:fadeInAnim forKey:@"fade-in"];
            [self viewWithTag:kOnStateViewTag].layer.opacity = 1.0;
        }
        else {
            [self viewWithTag:kOnStateViewTag].layer.opacity = 1.0;
        }
	}
	else
	{
        if ([self isFadeEffectEnabled]) {
            // Zoom effect
            CABasicAnimation *zoomAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            zoomAnim.toValue = [NSNumber numberWithFloat:1.1];
            zoomAnim.duration = 0.1;
            [[self viewWithTag:kOnStateViewTag].layer addAnimation:zoomAnim forKey:@"zoom-in"];
            
            // Fade effect
            CABasicAnimation *fadeOutAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
            fadeOutAnim.fromValue = [NSNumber numberWithFloat:1.0];
            fadeOutAnim.toValue = [NSNumber numberWithFloat:0.0];
            fadeOutAnim.duration = self.effectDuration;
            [[self viewWithTag:kOnStateViewTag].layer addAnimation:fadeOutAnim forKey:@"fade-out"];
            
            [self viewWithTag:kOnStateViewTag].layer.opacity = 0.0;
        }
        else {
            [self viewWithTag:kOnStateViewTag].layer.opacity = 0.0;
        }
    }
}

- (void)addCustomView:(UIView *)customView
{
    [customView setTag:kCustomViewTag];
    [customView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[self superview] insertSubview:customView belowSubview:self];
    
    // Define Auto Layout for the custom view related to the superview
    [self setupConstraintWithView:customView];
}

- (void)setupConstraintWithView:(UIView *)customView
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.0]];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0]];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:customView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
}

- (void)removeCustomView:(UIView *)customView interval:(double)delayInSeconds
{
    self.userInteractionEnabled = NO;
    dispatch_time_t removeTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(removeTime, dispatch_get_main_queue(), ^(void){
        [[customView viewWithTag:kCustomViewTag] removeFromSuperview];
        self.userInteractionEnabled = YES;
     });
}

@end
