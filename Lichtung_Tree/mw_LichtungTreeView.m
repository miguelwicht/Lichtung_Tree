//
//  mw_LichtungTreeView.m
//  Lichtung_Tree
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 11.01.13.
//  Copyright (c) 2013 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#pragma mark -
// TODO: Generate tree from plist
// TODO: plist with triangle points and their default fillColors and strokes
// TODO: Array with Node Connections from plist
// TODO: make tree scalable?
// TODO: remove "whitespace" of the view -> move triangle coordinates to the left and then move the whole view
#pragma mark -

#import "mw_LichtungTreeView.h"

@implementation mw_LichtungTreeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _colors = [[NSMutableArray alloc] init];
        _colors[0] = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        _colors[1] = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1.0];
        _colors[2] = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1.0];
        _colors[3] = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        _colors[4] = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1.0];
        _colors[5] = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        _colors[6] = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        _colors[7] = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1.0];
        _colors[8] = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1.0];
        _colors[9] = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        _colors[10] = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        _colors[11] = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1.0];
        _colors[12] = [UIColor colorWithRed:0.65 green:0.65 blue:0.65 alpha:1.0];
        
        
        // define the connections through which the colors can pass
        _nodeConnectionPaths = [[NSMutableArray alloc] initWithCapacity:13];
        [_nodeConnectionPaths addObject:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:0], nil]];
        [_nodeConnectionPaths addObject:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:2],[NSNumber numberWithInt:3], nil]];
        [_nodeConnectionPaths addObject:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:7],[NSNumber numberWithInt:6],[NSNumber numberWithInt:4], nil]];
        [_nodeConnectionPaths addObject:[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:8],[NSNumber numberWithInt:9],[NSNumber numberWithInt:12],[NSNumber numberWithInt:11],[NSNumber numberWithInt:10], nil]];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 
     CGContextRef context = UIGraphicsGetCurrentContext();   // reset context everytime view gets drawn
     context = UIGraphicsGetCurrentContext();
//    [[UIColor blackColor] setFill];
//     CGContextFillRect(context, rect);
     CGContextClearRect(context, rect);
     CGContextSetLineWidth(context, 1.0);
     
     // TODO: Rename triangles
     
     // white triangles
     //
     // triangl1
     CGContextSetFillColorWithColor(context, [_colors[0] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(422, 300) Point2:CGPointMake(546, 108) AndPoint3:CGPointMake(661, 177) inContext:context];
     
     // triangl4
     CGContextSetFillColorWithColor(context, [_colors[3] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(720, 74) Point2:CGPointMake(720, 114) AndPoint3:CGPointMake(546, 106) inContext:context];
     
     //triangle6
     CGContextSetFillColorWithColor(context, [_colors[5] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(664, 176) Point2:CGPointMake(721, 116) AndPoint3:CGPointMake(750, 191) inContext:context];
     
     //triangle6.2
     CGContextSetFillColorWithColor(context, [_colors[6] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(806, 160) Point2:CGPointMake(722, 116) AndPoint3:CGPointMake(751, 191) inContext:context];
     
     //triangle9
     CGContextSetFillColorWithColor(context, [_colors[9] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(752, 193) Point2:CGPointMake(844, 181) AndPoint3:CGPointMake(900, 266) inContext:context];
     
     //triangle10
     CGContextSetFillColorWithColor(context, [_colors[10] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(845, 180) Point2:CGPointMake(947, 167) AndPoint3:CGPointMake(908, 216) inContext:context];
     
     // grey triangles
     //
     // triangl2
     CGContextSetFillColorWithColor(context, [_colors[1] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(545, 238) Point2:CGPointMake(660, 179) AndPoint3:CGPointMake(608, 244) inContext:context];
     
     // triangl3
     CGContextSetFillColorWithColor(context, [_colors[2] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(547, 107) Point2:CGPointMake(662, 176) AndPoint3:CGPointMake(720, 115) inContext:context];
     
     // triangle5
     CGContextSetFillColorWithColor(context, [_colors[4] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(721, 74) Point2:CGPointMake(721, 114) AndPoint3:CGPointMake(808, 159) inContext:context];

     //triangle7
     CGContextSetFillColorWithColor(context, [_colors[7] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(751, 192) Point2:CGPointMake(807, 160) AndPoint3:CGPointMake(842, 180) inContext:context];
 
     //triangle8
     CGContextSetFillColorWithColor(context, [_colors[8] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(750, 193) Point2:CGPointMake(817, 226) AndPoint3:CGPointMake(793, 308) inContext:context];
     
     //triangle12
     CGContextSetFillColorWithColor(context, [_colors[12] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(837, 237) Point2:CGPointMake(872, 280) AndPoint3:CGPointMake(900, 267) inContext:context];
     
     //triangle11
     CGContextSetFillColorWithColor(context, [_colors[11] CGColor]);
     [self drawTriangleWithPoint1:CGPointMake(846, 182) Point2:CGPointMake(910, 219) AndPoint3:CGPointMake(901, 265) inContext:context];
     
     
    #pragma mark - draw lines
     
     _bottomPaths = [[NSMutableArray alloc] initWithCapacity:3];
     CGContextSaveGState(context);
   //  CGContextTranslateCTM(context, 50, 50);
     
     // bottomPaths[0]
     [_bottomPaths addObject:[[UIBezierPath alloc] init]];
     CGPoint startPoint = CGPointMake(660, 450);
     [_bottomPaths[0] moveToPoint:startPoint];
     [_bottomPaths[0] addCurveToPoint:CGPointMake(660, 180) controlPoint1:CGPointMake(startPoint.x-40, startPoint.y-100) controlPoint2:CGPointMake(startPoint.x+40, startPoint.y-100)];
     [_bottomPaths[0] setLineWidth:2.0];
     [[UIColor whiteColor] setStroke];
     [_bottomPaths[0] stroke];
     
     // bottomPaths[1]
     [_bottomPaths addObject:[[UIBezierPath alloc] init]];
     startPoint = CGPointMake(650, 450);
     [_bottomPaths[1] moveToPoint:startPoint];
     [_bottomPaths[1] addCurveToPoint:CGPointMake(665, 180) controlPoint1:CGPointMake(startPoint.x+40, startPoint.y-100) controlPoint2:CGPointMake(startPoint.x-40, startPoint.y-100)];
     [_bottomPaths[1] setLineWidth:2.0];
     [[UIColor whiteColor] setStroke];
     [_bottomPaths[1] stroke];
     
     // bottomPaths[2]
     [_bottomPaths addObject:[[UIBezierPath alloc] init]];
     startPoint = CGPointMake(645, 450);
     [_bottomPaths[2] moveToPoint:startPoint];
     [_bottomPaths[2] addCurveToPoint:CGPointMake(670, 180) controlPoint1:CGPointMake(startPoint.x-30, startPoint.y-80) controlPoint2:CGPointMake(startPoint.x+40, startPoint.y-120)];
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

@end
