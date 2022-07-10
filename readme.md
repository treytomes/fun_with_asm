# Linux Assembly Language Experiments

Various things I'm trying to do from pure assembly language in a Lubuntu terminal.

`apt install nasm` if you want to follow along.

I'll be running these experiments from a 64-bit system running as root that boots directly to the terminal.

# Example 1: hello.asm

Writes "Hello, world!" to the console using only system calls.

`nasm -felf64 hello.asm && ld hello.o && ./a.out

