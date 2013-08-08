//
//  ShaMachine.h
//  ojbc_sha1
//
//  Created by Nicholas Esposito on 8/8/13.
//  Copyright (c) 2013 NickTitle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCrypto.h>

@interface ShaMachine : NSObject

+(NSString *)sha1:(NSString *)src;
+(NSString *)sha1ValidityTest:(NSString *)src andHash:(NSString *)hash;

@end
