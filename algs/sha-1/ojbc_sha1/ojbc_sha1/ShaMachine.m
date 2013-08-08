//
//  ShaMachine.m
//  ojbc_sha1
//
//  Created by Nicholas Esposito on 8/8/13.
//  Copyright (c) 2013 NickTitle. All rights reserved.
//

#import "ShaMachine.h"

#define salt @"sodiumchloride"

@implementation ShaMachine

+(NSString *)sha1:(NSString *)src {


    src = [NSString stringWithFormat:@"%@%@", src, salt];
    
    NSData *data = [src dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, [data length], digest);
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", digest[i]];
    }
    
    
    
    return hash;
}

+(NSString *)sha1ValidityTest:(NSString *)src andHash:(NSString *)validation {
    src = [NSString stringWithFormat:@"%@%@", src, salt];
    
    NSData *data = [src dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, [data length], digest);
    NSMutableString *hash = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [hash appendFormat:@"%02x", digest[i]];
    }
    
    if ([hash isEqualToString:validation]) {
        return @"Request is valid.";
    }
    else {
        return @"Warning: validation failed for request.";
    }
    
}


@end