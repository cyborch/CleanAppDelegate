//
//  AppDelegate.m
//  AppServicesSwift
//
//  Created by Anders Borch on 30/08/2019.
//  Copyright © 2019 Anders Borch. All rights reserved.
//

#import "AppServicesSwift-Swift.h"

@implementation AppDelegate (Forward)

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    for (UIResponder<UIApplicationDelegate> *service in self.services) {
        if ([service respondsToSelector: anInvocation.selector]) {
            [anInvocation invokeWithTarget: service];
        }
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    for (UIResponder<UIApplicationDelegate> *service in self.services) {
        if ([service respondsToSelector: aSelector]) {
            return [service methodSignatureForSelector: aSelector];
        }
    }
    return [super methodSignatureForSelector: aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([super respondsToSelector: aSelector]) return YES;
    for (UIResponder<UIApplicationDelegate> *service in self.services) {
        if ([service respondsToSelector: aSelector]) {
            return YES;
        }
    }
    return NO;
}
@end
