//
//  RiseStyleMenuViewController.h
//  BounceButtonExample
//
//  Created by Agus Soedibjo on 28/3/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASOTwoStateButton.h"
#import "ASOBounceButtonViewDelegate.h"
#import "BounceButtonView.h"

@interface RiseStyleMenuViewController : UIViewController <ASOBounceButtonViewDelegate>

@property (strong, nonatomic) IBOutlet ASOTwoStateButton *menuButton;
@property (strong, nonatomic) BounceButtonView *menuItemView;
@property (weak, nonatomic) IBOutlet UIButton *changeAnimationStyleButton;

- (IBAction)menuButtonAction:(id)sender;
- (IBAction)changeAnimationStyleButtonAction:(id)sender;

@end
