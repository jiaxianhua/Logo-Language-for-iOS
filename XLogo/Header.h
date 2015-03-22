//
//  Header.h
//  XLogo
//
//  Created by GnuHua on 15/3/21.
//  Copyright (c) 2015年 jiaxianhua. All rights reserved.
//

#ifndef XLogo_Header_h
#define XLogo_Header_h


#ifdef __OBJC__
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

#endif


typedef UIBezierPath NSBezierPath;
typedef CGPoint NSPoint;
typedef UIColor NSColor;
typedef CGRect NSRect;



#define NSRoundLineCapStyle kCGLineCapRound
#define NSRoundLineJoinStyle kCGLineJoinRound
#define NSRectFill UIRectFill
#define lineToPoint addLineToPoint
#define NSTextView UITextView
#define NSMakePoint CGPointMake
#define colorWithCalibratedRed colorWithRed

#endif
