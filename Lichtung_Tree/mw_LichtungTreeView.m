//
//  mw_LichtungTreeView.m
//  Lichtung_Tree
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 11.01.13.
//  Copyright (c) 2013 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#pragma mark -
// TODO: Array with Node Connections from plist
#pragma mark -

#import "mw_LichtungTreeView.h"
#import "mw_LichtungTreeColorChanger.h"
#import <QuartzCore/QuartzCore.h>
#include <stdlib.h>

@implementation mw_LichtungTreeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _path = [[NSBundle mainBundle] bundlePath];
        _finalPath = [_path stringByAppendingPathComponent:@"LichtungTree.plist"];
        _treeData = [NSDictionary dictionaryWithContentsOfFile:_finalPath];
        
        _colors = [[NSMutableArray alloc] init];
        for (NSArray *color in [_treeData objectForKey:@"colors"]) {
            [_colors addObject:[UIColor colorWithRed:[color[0] floatValue] green:[color[1] floatValue] blue:[color[2] floatValue] alpha:[color[3] floatValue]]];
        }
        _defaultColors = [NSArray arrayWithArray:_colors];
        
        // define the connections through which the colors can pass
        _nodeConnectionPaths = [[NSMutableArray alloc] initWithCapacity:4];
        [_nodeConnectionPaths addObject:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:0], nil]];
        [_nodeConnectionPaths addObject:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil]];
        [_nodeConnectionPaths addObject:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:6],[NSNumber numberWithInt:4], nil]];
        [_nodeConnectionPaths addObject:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9],[NSNumber numberWithInt:12],[NSNumber numberWithInt:11],[NSNumber numberWithInt:10], nil]];
        
        _currentAnimationPaths = [[NSMutableArray alloc] init];
        _colorViews = [[NSMutableArray alloc] init];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
     CGContextRef context = UIGraphicsGetCurrentContext();   // reset context everytime view gets drawn
     context = UIGraphicsGetCurrentContext();
     CGContextClearRect(context, rect);
     CGContextSetLineWidth(context, 1.0);
     
     int i = 0;
     for (NSArray *triangle in [_treeData objectForKey:@"triangles"]) {
         CGContextSetFillColorWithColor(context, [_colors[i] CGColor]);
         [self drawTriangleWithPoint1:CGPointMake([triangle[0][0] floatValue], [triangle[0][1] floatValue]) Point2:CGPointMake([triangle[1][0] floatValue], [triangle[1][1] floatValue]) AndPoint3:CGPointMake([triangle[2][0] floatValue], [triangle[2][1] floatValue]) inContext:context];
         i = i+1;
     }
     
    #pragma mark - draw lines
     
     _bottomPaths = [[NSMutableArray alloc] initWithCapacity:3];
     CGContextSaveGState(context);
     CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
   //  CGContextTranslateCTM(context, 50, 50);
     
     // bottomPaths[0]
     [_bottomPaths addObject:[[UIBezierPath alloc] init]];
     CGPoint startPoint = CGPointMake(239, 450);
     [_bottomPaths[0] moveToPoint:startPoint];
     [_bottomPaths[0] addCurveToPoint:CGPointMake(239, 180) controlPoint1:CGPointMake(startPoint.x-40, startPoint.y-100) controlPoint2:CGPointMake(startPoint.x+40, startPoint.y-100)];
     [_bottomPaths[0] setLineWidth:2.0];
     [[UIColor whiteColor] setStroke];
     [_bottomPaths[0] stroke];
     
     // bottomPaths[1]
     [_bottomPaths addObject:[[UIBezierPath alloc] init]];
     startPoint = CGPointMake(229, 450);
     [_bottomPaths[1] moveToPoint:startPoint];
     [_bottomPaths[1] addCurveToPoint:CGPointMake(244, 180) controlPoint1:CGPointMake(startPoint.x+40, startPoint.y-100) controlPoint2:CGPointMake(startPoint.x-40, startPoint.y-100)];
     [_bottomPaths[1] setLineWidth:2.0];
     [[UIColor whiteColor] setStroke];
     [_bottomPaths[1] stroke];
     
     // bottomPaths[2]
     [_bottomPaths addObject:[[UIBezierPath alloc] init]];
     startPoint = CGPointMake(224, 450);
     [_bottomPaths[2] moveToPoint:startPoint];
     [_bottomPaths[2] addCurveToPoint:CGPointMake(249, 180) controlPoint1:CGPointMake(startPoint.x-30, startPoint.y-80) controlPoint2:CGPointMake(startPoint.x+40, startPoint.y-120)];
     [_bottomPaths[2] setLineWidth:2.0];
     [[UIColor whiteColor] setStroke];
     [_bottomPaths[2] stroke];
     
     CGContextRestoreGState(context);
     
     
     
