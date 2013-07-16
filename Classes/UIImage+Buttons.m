//  @project UIButtons+ImagePrototypes
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Dmitry Ponomarev <demdxx@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to
//  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//  the Software, and to permit persons to whom the Software is furnished to do so,
//  subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//  COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "UIImage+Buttons.h"

@implementation UIImage (Buttons)

#pragma mark -
#pragma mark close button image

+ (UIImage *)closeButton:(UIColor *)backgroundColor
               lineColor:(UIColor *)lineColor
                lineSize:(CGFloat)lineSize
                    size:(CGFloat)size
{
  return [self closeButton:backgroundColor
                 lineColor:lineColor
                  lineSize:lineSize
               shadowColor:[UIColor blackColor]
              shadowOffset:CGSizeMake(0, 3.f)
                shadowBlur:5.f
                      size:size
                   padding:size/10
                     scale:0.f];
}

+ (UIImage *)closeButton:(UIColor *)backgroundColor
               lineColor:(UIColor *)lineColor
                lineSize:(CGFloat)lineSize
                    size:(CGFloat)size
                 padding:(CGFloat)padding
                   scale:(CGFloat)scale
{
  return [self closeButton:backgroundColor
                 lineColor:lineColor
                  lineSize:lineSize
               shadowColor:[UIColor blackColor]
              shadowOffset:CGSizeMake(0, 3.f)
                shadowBlur:5.f
                      size:size
                   padding:padding
                     scale:scale];
}

+ (UIImage *)closeButton:(UIColor *)backgroundColor
               lineColor:(UIColor *)lineColor
                lineSize:(CGFloat)lineSize
             shadowColor:(UIColor *)shadowColor
            shadowOffset:(CGSize)shadowOffset
              shadowBlur:(CGFloat)shadowBlur
                    size:(CGFloat)size
                 padding:(CGFloat)padding
                  scale:(CGFloat)scale;
{
  // create a new bitmap image context at the device resolution (retina/non-retina)
  UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), NO, scale);
  
  // get context
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  
  // push context to make it current
  // (need to do this manually because we are not drawing in a UIView)
  UIGraphicsPushContext(ctx);
  
  // Draw rect
  CGRect rectToDraw = CGRectMake(0, 0, size, size);
//  CGContextClearRect(ctx, rectToDraw);
  
  // Rect with padding
  rectToDraw = CGRectInset(rectToDraw, padding, padding);
  
  // Border path
  UIBezierPath *borderPath =
    [UIBezierPath bezierPathWithRoundedRect:rectToDraw
                          byRoundingCorners:(UIRectCorner)UIRectCornerAllCorners
                                cornerRadii:CGSizeMake(size/2.f, size/2.f)];
  
  // Bacground path
  UIBezierPath *backgroundPath =
    [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rectToDraw, lineSize, lineSize)
                          byRoundingCorners:(UIRectCorner)UIRectCornerAllCorners
                                cornerRadii:CGSizeMake(size/2.f, size/2.f)];

  /* Border and shadow */
  CGContextSaveGState(ctx);
  {
    CGContextAddPath(ctx, borderPath.CGPath);
    
    CGContextSetFillColorWithColor(ctx, lineColor.CGColor);
    CGContextSetShadowWithColor(ctx, shadowOffset, shadowBlur, shadowColor.CGColor);
    
    CGContextDrawPath(ctx, kCGPathFill);
  }
  CGContextRestoreGState(ctx);
  
  /* Background */
  CGContextSaveGState(ctx);
  {
    CGContextAddPath(ctx, backgroundPath.CGPath);
    CGContextSetFillColorWithColor(ctx, backgroundColor.CGColor);
    CGContextDrawPath(ctx, kCGPathFill);
  }
  CGContextRestoreGState(ctx);
  
  
  /* Draw lines */
  {
    CGContextSetLineWidth(ctx, lineSize);
    
    const CGFloat halfSize = size/2;
    const CGFloat R = (rectToDraw.size.width-rectToDraw.origin.x-lineSize*3) / 2;

    CGFloat X1 = halfSize - cos(135 / 180.0 * M_PI) * R;
    CGFloat Y1 = halfSize + sin(135 / 180.0 * M_PI) * R;
    CGFloat X2 = halfSize + cos(-135 / 180.0 * M_PI) * R;
    CGFloat Y2 = halfSize + sin(-135 / 180.0 * M_PI) * R;
    
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    CGContextMoveToPoint(ctx, X1, Y1);
    CGContextAddLineToPoint(ctx, X2, Y2);

    X1 = halfSize + cos(45 / 180.0 * M_PI) * R;
    Y1 = halfSize - sin(45 / 180.0 * M_PI) * R;
    X2 = halfSize - cos(-45 / 180.0 * M_PI) * R;
    Y2 = halfSize - sin(-45 / 180.0 * M_PI) * R;
    
    CGContextMoveToPoint(ctx, X1, Y1);
    CGContextAddLineToPoint(ctx, X2, Y2);
    
    CGContextStrokePath(ctx);
  }
  
  // pop context
  UIGraphicsPopContext();
  
  // get a UIImage from the image context- enjoy!!!
  UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
  
  // clean up drawing environment
  UIGraphicsEndImageContext();
  
  return outputImage;
}

#pragma mark -
#pragma mark menu image

+ (UIImage *)menuIcon
{
  return [self menuIconFromSize:CGSizeMake(20.f, 13.f)
                          color:[UIColor blackColor]
                          scale:0.f];
}

+ (UIImage *)menuIconFromSize:(CGSize)size
                        color:(UIColor *)color
                        scale:(CGFloat)scale
{
  return [self menuIconFromSize:size
                          color:color
                    shadowColor:[UIColor blackColor]
                   shadowOffset:CGSizeMake(0, 1)
                     shadowBlur:1.f
                          scale:0.f];
}

+ (UIImage *)menuIconFromSize:(CGSize)size
                        color:(UIColor *)color
                  shadowColor:(UIColor *)shadowColor
                 shadowOffset:(CGSize)shadowOffset
                   shadowBlur:(CGFloat)shadowBlur
                        scale:(CGFloat)scale;
{
	UIImage *defaultImage = nil;
  
  // create a new bitmap image context at the device resolution (retina/non-retina)
  UIGraphicsBeginImageContextWithOptions(size, NO, scale);

  // get context
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  
  // push context to make it current
  // (need to do this manually because we are not drawing in a UIView)
  UIGraphicsPushContext(ctx);

  int lineCount = 3;
  const CGFloat offset = (size.height-2*shadowBlur)/(lineCount*2+1);
  const CGFloat padding = offset/2;
  CGRect lineRect = CGRectMake(padding, offset, size.width-offset, offset);

  /* Border and shadow */
  CGContextSaveGState(ctx);
  {
    while (lineCount-->0) {
      UIBezierPath *
      path = [UIBezierPath bezierPathWithRect:lineRect];
      CGContextAddPath(ctx, path.CGPath);
      CGContextSetShadowWithColor(ctx, shadowOffset, shadowBlur, shadowColor.CGColor);
      CGContextSetFillColorWithColor(ctx, color.CGColor);
      CGContextDrawPath(ctx, kCGPathFill);
      
      lineRect.origin.y += offset*2;
    }
  }
  CGContextRestoreGState(ctx);

  // pop context
  UIGraphicsPopContext();

  defaultImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return defaultImage;
}

@end
