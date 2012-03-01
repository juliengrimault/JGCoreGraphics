//
//  SecurityDetailCellView.h
//  TradeHero
//
//  Created by Julien Grimault on 21/2/12.
//  Copyright (c) 2012 julien.grimault@me.com. All rights reserved.
//

#import "JGGradientView.h"

//a background view of a UITableViewCell. It draws itself using the startColor and endColor for the top to bottom gradient, 
//it also draws a 1px highlight at its top and a separator at its bottom.

@interface JGGradientCellBackgroundView : JGGradientView
@property (nonatomic, strong) UIColor* highlightColor;
@property (nonatomic, strong) UIColor* separatorColor;

- (id)initWithFrame:(CGRect)frame 
         startColor:(UIColor *)startColor
           endColor:(UIColor *)endColor
     highlightColor:(UIColor*)highlightColor
     separatorColor:(UIColor*)separatorColor;



//convenience method for a light gray background cell
//the colors used are as below:
//UIColor* beginColor = [UIColor colorWithWhite:0.91 alpha:1.0];
//UIColor* endColor = [UIColor colorWithWhite:0.80  alpha:1.0];
//UIColor* highlightColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
//UIColor* separatorColor = [UIColor colorWithRed:0.63 green:0.63 blue:0.63 alpha:1.0];
+ (id)lightGrayGradientCellBackgroundViewWithFrame:(CGRect)frame;

//convenience method for a dark gray background cell
//the colors used are as below:
//UIColor* beginColor = [UIColor colorWithWhite:0.45f alpha:1];
//UIColor* endColor = [UIColor colorWithWhite:0.35f alpha:1];
//UIColor* highlightColor = [UIColor colorWithWhite:0.6 alpha:1.0];
//UIColor* separatorColor = [UIColor colorWithWhite:0.1f alpha:1.0f];
+ (id)darkGrayGradientCellBackgroundViewWithFrame:(CGRect) frame;
@end