//     _bottomPaths = [[NSMutableArray alloc] initWithCapacity:3];
//     CGContextSaveGState(context);
//     //  CGContextTranslateCTM(context, 50, 50);
//     
//     // bottomPaths[0]
//     [_bottomPaths addObject:[[UIBezierPath alloc] init]];
//     CGPoint startPoint = CGPointMake(650, 450);
//     [_bottomPaths[0] moveToPoint:startPoint];
//     [_bottomPaths[0] addCurveToPoint:CGPointMake(650, 250) controlPoint1:CGPointMake(startPoint.x-40, startPoint.y-100) controlPoint2:CGPointMake(startPoint.x+40, startPoint.y-100)];
//     [_bottomPaths[0] setLineWidth:2.0];
//     [[UIColor whiteColor] setStroke];
//     [_bottomPaths[0] stroke];
//     
//     // bottomPaths[1]
//     [_bottomPaths addObject:[[UIBezierPath alloc] init]];
//     startPoint = CGPointMake(640, 450);
//     [_bottomPaths[1] moveToPoint:startPoint];
//     [_bottomPaths[1] addCurveToPoint:CGPointMake(655, 250) controlPoint1:CGPointMake(startPoint.x+40, startPoint.y-100) controlPoint2:CGPointMake(startPoint.x-40, startPoint.y-100)];
//     [_bottomPaths[1] setLineWidth:2.0];
//     [[UIColor whiteColor] setStroke];
//     [_bottomPaths[1] stroke];
//     
//     // bottomPaths[2]
//     [_bottomPaths addObject:[[UIBezierPath alloc] init]];
//     startPoint = CGPointMake(635, 450);
//     [_bottomPaths[2] moveToPoint:startPoint];
//     [_bottomPaths[2] addCurveToPoint:CGPointMake(660, 250) controlPoint1:CGPointMake(startPoint.x-30, startPoint.y-80) controlPoint2:CGPointMake(startPoint.x+40, startPoint.y-120)];
//     [_bottomPaths[2] setLineWidth:2.0];
//     [[UIColor whiteColor] setStroke];
//     [_bottomPaths[2] stroke];
//     
//     CGContextRestoreGState(context);
     
     
     
