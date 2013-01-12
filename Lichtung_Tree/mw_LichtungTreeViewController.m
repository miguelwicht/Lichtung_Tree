//
//  mw_LichtungTreeViewController.m
//  Lichtung_Tree
//
//  Created by Miguel dos Santos Vaz Dias Wicht on 11.01.13.
//  Copyright (c) 2013 Miguel dos Santos Vaz Dias Wicht. All rights reserved.
//

#import "mw_LichtungTreeViewController.h"
#import "mw_LichtungTreeView.h"
#import <QuartzCore/QuartzCore.h>
#include <stdlib.h>

@interface mw_LichtungTreeViewController ()

@end

@implementation mw_LichtungTreeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    treeView = [[mw_LichtungTreeView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    [self.view addSubview:treeView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // TODO: clean up views after they have been used or create a pool of views and reuse them
    // create view that will be animated along the "branches"/lines
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(-10, 0, 6, 6)];
    
    // generate random color for the demo
    UIColor *color = [[UIColor alloc] initWithRed:(arc4random() % 256 / 256.0) green:(arc4random() % 256 / 256.0) blue:(arc4random() % 256 / 256.0) alpha:1.0];
    view.backgroundColor = color;
    [self.view addSubview:view];
    
    // define animation properties
    CAKeyframeAnimation *moveAlongPath = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [moveAlongPath setPath:[treeView.bottomPaths[arc4random_uniform(treeView.bottomPaths.count)] CGPath]];
    
    [moveAlongPath setDuration:2.0];
    [moveAlongPath setRotationMode:kCAAnimationRotateAuto];
    moveAlongPath.fillMode = kCAFillModeForwards;
    moveAlongPath.calculationMode = kCAAnimationPaced;
    [[view layer] addAnimation:moveAlongPath forKey:@"moveColorAlongPath"];
    
    // invocation is needed because of the argument
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:
                                [self methodSignatureForSelector:@selector(addColor:)]];
    [invocation setSelector:@selector(addColor:)];
    [invocation setTarget:self];
    [invocation setArgument:&color atIndex:2];   // argument indexing is offset by 2 hidden args
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 invocation:invocation repeats:NO];
    
}

- (void)addColor:(UIColor *)color
{
    // FIXME: calling the function repeatedly can cause crash (if the same path gets used again before the last call removes the last object)
    // maybe copy path to a new temporary array and remove the last object from the original immediately after that, the next call will then use it's own array as well
    // and the different function calls will not interfere with each other
    
    // get random path
    int path = arc4random_uniform(treeView.nodeConnectionPaths.count);
    
    // if there are still unfinished paths/routes
    if (treeView.nodeConnectionPaths.count != 0)
    {
        for (int i = 0; i < [treeView.nodeConnectionPaths[path] count]; i++)
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC / 2 * i), dispatch_get_main_queue(), ^{
                if (i > 0) treeView.colors[[[treeView.nodeConnectionPaths[path] objectAtIndex:i-1] integerValue]] = [UIColor whiteColor];
                treeView.colors[[[treeView.nodeConnectionPaths[path] objectAtIndex:i] integerValue]] = color;
                [treeView setNeedsDisplay];
            });
        }
        
        // remove last object of the path after it has been recolored
        // FIXME: find better way then delay (callback?) to safely remove last object
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC / 2 * [treeView.nodeConnectionPaths[path] count] + 0.5), dispatch_get_main_queue(), ^{
            [treeView.nodeConnectionPaths[path] removeLastObject];
            if ([treeView.nodeConnectionPaths[path] count] == 0) {
                [treeView.nodeConnectionPaths removeObjectAtIndex:path];
            }
        });
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
