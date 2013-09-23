//
//  Theme.m
//  Beautify
//
//  Created by Chris Grant on 28/02/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "BYTheme.h"
#import "BYConfigParser.h"
#import "BYSwitchStyle.h"
#import "BYLabelStyle.h"
#import "BYViewControllerStyle.h"
#import "BYNavigationBarStyle.h"
#import "BYButtonStyle.h"
#import "BYTextFieldStyle.h"
#import "BYSliderStyle.h"
#import "BYBarButtonStyle.h"
#import "BYTableViewCellStyle.h"
#import "BYImageViewStyle.h"

@implementation BYTheme

+(BYTheme *)fromDictionary:(NSDictionary *)dict {
    NSDictionary *themeDict = dict[@"theme"];
    BYTheme* theme = [BYConfigParser parseStyleObjectPropertiesOnClass:[BYTheme class]
                                                              fromDict:themeDict];
    return theme;
}

+(BYTheme *)fromFile:(NSString *)file {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:file ofType:@"json"];
    NSData* json = [NSData dataWithContentsOfFile:filePath];
    
    BYTheme* theme = nil;
    if (json) {
        NSError* jsonError;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:json
                                                             options:NSJSONReadingAllowFragments
                                                               error:&jsonError];
        if (jsonError) {
            NSLog(@"Error: Could not parse JSON! %@", jsonError.debugDescription);
        } else {
            theme = [self fromDictionary:dict];
        }
    } else {
        NSLog(@"[BYTheme fromFile] failed - unable to load file");
    }
    return theme;
}

-(id)init {
    if (self = [super init]) {
        _name = @"DEFAULT";
        self.buttonStyle = [BYButtonStyle defaultSystemStyle];
        self.switchStyle = [BYSwitchStyle defaultStyle];
        self.labelStyle = [BYLabelStyle defaultStyle];
        self.viewControllerStyle = [BYViewControllerStyle defaultStyle];
        self.textFieldStyle = [BYTextFieldStyle defaultStyle];
        self.navigationBarStyle = [BYNavigationBarStyle defaultStyle];
        self.tableViewCellStyle = [BYTableViewCellStyle defaultStyle];
        self.imageViewStyle = [BYImageViewStyle defaultStyle];
        self.barButtonItemStyle = [BYBarButtonStyle defaultCustomStyle];
        self.sliderStyle = [BYSliderStyle defaultStyle];
    }
    return self;
}

-(NSString*)description {
    return self.name;
}

-(id)copyWithZone:(NSZone *)zone {
    BYTheme *theme = [[[self class] allocWithZone:zone] init];
    theme.name = self.name.copy;
    theme.buttonStyle = self.buttonStyle.copy;
    theme.switchStyle = self.switchStyle.copy;
    theme.labelStyle = self.labelStyle.copy;
    theme.viewControllerStyle = self.viewControllerStyle.copy;
    theme.textFieldStyle = self.textFieldStyle.copy;
    theme.navigationBarStyle = self.navigationBarStyle.copy;
    theme.tableViewCellStyle = self.tableViewCellStyle.copy;
    theme.imageViewStyle = self.imageViewStyle.copy;
    theme.barButtonItemStyle = self.barButtonItemStyle.copy;
    theme.sliderStyle = self.sliderStyle.copy;
    return theme;
}

@end