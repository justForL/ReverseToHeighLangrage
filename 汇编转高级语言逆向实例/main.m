//
//  main.m
//  汇编转高级语言逆向实例
//
//  Created by james on 2018/4/25.
//  Copyright © 2018年 james. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int global = 10;

#pragma mark - 定义一个求和函数
int sum(int a, int b) {
    int c = global + b;
    return c + a;
}

int main(int argc, char * argv[]) {

    int c = sum(10, 20);
    printf("%d",c);
    
    return 0;
}
