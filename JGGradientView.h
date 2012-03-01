//
//  GradientView.h
//  TradeHero
//
//  Created by Julien Grimault on 20/2/12.
//  Copyright (c) 2012 julien.grimault@me.com. All rights reserved.
//

#import <UIKit/UIKit.h>

//a gradient view, the start color is at the top of the view and the endColor is at the bottom.
@interface JGGradientView : UIView

@property (nonatomic, strong) UIColor* startColor;
@property (nonatomic, strong) UIColor* endColor;
@property (nonatomic, assign, getter = hasGlossyEffect) BOOL glossyEffect;

- (id)initWithFrame:(CGRect)frame 
         startColor:(UIColor*)startColor
           endColor:(UIColor*)endColor;
@end
