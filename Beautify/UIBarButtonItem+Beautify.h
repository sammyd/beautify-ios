//
//  UIBarButtonItem+Beautify.h
//  Beautify
//
//  Created by Daniel Allsop on 02/08/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYBarButtonItemRenderer.h"

@interface UIBarButtonItem (Beautify)

-(BYBarButtonItemRenderer*)renderer;

/*
 Whether this view is 'immune' to the globally applied theme, i.e. it will maintain the style defined by the
 developer when the UI was designed, either in the Interface Bulder or in code.
 
 This value is recursively passed to all of the subviews of this view. i.e. when setting this value, the same value is
 passed to all of this view's subviews, and all of their subviews etc.
 */
-(BOOL)isImmuneToBeautify;

/*
 Set whether this view is 'immune' to the globally appled theme.
 */
-(void)setImmuneToBeautify:(BOOL)immuneToBeautify;

@end