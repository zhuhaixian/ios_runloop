//
//  ViewController.m
//  底层原理-多线程
//
//  Created by weconex on 2021/7/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"任务1");
    
    //主队列  先进先出
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    //立马在当前线程执行任务 执行完毕继续往下执行
////    dispatch_sync(queue, ^{
////        NSLog(@"任务2");
////
////    });
//    //异步  在主队列中，等待上一个任务执行完开始执行
//    dispatch_async(queue, ^{
//        NSLog(@"任务2");
//
//    });
//    NSLog(@"任务3");
//
//    for ( int i = 0; i<1000; i++) {
//
//    }
    
//    NSLog(@"任务4");
    
    
    //串队列  先进先出
    dispatch_queue_t queue = dispatch_queue_create(@"myq", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue2 = dispatch_queue_create(@"myq2", DISPATCH_QUEUE_SERIAL);
    //立马在当前线程执行任务 执行完毕继续往下执行
//    dispatch_sync(queue, ^{
//        NSLog(@"任务2");
//
//    });
    //异步  在主队列中，等待上一个任务执行完开始执行
    dispatch_async(queue, ^{
        NSLog(@"任务2");
        dispatch_sync(queue, ^{
            NSLog(@"任务3");
        });
        NSLog(@"任务4");
    });
    NSLog(@"任务5");
    
    for ( int i = 0; i<1000; i++) {
        
    }
    
    NSLog(@"任务6");
    
}
-(void)test{
    NSLog(@"2");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //内部向runloop中添加定时器，子线程没有启动runloop  带有延迟的本质是向runloop中添加定时器
    [self performSelector:@selector(test) withObject:nil afterDelay:0.0];
}
@end
