execName := a.out

build:
	gcc -g -Os -static -nostdlib -nostdinc -fno-pie -no-pie -mno-red-zone -fno-omit-frame-pointer -pg -mnop-mcount -o hello.com.dbg main.c -fuse-ld=bfd -Wl,-T,ape.lds -include cosmopolitan.h crt.o ape.o cosmopolitan.a
	objcopy -S -O binary hello.com.dbg $(execName)
	
debug: build
	blinken -tRv $(execName)
