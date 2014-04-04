# TwoStateButtonExample

This App shows a toggle button which change its image every time it is tapped. A fade-out effect is set between its state changes.

![ASOTwoStateButton animation preview](https://raw.githubusercontent.com/wiki/agusso/ASOAnimatedButton/Assets/ASOTwoStateButton-preview.gif)

## How To

### Integrate the library

Add these lines in the Podfile:

``` ruby
platform :ios, '7.0'
pod 'ASOAnimatedButton'
```

Or add these lines if only the `ASOTwoStateButton` library is going to be used in the project:

``` ruby
platform :ios, '7.0'
pod 'ASOAnimatedButton/TwoStateButton'
```

### Storyboard

Define each image name as values of `OnStateImageName` and `OffStateImageName` keys in `User Defined Runtime Attributes` of the ASOTwoStateButton object.

![ASOTwoStateButton storyboard preview](https://raw.githubusercontent.com/wiki/agusso/ASOAnimatedButton/Assets/ASOTwoStateButton-storyboard.png)

### Implementation

Initialise the 'Two-State Button'
``` objectivec
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Set the 'Two-State Button'
    [self.twoStateButton initAnimationWithFadeEffectEnabled:YES]; // Set to 'NO' to disable Fade effect between its two-state transition
}
```

Add custom actions for each state
``` objectivec
- (IBAction)twoStateButtonAction:(id)sender {
    if ([sender isOn]) {
        // Add actions related to the On-State
	
    } else {
       // Add actions related to the Off-State

    }
}
```

## Controls

Control whether fade effect is enabled between state changing
``` objectivec
@property (nonatomic) BOOL isFadeEffectEnabled;
```

Control the effect duration between state changing
``` objectivec
@property (nonatomic) NSTimeInterval effectDuration;
```

## Getting Help

If you need help using `ASOTwoStateButton`, please post a question on [StackOverflow with the "ASOAnimatedButton" tag](http://stackoverflow.com/questions/ask?tags=asoanimatedbutton).

If you think you found a problem with `ASOTwoStateButton`, please [post an issue](https://github.com/agusso/ASOAnimatedButton/issues). A sample project or fork of any of the examples demonstrating the problem will be helpful.

## Author
Agus Soedibjo. Copyright (c) 2014 Agus Soedibjo, contact@soedibjo.com

## License

`ASOAnimatedButton` is available under the MIT license. See the LICENSE file for more info.

