# TSArray


``` objc
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

```


``` sh
2017-07-24 10:23:25.531356+0800 ThreadSafeArrayDemo[2301:696743] show
2017-07-24 10:23:25.531847+0800 ThreadSafeArrayDemo[2301:696743] 数组1
2017-07-24 10:23:25.532807+0800 ThreadSafeArrayDemo[2301:696743] 数组2
2017-07-24 10:23:25.533014+0800 ThreadSafeArrayDemo[2301:696743] 数组3
2017-07-24 10:23:25.533145+0800 ThreadSafeArrayDemo[2301:696743] 数组4
2017-07-24 10:23:25.533370+0800 ThreadSafeArrayDemo[2301:696743] 数组5
2017-07-24 10:23:25.533503+0800 ThreadSafeArrayDemo[2301:696743] 数组6
2017-07-24 10:23:25.533626+0800 ThreadSafeArrayDemo[2301:696743] 数组7
2017-07-24 10:23:25.533748+0800 ThreadSafeArrayDemo[2301:696743] 数组8
2017-07-24 10:23:25.533870+0800 ThreadSafeArrayDemo[2301:696743] 数组9
2017-07-24 10:23:25.533992+0800 ThreadSafeArrayDemo[2301:696743] 数组10

```