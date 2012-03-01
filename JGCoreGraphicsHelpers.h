//
//  CoreGraphicsHelpers.h
//  TradeHero
//
//  Created by Julien Grimault on 20/2/12.
//  Copyright (c) 2012 julien.grimault@me.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

void drawLinearGradient(CGContextRef context,
                                CGRect rect,
                                CGColorRef startColor, 
                                CGColorRef  endColor);

void drawGlossAndGradient(CGContextRef context,
                          CGRect rect,
                          CGColorRef startColor, 
                          CGColorRef endColor);

CGRect rectFor1PxStroke(CGRect rect);

void draw1PxStroke(CGContextRef context,
                   CGPoint startPoint,
                   CGPoint endPoint, 
                   CGColorRef color);



void drawFadingGradient(CGContextRef context,
                        CGRect rect,
                        CGColorRef edgeColor,
                        CGColorRef normalColor,
                        CGFloat normalColorPosition,
                        BOOL isVertical);


void drawRoundedBox(CGContextRef context,
             CGRect rect,
             UIRectCorner corners,
             CGFloat radius,
             CGColorRef topGradientColor,
             CGColorRef bottomGradientColor,
             CGColorRef topOutlineColor,
             CGColorRef bottomOutlineColor
             );

void drawRadialGradient(CGContextRef context,
                        CGPoint center,
                        CGFloat radius,
                        CGColorRef startColor, 
                        CGColorRef  endColor);