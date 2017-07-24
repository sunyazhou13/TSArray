//
//  ViewController.m
//  ThreadSafeArrayDemo
//
//  Created by sunyazhou on 2017/7/24.
//  Copyright © 2017年 Kingsoft, Inc. All rights reserved.
//

#import "ViewController.h"
#import "TSArray.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TSArray *safeArray = [[TSArray alloc] init];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (NSInteger i = 0; i < 10; i++){
        dispatch_async(queue, ^{
            NSString *str = [NSString stringWithFormat:@"数组%d",(int) i + 1];
            [safeArray addObject:str];
        });
    }
    
    sleep(1);
    NSLog(@"show");
    
    [safeArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@",obj);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
