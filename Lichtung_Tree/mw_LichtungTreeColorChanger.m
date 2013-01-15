//
//  mw_LichtungTreeColorChanger.m
//  Lichtung_Tree
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 15.01.13.
//  Copyright (c) 2013 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "mw_LichtungTreeColorChanger.h"
#import "mw_LichtungTreeView.h"

@implementation mw_LichtungTreeColorChanger

- (id)init
{
    self = [super init];
    if (self) {
        // do stuff
    }
    return self;
}

- (void)startAnimationOnTree:(mw_LichtungTreeView *)tree WithColor:(UIColor *)color onPath:(NSArray *)path
{
    for (int i = 0; i < [path count]; i++)
    {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC / 2 * i), dispatch_get_main_queue(), ^{
            if (i > 0) tree.colors[[[path objectAtIndex:i-1] integerValue]] = tree.defaultColors[[[path objectAtIndex:i-1] integerValue]];
            tree.colors[[[path objectAtIndex:i] integerValue]] = color;
            [tree setNeedsDisplay];
        });
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC / 2 * [path count] + 0.5), dispatch_get_main_queue(), ^{
        [tree.currentAnimationPaths removeObject:self];
    });
}

@end
