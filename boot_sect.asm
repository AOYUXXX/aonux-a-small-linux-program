[org 0x7c00]
;引导打印
mov ah, 0x0e ;进入tty模式
mov al, 'A'
int 0x10
mov al, 'O'
int 0x10
mov al, 'N'
int 0x10
mov al, 'U'
int 0x10
mov al, 'X'
int 0x10

jump $ ;无限循环
;引导程序
;引导程序必须放在0x7c00地址处，引导扇区512字节，引导程序446字节，引导扇区结束标志2字节
;引导程序必须以0xaa 0x55结尾

loop:
    jump loop

;共512字节，前面446字节为引导程序，后面64字节为磁盘分区表，最后2字节为引导扇区结束标志
times 510-($-$$) db 0
;都是以aa 55结尾
dw 0xaa55


