//
//  AppDelegate.m
//  ojbc_sha1
//
//  Created by Nicholas Esposito on 8/8/13.
//  Copyright (c) 2013 NickTitle. All rights reserved.
//

#import "AppDelegate.h"
#import "ShaMachine.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString *request = @"DEVELOPER ANARCHY";
    NSString *validation = [ShaMachine sha1:request];

    NSLog(@"\nValidating request:%@",request);
    NSLog(@"\n%@", [ShaMachine sha1ValidityTest:request andHash:validation]);
    
}

@end
