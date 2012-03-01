//
//  SecurityDetailCellView.m
//  TradeHero
//
//  Created by Julien Grimault on 21/2/12.
//  Copyright (c) 2012 julien.grimault@me.com. All rights reserved.
//

#import "JGGradientCellBackgroundView.h"
#import "JGCoreGraphicsHelpers.h"

@implementation JGGradientCellBackgroundView
#pragma mark - Properties
@synthesize highlightColor = _highlightColor;
@synthesize separatorColor = _separatorColor;


#pragma mark - Init
+ (id)lightGrayGradientCellBackgroundViewWithFrame:(CGRect) frame
{
  UIColor* beginColor = [UIColor colorWithWhite:0.91 alpha:1.0];
  UIColor* endColor = [UIColor colorWithWhite:0.80  alpha:1.0];
  UIColor* highlightColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
  UIColor* separatorColor = [UIColor colorWithRed:0.63 green:0.63 blue:0.63 alpha:1.0];
  return [[self alloc] initWithFrame:frame
                          startColor:beginColor
                            endColor:endColor
                      highlightColor:highlightColor
                      separatorColor:separatorColor];
}


+ (id)darkGrayGradientCellBackgroundViewWithFrame:(CGRect) frame
{
  UIColor* beginColor = [UIColor colorWithWhite:0.45f alpha:1];
  UIColor* endColor = [UIColor colorWithWhite:0.35f alpha:1];
  UIColor* highlightColor = [UIColor colorWithWhite:0.6 alpha:1.0];
  UIColor* separatorColor = [UIColor colorWithWhite:0.1f alpha:1.0f];
  return [[self alloc] initWithFrame:frame
                          startColor:beginColor
                            endColor:endColor
                      highlightColor:highlightColor
                      separatorColor:separatorColor];
}


- (id)initWithFrame:(CGRect)frame 
         startColor:(UIColor *)startColor
           endColor:(UIColor *)endColor
     highlightColor:(UIColor*)highlightColor
     separatorColor:(UIColor*)separatorColor
{
    self = [super initWithFrame:frame
                     startColor:startColor
                       endColor:endColor];
    if (self) {
      _highlightColor = highlightColor;
      _separatorColor = separatorColor;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  NSAssert(self.highlightColor,@"highlight color must not be nil!");
  NSAssert(self.separatorColor,@"separator color must not be nil!");
  
  [super drawRect:rect];
  
  CGRect bounds = self.bounds;
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  //highlight
  CGPoint startPointHighlight = CGPointMake(bounds.origin.x, 
                                            bounds.origin.y);
  CGPoint endPointHighlight = CGPointMake(bounds.origin.x + bounds.size.width, 
                                          bounds.origin.y);
  draw1PxStroke(context, startPointHighlight, endPointHighlight, self.highlightColor.CGColor);
  
  //separator
  CGPoint startPointSeparator = CGPointMake(bounds.origin.x, 
                                            bounds.origin.y + bounds.size.height - 1);
  CGPoint endPointSeparator = CGPointMake(bounds.origin.x + bounds.size.width, 
                                          bounds.origin.y + bounds.size.height -1);
  draw1PxStroke(context, startPointSeparator, endPointSeparator, self.separatorColor.CGColor);
}


@end
