//
//  HomeWindowController.m
//  XCWebSpider
//
//  Created by alexiuce on 2020/4/23.
//  Copyright © 2020 alexiuce. All rights reserved.
//

#import "HomeWindowController.h"

@interface HomeWindowController ()
@property (weak) IBOutlet NSToolbar *toolBar;

@end

@implementation HomeWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    NSButton *closeBtn = [self.window standardWindowButton:NSWindowCloseButton];
    closeBtn.target = self;
    [closeBtn setAction:@selector(closeApp)];
}

- (void)closeApp{
    [NSApp terminate:nil];
}



@end
