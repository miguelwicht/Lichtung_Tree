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
    [self.view setBackgroundColor:[UIColor blackColor]];
    _treeView = [[mw_LichtungTreeView alloc] initWithFrame:CGRectMake(421, 0, 612, 768)];
    [self.view addSubview:_treeView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIColor *color = [[UIColor alloc] initWithRed:(arc4random() % 256 / 256.0) green:(arc4random() % 256 / 256.0) blue:(arc4random() % 256 / 256.0) alpha:1.0];
    [_treeView addColor:color];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
