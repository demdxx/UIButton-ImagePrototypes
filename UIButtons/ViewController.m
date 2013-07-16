//
//  ViewController.m
//  UIButtons
//
//  Created by Dmitry Ponomarev on 7/15/13.
//  Copyright (c) 2013 demdxx. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ImagePrototypes.h"
#import "UIImage+Buttons.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.btnClose1 setCloseButtonForSize:44];
  [self.btnClose2 setCloseButtonForSize:88
                        backgroundColor:[UIColor colorWithRed:0xf4/255.f green:0xa4/255.f blue:0x60/255 alpha:0.9f]
                              lineColor:[UIColor colorWithRed:0x5f/255.f green:0x9e/255.f blue:0xa0/255 alpha:0.9f]];
  [self.btnClose3 setCloseButtonForSize:132];
  
  [self.btnMenu1 setMenuButton:CGSizeMake(44, 44)
                         color:[UIColor blackColor]];
  [self.btnMenu2 setMenuButton:CGSizeMake(88, 88)
                         color:[UIColor blackColor]];
  [self.btnMenu3 setMenuButton:CGSizeMake(132, 132)
                         color:[UIColor blackColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
