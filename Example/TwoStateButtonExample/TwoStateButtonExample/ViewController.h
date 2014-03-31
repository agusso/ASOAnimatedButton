//
//  ViewController.h
//  TwoStateButtonExample
//
//  Created by Agus Soedibjo on 27/3/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ASOTwoStateButton.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet ASOTwoStateButton *twoStateButton;
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;

- (IBAction)twoStateButtonAction:(id)sender;

@end
