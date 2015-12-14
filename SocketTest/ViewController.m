//
//  ViewController.m
//  SocketTest
//
//  Created by jadefan on 15/12/13.
//  Copyright © 2015年 jadefan. All rights reserved.
//

#import "ViewController.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <unistd.h>
#import "Singleton.h"
#import "AsyncSocket.h"

@interface ViewController ()<AsyncSocketDelegate>
{
    AsyncSocket *socket;
    NSData *data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [Singleton sharedInstance].socketHost = @"www.baidu.com";// host设定
    [Singleton sharedInstance].socketPort = 80;// port设定
    
    // 在连接前先进行手动断开
    [Singleton sharedInstance].socket.userData = SocketOfflineByUser;
    [[Singleton sharedInstance] cutOffSocket];
    
    // 确保断开后再连，如果对一个正处于连接状态的socket进行连接，会出现崩溃
    [Singleton sharedInstance].socket.userData = SocketOfflineByServer;
    [[Singleton sharedInstance] socketConnectHost];
    
//    AsyncSocket *socket=[[AsyncSocket alloc] initWithDelegate:self];
//    [socket connectToHost:@"www.baidu.com" onPort:80 error:nil];
//    
//    [socket readDataWithTimeout:3 tag:1];
//    [socket writeData:[@"GET / HTTP/1.1\n\n" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:3 tag:1];
    
    
//    socket=[[AsyncSocket alloc] initWithDelegate:self];
//    [socket connectToHost:@"www.baidu.com" onPort:80 error:nil];
//    
//    data = [NSMutableData dataWithLength:50];
//    
//    [socket readDataToLength:50 withTimeout:5 tag:1];
//    [socket readDataToLength:50 withTimeout:5 tag:2];
//    [socket writeData:[@"GET / HTTP/1.1\n\n" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:3 tag:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
