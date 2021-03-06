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


#import "UIButton+ImagePrototypes.h"
#import "UIImage+Buttons.h"

@implementation UIButton (ImagePrototypes)

#pragma mark -
#pragma mark close button

- (void)setCloseButton
{
  [self setCloseButtonForSize:MAX(30, MIN(self.bounds.size.width, self.bounds.size.height))];
}

- (void)setCloseButtonForSize:(CGFloat)size
{
  [self setCloseButtonForSize:size
              backgroundColor:[UIColor blackColor]
                    lineColor:[UIColor whiteColor]];
}

- (void)setCloseButtonForSize:(CGFloat)size
              backgroundColor:(UIColor *)backgroundColor
                    lineColor:(UIColor *)lineColor
{
  const CGFloat padding = size / 10.f;
  const CGFloat lineSize = size / 20.f;
  
  UIImage *iNorm = [UIImage closeButton:backgroundColor
                              lineColor:lineColor
                               lineSize:lineSize
                            shadowColor:[UIColor blackColor]
                           shadowOffset:CGSizeMake(0, padding / 7.f)
                             shadowBlur:MIN(padding, 5.f)
                                   size:size
                                padding:padding
                                  scale:0];

  UIImage *iPrs  = [UIImage closeButton:backgroundColor
                              lineColor:lineColor
                               lineSize:lineSize
                            shadowColor:[UIColor blackColor]
                           shadowOffset:CGSizeMake(1, padding / 10.f)
                             shadowBlur:MIN(padding, 5.f)
                                   size:size
                                padding:padding
                                  scale:0];
  
  [self setImage:iNorm forState:UIControlStateNormal];
  [self setImage:iPrs forState:UIControlStateSelected | UIControlStateHighlighted];
}

#pragma mark -
#pragma mark menu button

- (void)setMenuButton
{
  [self setMenuButton:CGSizeMake(self.bounds.size.width, self.bounds.size.height)
                color:[UIColor blackColor]];
}

- (void)setMenuButton:(CGSize)size
                color:(UIColor *)color
{
  UIImage *iNorm = [UIImage menuIconFromSize:size
                                       color:color
                                 shadowColor:[UIColor grayColor]
                                shadowOffset:CGSizeMake(0, size.height/30.f)
                                  shadowBlur:size.height/40.f
                                       scale:0.f];
  
  UIImage *iPrs  = [UIImage menuIconFromSize:size
                                       color:color
                                 shadowColor:[UIColor grayColor]
                                shadowOffset:CGSizeMake(0, -size.height/40.f)
                                  shadowBlur:size.height/50.f
                                       scale:0.f];
  
  [self setImage:iNorm forState:UIControlStateNormal];
  [self setImage:iPrs forState:UIControlStateSelected | UIControlStateHighlighted];
}

@end
