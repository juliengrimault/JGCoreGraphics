//
//  CoreGraphicsHelpers.m
//  TradeHero
//
//  Created by Julien Grimault on 20/2/12.
//  Copyright (c) 2012 julien.grimault@me.com. All rights reserved.
//

#import "JGCoreGraphicsHelpers.h"

void drawLinearGradient(CGContextRef context,
                        CGRect rect,
                        CGColorRef startColor, 
                        CGColorRef  endColor)
{
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGFloat locations[] = {0.0f, 1.0f};
  
  NSArray* colors = [NSArray arrayWithObjects:(__bridge id)startColor, (__bridge id)endColor, nil];
  
  CGGradientRef gradient = CGGradientCreateWithColors(colorSpace,
                                                      (__bridge CFArrayRef)colors, 
                                                      locations);
  
  CGPoint startPoint = CGPointZero;
  CGPoint endPoint = CGPointZero;
    startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
  
  CGContextSaveGState(context);
  CGContextAddRect(context, rect);
  CGContextClip(context);
  CGContextDrawLinearGradient(context,
                              gradient,
                              startPoint,
                              endPoint,
                              0);
  CGContextRestoreGState(context);
  CGColorSpaceRelease(colorSpace);
}

void drawGlossAndGradient(CGContextRef context,
                          CGRect rect,
                          CGColorRef startColor, 
                          CGColorRef endColor) {
  
  drawLinearGradient(context, rect, startColor, endColor);
  
  UIColor* glossColor1 = [UIColor colorWithRed:1.0 green:1.0 
                                            blue:1.0 alpha:0.35];
  UIColor* glossColor2 = [UIColor colorWithRed:1.0 green:1.0 
                                            blue:1.0 alpha:0.1];
  
  CGRect topHalf = CGRectMake(rect.origin.x, rect.origin.y, 
                              rect.size.width, rect.size.height/2);
  
  drawLinearGradient(context, topHalf, glossColor1.CGColor, glossColor2.CGColor);
}

CGRect rectFor1PxStroke(CGRect rect)
{
  return CGRectMake(rect.origin.x + 0.5, rect.origin.y + 0.5, 
                    rect.size.width - 1, rect.size.height - 1);
}

void draw1PxStroke(CGContextRef context,
                   CGPoint startPoint,
                   CGPoint endPoint, 
                   CGColorRef color) 
{
  
  CGContextSaveGState(context);
  CGContextSetLineCap(context, kCGLineCapSquare);
  CGContextSetStrokeColorWithColor(context, color);
  CGContextSetLineWidth(context, 1.0);
  CGContextMoveToPoint(context, startPoint.x + 0.5, startPoint.y + 0.5);
  CGContextAddLineToPoint(context, endPoint.x + 0.5, endPoint.y + 0.5);
  CGContextStrokePath(context);
  CGContextRestoreGState(context);        
  
}


void drawFadingGradient(CGContextRef context,
                        CGRect rect,
                        CGColorRef edgeColor,
                        CGColorRef normalColor,
                        CGFloat normalColorPosition,
                        BOOL isVertical)
{
  
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  CGFloat locations[] = {0.0f,normalColorPosition,1.0f - normalColorPosition, 1.0f};
  
  NSArray* colors = [NSArray arrayWithObjects:(__bridge id)edgeColor,(__bridge id)normalColor,(__bridge id)normalColor, (__bridge id)edgeColor, nil];
  
  CGGradientRef gradient = CGGradientCreateWithColors(colorSpace,
                                                      (__bridge CFArrayRef)colors, 
                                                      locations);
  
  CGPoint startPoint = CGPointZero;
  CGPoint endPoint = CGPointZero;
  if (isVertical) {
    startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
  } else {
    startPoint = CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
    endPoint = CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
  }
  
  CGContextSaveGState(context);
  CGContextAddRect(context, rect);
  CGContextClip(context);
  CGContextDrawLinearGradient(context,
                              gradient,
                              startPoint,
                              endPoint,
                              0);
  CGContextRestoreGState(context);
  CGColorSpaceRelease(colorSpace);

}

void drawRoundedBox(CGContextRef context,
                    CGRect rect,
                    UIRectCorner corners,
                    CGFloat radius,
                    CGColorRef topGradientColor,
                    CGColorRef bottomGradientColor,
                    CGColorRef topOutlineColor,
                    CGColorRef bottomOutlineColor
                    )
{
  CGContextSaveGState(context);
  UIBezierPath* boxPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                byRoundingCorners:corners
                                                      cornerRadii:CGSizeMake(radius, radius)];
  CGContextAddPath(context, boxPath.CGPath);
  CGContextClip(context);
  drawLinearGradient(context,
                     rect,
                     topGradientColor,
                     bottomGradientColor);
  CGContextRestoreGState(context);  
  
  //draw the outline at the top
  CGContextSaveGState(context);
  CGContextClipToRect(context,CGRectMake(rect.origin.x,rect.origin.y,rect.size.width,radius));
  CGContextSetFillColorWithColor(context, topOutlineColor);
  CGContextAddPath(context,boxPath.CGPath);
  //translate the second path 1 pixel down
  CGContextTranslateCTM(context, 0.0f, 1.0f);
  CGContextAddPath(context, boxPath.CGPath);
  //use the EO winding rule to fill the gap between the two paths
  CGContextEOFillPath(context);
  CGContextRestoreGState(context);
  
  //draw the outline at the bottom
  CGContextSaveGState(context);
  CGContextClipToRect(context,CGRectMake(rect.origin.x,rect.origin.y + rect.size.height - radius,rect.size.width,radius));
  CGContextSetFillColorWithColor(context, bottomOutlineColor);
  CGContextAddPath(context,boxPath.CGPath);
  //translate the second path 1 pixel down
  CGContextTranslateCTM(context, 0.0f, -1.0f);
  CGContextAddPath(context, boxPath.CGPath);
  //use the EO winding rule to fill the gap between the two paths
  CGContextEOFillPath(context);
  CGContextRestoreGState(context);
  
}