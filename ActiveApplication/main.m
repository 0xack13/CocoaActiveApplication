//
//  main.m
//  ActiveApplication
//
//  Created by 0xack13 on 1/30/16.
//  Copyright © 2016 0xack13. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#include<unistd.h>

@interface Foo : NSObject
- (void)run;
@end

@implementation Foo
- (void)run {
    for (NSRunningApplication *currApp in [[NSWorkspace sharedWorkspace] runningApplications]) {
        if ([currApp isActive]) {
            NSLog(@"* %@. Is Active: %@", [currApp localizedName], [currApp isActive]);
        } else {
            NSLog(@"  %@", [currApp localizedName]);
        }
    }
    NSLog(@"---");
}
@end

int main(int argc, char *argv[]) {
    
    sleep(3);
    
    //NSAutoreleasePool *p = [NSAutoreleasePool new];
    
    //Foo *foo = [[Foo new] autorelease];
    Foo *foo = [Foo new];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                      target:foo
                                                    selector:@selector(run)
                                                    userInfo:nil
                                                     repeats:NO];
    [[NSRunLoop mainRunLoop] run];
    //Foo.run();
    //[p release];
}