//     NSMutableArray *middlePaths = [[NSMutableArray alloc] initWithCapacity:3];
//     CGContextSaveGState(context);
//     CGContextTranslateCTM(context, 50, 50);
//     // middlePaths[0]
//     [middlePaths addObject:[[UIBezierPath alloc] init]];
//     startPoint = CGPointMake(400, 300);
//     [middlePaths[0] moveToPoint:startPoint];
//     [middlePaths[0] addCurveToPoint:CGPointMake(400, 200) controlPoint1:CGPointMake(startPoint.x-40, startPoint.y-100) controlPoint2:CGPointMake(startPoint.x+40, startPoint.y-100)];
//     [middlePaths[0] setLineWidth:1.0];
//     [[UIColor whiteColor] setStroke];
//     [middlePaths[0] stroke];
//     
//     // middlePaths[1]
//     [middlePaths addObject:[[UIBezierPath alloc] init]];
//     startPoint = CGPointMake(390, 300);
//     [middlePaths[1] moveToPoint:startPoint];
//     [middlePaths[1] addCurveToPoint:CGPointMake(405, 200) controlPoint1:CGPointMake(startPoint.x+40, startPoint.y-100) controlPoint2:CGPointMake(startPoint.x-40, startPoint.y-100)];
//     [middlePaths[1] setLineWidth:1.0];
//     [[UIColor whiteColor] setStroke];
//     [middlePaths[1] stroke];
//     
//     // middlePaths[2]
//     [middlePaths addObject:[[UIBezierPath alloc] init]];
//     startPoint = CGPointMake(385, 300);
//     [middlePaths[2] moveToPoint:startPoint];
//     [middlePaths[2] addCurveToPoint:CGPointMake(410, 200) controlPoint1:CGPointMake(startPoint.x-30, startPoint.y-80) controlPoint2:CGPointMake(startPoint.x+40, startPoint.y-120)];
//     [middlePaths[2] setLineWidth:1.0];
//     [[UIColor whiteColor] setStroke];
//     [middlePaths[2] stroke];
//     
//     CGContextRestoreGState(context);
     
}

- (void)addColor:(UIColor *)color
{
    CGFloat duration = 2.0;
    [_colorViews addObject:[[UIView alloc] initWithFrame:CGRectMake(10, 0, 6, 6)]];
    [[_colorViews lastObject] setBackgroundColor:color];
    [self addSubview:[_colorViews lastObject]];
    
    // define animation properties
    CAKeyframeAnimation *moveAlongPath = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [moveAlongPath setPath:[_bottomPaths[arc4random_uniform(_bottomPaths.count)] CGPath]];
    [moveAlongPath setDuration:duration];
    [moveAlongPath setRotationMode:kCAAnimationRotateAuto];
    moveAlongPath.fillMode = kCAFillModeForwards;
    moveAlongPath.calculationMode = kCAAnimationPaced;
    [moveAlongPath setDelegate:self];
    [moveAlongPath setValue:[_colorViews lastObject] forKey:@"view"];
    [[[_colorViews lastObject] layer] addAnimation:moveAlongPath forKey:@"moveColorAlongPath"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * duration), dispatch_get_main_queue(), ^{
        int path = arc4random_uniform(_nodeConnectionPaths.count);
        // if there are still unfinished paths/routes
        if (_nodeConnectionPaths.count != 0)
        {
            [_currentAnimationPaths addObject:[[mw_LichtungTreeColorChanger alloc] init]];
            [[_currentAnimationPaths lastObject] startAnimationOnTree:self WithColor:color onPath:[NSArray arrayWithArray:_nodeConnectionPaths[path]]];
            [_nodeConnectionPaths[path] removeLastObject];
            if ([_nodeConnectionPaths[path] count] == 0)
            {
                [_nodeConnectionPaths removeObjectAtIndex:path];
            }
        }
    });
}

#pragma mark - helpers

- (void) drawTriangleWithPoint1:(CGPoint)point1 Point2: (CGPoint)point2 AndPoint3: (CGPoint)point3 inContext:(CGContextRef)context
{
    CGContextMoveToPoint(context, point1.x, point1.y);
    CGContextAddLineToPoint(context, point2.x, point2.y);
    CGContextAddLineToPoint(context, point3.x, point3.y);
    CGContextAddLineToPoint(context, point1.x, point1.y);
    CGContextClosePath(context);
    
    CGContextDrawPath(context, kCGPathFill);
    CGContextFillPath(context);
}

#pragma mark - delegate methods

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    [[theAnimation valueForKey:@"view"] removeFromSuperview];
    [_colorViews removeObject:[theAnimation valueForKey:@"view"]];
}

@end
