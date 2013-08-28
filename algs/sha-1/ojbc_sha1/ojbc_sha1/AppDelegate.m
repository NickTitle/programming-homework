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
    [self saltAndHashRequest:@"Should I wear these jeans again tomorrow?" nTimes:10];
}

-(void)singleHash {
    NSString *request = @"Should I wear these jeans again tomorrow?";
    NSString *validation = [ShaMachine sha1:request];
    
    NSLog(@"\nValidating request:%@",request);
    NSLog(@"\n%@", [ShaMachine sha1ValidityTest:request andHash:validation]);
}

-(void)saltAndHashRequest:(NSString *)request nTimes:(int)n {
        NSLog(@"Hashing request:%@", request);
    for (int i=0; i<n; i++) {
        NSString *result = [ShaMachine sha1RandSalt:request];
        NSLog(@"Result:%@", result);
        request = result;
    }
}

@end
