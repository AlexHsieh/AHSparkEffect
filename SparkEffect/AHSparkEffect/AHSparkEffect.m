//
//  AHSparkEffect.m
//  SparkEffect
//
//  Created by Alex Hsieh on 2/5/14.
//  Copyright (c) 2014 Alex Hsieh. All rights reserved.
//

#import "AHSparkEffect.h"

typedef NS_ENUM(NSInteger, AHSparkShapeAndPositionType){
    AHSparkShapeAndPositionTypeOnRectangle  = 1,
    AHSparkShapeAndPositionTypeWithinRectangle
};

@implementation AHSparkEffect

+(void)addSparkEffectWithinRectangle:(UIView *)view {
    if (view) {
        CAEmitterLayer *layer = [self getSparkLayerForSize:view.frame.size withType:AHSparkShapeAndPositionTypeWithinRectangle];
        [view.layer addSublayer:layer];
    }
}

+(void)addSparkEffectOnRectangle:(UIView *)view {
    if (view) {
        CAEmitterLayer *layer = [self getSparkLayerForSize:view.frame.size withType:AHSparkShapeAndPositionTypeOnRectangle];
        [view.layer addSublayer:layer];
    }
}

+(CAEmitterLayer *)getSparkLayerForSize:(CGSize)size withType:(AHSparkShapeAndPositionType)type {
    CAEmitterLayer *layer = [self getSparkLayerForSize:size];
    layer.emitterShape = kCAEmitterLayerRectangle;
     //    Particles are emitted from a rectangle with opposite corners [emitterPosition.x - emitterSize.width/2, emitterPosition.y - emitterSize.height/2, emitterZPosition], [emitterPosition.x + emitterSize.width/2, emitterPosition.y + emitterSize.height/2, emitterZPosition].
    
    if (type == AHSparkShapeAndPositionTypeOnRectangle) {
        layer.emitterMode = kCAEmitterLayerOutline;
    } else if (type == AHSparkShapeAndPositionTypeWithinRectangle){
        layer.emitterMode = kCAEmitterLayerVolume;
    }
    
    return layer;
}


+(CAEmitterLayer *)getSparkLayerForSize:(CGSize)size {
    
    CGPoint pt = CGPointMake(size.width * 0.5, size.height * 0.5);
    
    //Create the emitter layer
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.emitterPosition = pt;
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterSize = CGSizeMake(size.width , size.height);
    
    //Create the emitter cell
    CAEmitterCell* particle = [CAEmitterCell emitterCell];
    
    float lifetime = 2.0;
    float fadeoutDuration = 2.0;
    float alpha = lifetime * (1.0/fadeoutDuration);
    
    particle.birthRate = 10;
    particle.lifetime = lifetime;
    particle.lifetimeRange = 1;
    particle.velocity = 0;
    particle.velocityRange = 0;
    particle.emissionRange = 1;
    particle.scaleSpeed = 0;
    particle.alphaSpeed = (-1.0/fadeoutDuration);
    particle.color = [UIColor colorWithRed:1 green:1 blue:1 alpha:alpha].CGColor;
  
    
    particle.contents = (__bridge id)([UIImage imageNamed:@"spark.png"].CGImage);
    particle.name = @"particle";
    particle.spin = 3.14;
    
    emitter.emitterCells = [NSArray arrayWithObject:particle];

    return emitter;
}


@end
