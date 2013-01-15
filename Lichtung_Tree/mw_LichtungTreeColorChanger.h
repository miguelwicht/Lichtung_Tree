//
//  mw_LichtungTreeColorChanger.h
//  Lichtung_Tree
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 15.01.13.
//  Copyright (c) 2013 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "mw_LichtungTreeView.h"

@interface mw_LichtungTreeColorChanger : NSObject

- (void)startAnimationOnTree:(mw_LichtungTreeView *)tree WithColor:(UIColor *)color onPath:(NSArray *)path;

@end
