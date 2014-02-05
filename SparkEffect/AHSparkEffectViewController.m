//
//  AHSparkEffectViewController.m
//  SparkEffect
//
//  Created by Alex Hsieh on 2/5/14.
//  Copyright (c) 2014 Alex Hsieh. All rights reserved.
//

#import "AHSparkEffectViewController.h"
#import "AHSparkEffect/AHSparkEffect.h"

@interface AHSparkEffectViewController ()
@property (weak, nonatomic) IBOutlet UIView *sparkView;

@end

@implementation AHSparkEffectViewController

-(void)viewDidAppear:(BOOL)animated {
    [AHSparkEffect addSparkEffectWithinRectangle:self.sparkView];
}

@end
