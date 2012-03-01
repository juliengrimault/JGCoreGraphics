//
//  GradientView.m
//  TradeHero
//
//  Created by Julien Grimault on 20/2/12.
//  Copyright (c) 2012 julien.grimault@me.com. All rights reserved.
//

#import "JGGradientView.h"
#import "JGCoreGraphicsHelpers.h"

@implementation JGGradientView
#pragma mark - Properties
@synthesize startColor = _startColor;
@synthesize endColor = _endColor;
@synthesize glossyEffect = _glossyEffect;

- (id)initWithFrame:(CGRect)frame startColor:(UIColor*)startColor endColor:(UIColor*)endColor
{
    self = [super initWithFrame:frame];
    if (self) {
      _startColor = startColor;
      _endColor = endColor;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
  NSAssert(self.startColor, @"You must specify a start color for the gradient view");
  NSAssert(self.endColor, @"You must specify an end color for the gradient view");
  
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGRect cellRect = self.bounds;
  if (self.glossyEffect) {
    drawGlossAndGradient(context,
                         cellRect,
                         self.startColor.CGColor,
                         self.endColor.CGColor);
  } else {
    drawLinearGradient(context,
                       cellRect,
                       self.startColor.CGColor,
                       self.endColor.CGColor);
  }
}


@end
