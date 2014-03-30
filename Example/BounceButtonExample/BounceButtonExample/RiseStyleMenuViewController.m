//
//  RiseStyleMenuViewController.m
//  BounceButtonExample
//
//  Created by Agus Soedibjo on 28/3/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import "RiseStyleMenuViewController.h"

@interface RiseStyleMenuViewController()
@property (nonatomic) ASOAnimationStyle progressiveORConcurrentStyle;
@end

@implementation RiseStyleMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Set the 'menu button
    [self.menuButton initAnimationWithFadeEffectEnabled:YES]; // Set to 'NO' to disable Fade effect between its two-state transition
    
    // Get the 'menu item view' from storyboard
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UIViewController *menuItemsVC = (UIViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"ArchMenu"];
    self.menuItemView = (BounceButtonView *)menuItemsVC.view;
    
    NSArray *arrMenuItemButtons = [[NSArray alloc] initWithObjects:self.menuItemView.menuItem1,
                                   self.menuItemView.menuItem2,
                                   self.menuItemView.menuItem3,
                                   self.menuItemView.menuItem4,
                                   nil]; // Add all of the defined 'menu item button' to 'menu item view'
    [self.menuItemView addBounceButtons:arrMenuItemButtons];
    
    // Set the bouncing distance, speed and fade-out effect duration here. Refer to the ASOBounceButtonView public properties
    [self.menuItemView setSpeed:[NSNumber numberWithFloat:0.3f]];
    [self.menuItemView setBouncingDistance:[NSNumber numberWithFloat:0.3f]];
    
    [self.menuItemView setAnimationStyle:ASOAnimationStyleRiseProgressively];
    [self.changeAnimationStyleButton setTitle:@"Progressively" forState:UIControlStateNormal];
    self.progressiveORConcurrentStyle = ASOAnimationStyleRiseProgressively;
    
    // Set as delegate of 'menu item view'
    [self.menuItemView setDelegate:self];
}

- (void)viewDidAppear:(BOOL)animated
{
    // Tell 'menu button' position to 'menu item view'
    [self.menuItemView setAnimationStartFromHere:self.menuButton.frame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)menuButtonAction:(id)sender
{
    if ([sender isOn]) {
        // Show 'menu item view' and expand its 'menu item button'
        [self.menuButton addCustomView:self.menuItemView];
        [self.menuItemView expandWithAnimationStyle:self.progressiveORConcurrentStyle];
    }
    else {
        // Collapse all 'menu item button' and remove 'menu item view'
        [self.menuItemView collapseWithAnimationStyle:self.progressiveORConcurrentStyle];
        [self.menuButton removeCustomView:self.menuItemView interval:[self.menuItemView.collapsedViewDuration doubleValue]];
    }
}

#pragma mark - Menu item view delegate method

- (void)didSelectBounceButtonAtIndex:(NSUInteger)index
{
    // Collapse all 'menu item button' and remove 'menu item view' once a menu item is selected
    [self.menuButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    // Set your custom action for each selected 'menu item button' here
    NSString *alertViewTitle = [NSString stringWithFormat:@"Menu Item %x is selected", (short)index];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertViewTitle message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)willAnimateRotationToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    // Update 'menu button' position to 'menu item view' everytime there is a change in device orientation
    [self.menuItemView setAnimationStartFromHere:self.menuButton.frame];
}

- (IBAction)changeAnimationStyleButtonAction:(id)sender {
    if ([[sender titleLabel].text isEqualToString:@"Progressively"]) {
        [self.changeAnimationStyleButton setTitle:@"Concurrently" forState: UIControlStateNormal];
        self.progressiveORConcurrentStyle = ASOAnimationStyleRiseConcurrently;
    } else {
        [self.changeAnimationStyleButton setTitle:@"Progressively" forState:UIControlStateNormal];
        self.progressiveORConcurrentStyle = ASOAnimationStyleRiseProgressively;
    }
}

@end
