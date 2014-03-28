//
//  BATMViewController.h
//  BouncingAlaTumblrMenu
//
//  Created by Agus Soedibjo on 7/2/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASOTwoStateButton.h"
#import "ASOMenuItemViewDelegate.h"
#import "BATMMenuItemView.h"

@interface BATMViewController : UIViewController <ASOMenuItemViewDelegate>

@property (strong, nonatomic) IBOutlet ASOTwoStateButton *menuButton;
@property (strong, nonatomic) BATMMenuItemView *menuItemView;

- (IBAction)menuButtonAction:(id)sender;
- (IBAction)tapMeButtonAction:(id)sender;

@end
