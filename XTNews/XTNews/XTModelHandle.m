//
//  XTModelHandle.m
//  XTNews
//
//  Created by tage on 14-5-1.
//  Copyright (c) 2014年 XT. All rights reserved.
//

#import "XTModelHandle.h"

@implementation XTModelHandle

+ (void)shareNewsWithURL:(NSURL *)url completionHandle:(XTModelHandleBlock)block{
    //获得一个并行队列，并行队列的执行顺序与其加入队列的顺序相同
    dispatch_queue_t currentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(currentQueue, ^{
        __block NSData *requestData;
        //创建一个可供block访问的可变数组
        __block NSMutableArray *parseArray = @[].mutableCopy;
        //创建一个作业分发队列，以处理不同的请求、解析作业
        dispatch_group_t handleGroup = dispatch_group_create();
        //创建信号量
        dispatch_semaphore_t parseSemaphore = dispatch_semaphore_create(0);
        //请求
        dispatch_block_t requestTask = ^(){
            //获得数据
            requestData = [XTDataLayer shareNewsListDataWithURL:url];
            //发送信号量
            dispatch_semaphore_signal(parseSemaphore);
        };
        //解析
        dispatch_block_t parseTask = ^(){
            //等待信号量
            dispatch_semaphore_wait(parseSemaphore, DISPATCH_TIME_FOREVER);
            if (requestData) {
                NSError *jsonError;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:requestData options:0 error:&jsonError];
                if (!jsonError) {
                    id object = [dic objectForKey:[dic.allKeys firstObject]];
                    for (NSDictionary *subObject in object) {
                        id newsObject = [XTNewsObject shareNewsObjectWithDictionary:subObject];
                        [parseArray addObject:newsObject];
                    }
                }
            }
        };
        //执行请求
        dispatch_group_async(handleGroup, currentQueue, requestTask);
        //执行解析
        dispatch_group_async(handleGroup, currentQueue, parseTask);
        //等待handleGroup执行完成，DISPATCH_TIME_FOREVER表示在handleGroup执行完成前永远等待
        dispatch_group_wait(handleGroup, DISPATCH_TIME_FOREVER);
        
        //block参数不为空
        if (block) {
            //获得主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                //把解析后的数据传给主线程
                block(parseArray);
            });
        }
    });
}


@end
