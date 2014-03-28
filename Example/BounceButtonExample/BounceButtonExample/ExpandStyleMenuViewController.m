//
//  BATMViewController.m
//  BouncingAlaTumblrMenu
//
//  Created by Agus Soedibjo on 7/2/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import "BATMViewController.h"

@implementation BATMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Set the 'menu button
    [self.menuButton initAnimationWithFadeEffectEnabled:YES]; // Set to 'NO' to disable Fade effect between its two-state transition
    
    // Get the 'menu item view' from storyboard
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    UIViewController *menuItemsVC = (UIViewController *)[mainStoryboard instantiateViewControllerWithIdentifier:@"MenuItems"];
    self.menuItemView = (BATMMenuItemView *)menuItemsVC.view;
    
    NSArray *arrMenuItemButtons = [[NSArray alloc] initWithObjects:self.menuItemView.menuItem1,
                                   self.menuItemView.menuItem2,
                                   self.menuItemView.menuItem3,
                                   self.menuItemView.menuItem4,
                                   nil]; // Add all of the defined 'menu item button' to 'menu item view'
    [self.menuItemView addMenuItemButtons:arrMenuItemButtons];
    
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
        [self.menuButton addMenuItemView:self.menuItemView];
        [self.menuItemView expandWithAnimationStyle:ASOAnimationStyleSequential];
    }
    else {
        // Collapse all 'menu item button' and remove 'menu item view'
        [self.menuItemView collapseWithAnimationStyle:ASOAnimationStyleSequential];
        [self.menuButton removeMenuItemView:self.menuItemView interval:[self.menuItemView.collapsedViewDuration doubleValue]];
    }
}

#pragma mark - Menu item view delegate method

- (void)didSelectMenuItemAtIndex:(NSUInteger)index
{
    // Set your custom action for each selected 'menu item button' here
    NSLog(@"'Menu Item Button %x' is selected", (short)index);
}

- (void)willAnimateRotationToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    // Update 'menu button' position to 'menu item view' everytime there is a change in device orientation
    [self.menuItemView setAnimationStartFromHere:self.menuButton.frame];
}

- (IBAction)tapMeButtonAction:(id)sender {
     NSLog(@"'Tap Me' button is tapped");
}
@end
