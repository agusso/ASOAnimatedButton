//
//  ASOBounceButtonViewDelegate.h
//  ASOAnimatedButton
//
//  Created by Agus Soedibjo on 27/2/14.
//  Copyright (c) 2014 Agus Soedibjo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ASOBounceButtonViewDelegate <NSObject>

@optional

- (void)didSelectBounceButtonAtIndex:(NSUInteger)index;

@end
