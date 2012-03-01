//
//  JGGlossyButton.m
//  TradeHero
//
//  Created by Julien Grimault on 22/2/12.
//  Copyright (c) 2012 julien.grimault@me.com. All rights reserved.
//

#import "JGGlossyButton.h"
#import "JGCoreGraphicsHelpers.h"

@interface JGGlossyButton()
- (void)setup;
@end

@implementation JGGlossyButton
#pragma mark - Properties
@synthesize color = _color;
- (void)setColor:(UIColor *)color
{
  if (color == _color)
    return;
  _color = color;
  [self setNeedsDisplay];
}

#pragma mark - Init
- (id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self setup];
  }
  return self;
}

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    [self setup];
  }
  return self;
}

- (void)setup
{
  self.color = [UIColor whiteColor];
}

#pragma mark - Drawign

- (void)drawRect:(CGRect)rect {
  NSAssert(self.color, @"color must be non nil!");
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGRect bounds = self.bounds;
  UIBezierPath* boxPath = [UIBezierPath bezierPathWithRoundedRect:bounds
                                                byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(4.0f, 4.0f)];
  
  //draw gradient background
  CGContextSaveGState(context);
  CGContextAddPath(context, boxPath.CGPath);
  CGContextClip(context);
  drawGlossAndGradient(context,
                       bounds,
                       self.color.CGColor,
                       self.color.CGColor);
  CGContextRestoreGState(context);
  
  //draw outline
  CGContextSaveGState(context);
  [[UIColor blackColor] set];
  CGRect innerBox = CGRectInset(bounds, 1.0f, 1.0f);
  UIBezierPath* innerBoxPath = [UIBezierPath bezierPathWithRoundedRect:innerBox
                                                 byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(4.0f, 4.0f)];
  CGContextAddPath(context, boxPath.CGPath);
  CGContextAddPath(context, innerBoxPath.CGPath);
  CGContextEOFillPath(context);
  CGContextRestoreGState(context);

}

- (void)hesitateUpdate
{
  [self setNeedsDisplay];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  [super touchesBegan:touches withEvent:event];
  [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesMoved:touches withEvent:event];
  [self setNeedsDisplay];
  
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
  [super touchesCancelled:touches withEvent:event];
  [self setNeedsDisplay];
  [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.1];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  [super touchesEnded:touches withEvent:event];
  [self setNeedsDisplay];
  [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.1];
}



@end
