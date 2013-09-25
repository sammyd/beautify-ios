//
//  Shadow.m
//  Beautify
//
//  Created by Chris Grant on 14/03/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "BYShadow.h"

@implementation BYShadow

+(BYShadow *)shadowWithOffset:(CGSize)offset radius:(float)radius color:(UIColor *)color {
    BYShadow *shadow = [BYShadow new];
    shadow.offset = offset;
    shadow.radius = radius;
    shadow.color = color;
    return shadow;
}

-(id)copyWithZone:(NSZone *)zone {
    BYShadow *copy = [[BYShadow allocWithZone:zone] init];
    copy.offset = self.offset;
    copy.radius = self.radius;
    copy.color = self.color.copy;
    return copy;
}

@end