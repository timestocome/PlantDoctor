//
//  MyScene.m
//  Dynamics2
//
//  Created by Linda Cobb on 2/7/14.
//  Copyright (c) 2014 TimesToCome Mobile. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene
{
    SKSpriteNode*   sunNode;
    SKSpriteNode*   cloudNode;
    SKSpriteNode*   grassNode;
}











-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:0.863 green:0.894 blue:0.910 alpha:1.0];
        
        [self setupGrass];
        [self setupSun];
        
        int rain = arc4random()%3 + 1;
        if ( rain >= 3 ){ [self setupRain]; }
        
        [self setupCloud];

    }
    return self;
}


- (void)setupSun
{
    sunNode = [SKSpriteNode spriteNodeWithImageNamed:@"sun"];
    sunNode.name = @"sun";
    sunNode.position = CGPointMake(self.frame.size.width/3.0, self.frame.size.height * 2.0/3.0);
    
    [self addChild:sunNode];
}



- (void)setupCloud
{
    cloudNode = [SKSpriteNode spriteNodeWithImageNamed:@"cloud"];
    cloudNode.name = @"cloud";
    cloudNode.position = CGPointMake(self.frame.size.width, self.frame.size.height * 9.0/10.0);
    
    [self addChild:cloudNode];
}




- (void)setupGrass
{
    grassNode = [SKSpriteNode spriteNodeWithImageNamed:@"grass"];
    grassNode.name = @"grass";
    grassNode.position = CGPointMake(self.frame.size.width/2.0, 60.0);
    
    [self addChild:grassNode];

}






- (void)update:(NSTimeInterval)currentTime
{
    cloudNode.position = CGPointMake(cloudNode.position.x - 0.05, cloudNode.position.y);
    sunNode.zRotation = sunNode.zRotation - .0005;
}



- (void)setupRain
{
    SKTexture *_rainTexture = [SKTexture textureWithImageNamed:@"rainDrop.png"];
    SKEmitterNode *_emitterNode = [SKEmitterNode new];
    _emitterNode.particleTexture = _rainTexture;
    _emitterNode.particleBirthRate = 10.0;
    _emitterNode.particleColor = [SKColor whiteColor];
    _emitterNode.particleSpeed = -50;
    _emitterNode.particleSpeedRange = 150;
    _emitterNode.particleLifetime = 20.0;
    _emitterNode.particleScale = 0.2;
    _emitterNode.particleAlpha = 0.6;
    _emitterNode.particleAlphaRange = 0.8;
    _emitterNode.particleColorBlendFactor = 1;
    _emitterNode.particleScale = 0.2;
    _emitterNode.particleScaleRange = 0.5;
    _emitterNode.position = CGPointMake(CGRectGetWidth(self.frame) / 2,
                                        CGRectGetHeight(self.frame) + 10);
    _emitterNode.particlePositionRange = CGVectorMake(CGRectGetMaxX(self.frame), 0);
    
    [_emitterNode advanceSimulationTime:20.0];
    [self addChild:_emitterNode];

}








@end
