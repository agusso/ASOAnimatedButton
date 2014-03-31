//
//  ViewController.m
//  TwoStateButtonExample
//
//  Created by Agus Soedibjo on 27/3/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Set the 'Two State Button'
    [self.twoStateButton initAnimationWithFadeEffectEnabled:YES]; // Set to 'NO' to disable Fade effect between its two-state transition
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)twoStateButtonAction:(id)sender {
    if ([sender isOn]) {
        self.greetingLabel.text = @"See You !";
    } else {
       self.greetingLabel.text = @"Welcome !";
    }
}
@end
