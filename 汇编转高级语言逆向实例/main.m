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



void * globala;

int function(int a, int b) {
    // 标识函数开始的地方
    // __text:0000000100006880 _sum                                    ; CODE XREF: _main+28↓p
    // __text:0000000100006880            工具替我们生成的助记符,先不用动
    // __text:0000000100006880 var_C           = -0xC
    // __text:0000000100006880 var_8           = -8
    // __text:0000000100006880 var_4           = -4
    // __text:0000000100006880
    
    int w0,w1;
    //拉伸栈控件
    // __text:0000000100006880                 SUB             SP, SP, #0x10
    
    //ADRP  +   ADD   一般这两句同时出现的时候,要结合着看,   旨在去常量区或者全局区 取值
    // __text:0000000100006884                 ADRP            X8, #_global@PAGE
    // __text:0000000100006888                 ADD             X8, X8, #_global@PAGEOFF
    
    //将参数w0入栈
    // __text:000000010000688C                 STR             W0, [SP,#0x10+var_4]
    // int var_4 = w0;
    //将参数w1入栈
    // __text:0000000100006890                 STR             W1, [SP,#0x10+var_8]
    // int var_8 = w1
    //将x8的数据存入到w0寄存器     x8现在是global的值
    // __text:0000000100006894                 LDR             W0, [X8]
    // w0 = global;
    //将var_8的值存入到w1寄存器   var_8的值 是w1的参数
    // __text:0000000100006898                 LDR             W1, [SP,#0x10+var_8]
    // w1 = var_8;
    
    //                将wo与w1相加 赋值到w0中    相当于global+w1
    // __text:000000010000689C                 ADD             W0, W0, W1
    // w0 = w0 + w1;
    
    //                    将w0的值入栈保护
    // __text:00000001000068A0                 STR             W0, [SP,#0x10+var_C]
    // int var_C = w0;
    
    //      w0 出栈
    // __text:00000001000068A4                 LDR             W0, [SP,#0x10+var_C]
    // w0 = var_C;
    //将参数1出栈到w1 中
    // __text:00000001000068A8                 LDR             W1, [SP,#0x10+var_4]
    // w1 = var_4;
    //w0 + w1 赋值到  w0
    // __text:00000001000068AC                 ADD             W0, W0, W1
    w0 = globala + w1 + w0;
    
    //栈平衡
    // __text:00000001000068B0                 ADD             SP, SP, #0x10
    // __text:00000001000068B4                 RET
    return w0;
}


int main(int argc, char * argv[]) {

//    int c = sum(10, 20);
    int c = function(10, 20);
    printf("%d",c);
    
    return 0;
}
