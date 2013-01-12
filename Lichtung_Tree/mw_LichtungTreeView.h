//
//  mw_LichtungTreeView.h
//  Lichtung_Tree
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 11.01.13.
//  Copyright (c) 2013 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mw_LichtungTreeView : UIView
{

}
@property (nonatomic) NSMutableArray *colors;
@property (nonatomic) NSMutableArray *bottomPaths;
@property (nonatomic) NSMutableArray *nodeConnectionPaths;


- (void) drawTriangleWithPoint1:(CGPoint)point1 Point2: (CGPoint)point2 AndPoint3: (CGPoint)point3 inContext:(CGContextRef)context;
@end
